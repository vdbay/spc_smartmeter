import 'dart:convert';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:spc_smartmeter/app/utils/spc_utils.dart';

class GrainController extends GetxController {
  Rx<XFile?> uploadedImage = Rx(null);

  Future<void> pickImage() async {
    final picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      uploadedImage.value = image;
    }
  }

  Future<void> analyzeImage() async {
    SPCUtils.showSnackbar('Uploading image...', 'Please wait');
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://img.scada.co.id/api/image/docfile/'));

      request.files.add(
        await http.MultipartFile.fromPath(
            'newimage', uploadedImage.value!.path),
      );
      request.headers['Authorization'] =
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6Iis2MjgxMTIyMjAyMCIsIm5iZiI6MTcwNTkwNzY3OSwiZXhwIjoxNzA4NDk5Njc5LCJpYXQiOjE3MDU5MDc2Nzl9.RbSJIX0JVomj8DB7BC1-Rq80ntYMpAAOJASYOzPDfOU';
      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        SPCUtils.showSnackbar('Success', 'Image uploaded');
        print('Result: ${await response.stream.bytesToString()}');
      } else {
        SPCUtils.showSnackbar('Error', 'Error uploading image');
      }
    } catch (_) {
      SPCUtils.showSnackbar('Error', 'Error uploading image');
    }
  }
}
