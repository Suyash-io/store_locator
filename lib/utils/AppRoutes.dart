

import 'package:get/get.dart';
import 'package:store_locator/screen/home_screen/view/home_screen.dart';
import 'package:store_locator/utils/home_screen2_binding.dart';
import 'package:store_locator/utils/home_screen_binding.dart';

import '../screen/home_screen/view/home_screen2.dart';

List<GetPage> pages = [
  GetPage(name: AppRoutes.homeScreen, page: ()=>HomeScreen(),binding: HomeScreenBinding()),
  GetPage(name: AppRoutes.homeScreen2, page: ()=>HomeScreen2(),binding: HomeScreen2Binding()),
];

class AppRoutes {

  static String homeScreen = '/homeScreen';
  static String homeScreen2 = '/homeScreen2';
}