import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  var currentPage = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  void changeTabIndex(int index) {
    currentPage.value = index;
    currentPage.refresh();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
