import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:spc_smartmeter/app/common_widgets/spc_elevatedbutton.dart';
import 'package:spc_smartmeter/app/localization/hardcoded.dart';

import '../controllers/grain_controller.dart';

class GrainView extends GetView<GrainController> {
  const GrainView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    bool isDataExist = true;
    return Scaffold(
      appBar: AppBar(
        title: const Text('GrainView'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Obx(
                    () => controller.uploadedImage.value != null
                        ? Image.file(
                            File(controller.uploadedImage.value!.path),
                            fit: BoxFit.scaleDown,
                          )
                        : const Placeholder(),
                  )),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SPCElevatedButton(
                    widthModifier: 0.25,
                    onPressed: () {
                      controller.pickImage();
                    },
                    text: 'Upload'.hardcoded,
                  ),
                  SPCElevatedButton(
                    widthModifier: 0.25,
                    onPressed: () {
                      controller.uploadedImage.value = null;
                    },
                    text: 'Clear'.hardcoded,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SPCElevatedButton(onPressed: () {
                controller.analyzeImage();
              }, text: 'Submit'.hardcoded),
              const Divider(),
              Text('History'.hardcoded, style: Get.textTheme.headlineMedium),
              const Divider(),
              isDataExist
                  ? Expanded(
                      child: SingleChildScrollView(
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              leading: Text(
                                (index + 1).toString(),
                                style: Get.textTheme.bodyLarge,
                              ),
                              title: Text('Grain ${index + 1}'),
                              subtitle: Text(
                                  'Date: 2021-09-01\nAccuracy: ${Random().nextInt(100)}'),
                              trailing: Random().nextInt(3) == 1
                                  ? const Icon(
                                      Icons.cloud_done,
                                      color: Colors.greenAccent,
                                    )
                                  : Random().nextInt(3) == 2
                                      ? const Icon(
                                          Icons.cloud_off_outlined,
                                          color: Colors.redAccent,
                                        )
                                      : const Icon(
                                          Icons.backup_outlined,
                                          color: Colors.orangeAccent,
                                        ),
                            );
                          },
                          itemCount: 10,
                        ),
                      ),
                    )
                  : Expanded(
                      child: Center(
                        child: Text('No History data'.hardcoded),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
