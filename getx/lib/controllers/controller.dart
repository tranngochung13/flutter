import 'package:get/get.dart';

class Controller extends GetxController {
  RxInt count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  increment() => count++;
  @override
  void onClose() {
    super.onClose();
  }
}
