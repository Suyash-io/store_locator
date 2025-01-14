

import 'package:get/get.dart';
import 'package:store_locator/screen/home_screen/view/home_screen.dart';
import 'package:store_locator/utils/home_screen_binding.dart';

List<GetPage> pages = [
  GetPage(name: AppRoutes.homeScreen, page: ()=>HomeScreen(),binding: HomeScreenBinding()),
];

class AppRoutes {

  static String homeScreen = '/homeScreen';
}