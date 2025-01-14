import 'package:get/get.dart';
import 'package:store_locator/screen/home_screen/controller/home_screen_controller.dart';


class HomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>HomeScreenController());
  }

}