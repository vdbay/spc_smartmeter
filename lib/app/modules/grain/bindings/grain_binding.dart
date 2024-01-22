import 'package:get/get.dart';

import '../controllers/grain_controller.dart';

class GrainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GrainController>(
      () => GrainController(),
    );
  }
}
