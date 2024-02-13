import 'package:get/get.dart';
import 'package:habit_hooked/screen/habit_module/home_screen/home_screen.dart';

class Routes {
  Routes._();

  static const String splash = "/splash";
  static const String homeScreen = "/HomeScreen";

  static List<GetPage> pages = [
    GetPage(
        name: homeScreen,
        page: () =>  const HomeScreen(),
        transition: Transition.downToUp),
  ];
}
