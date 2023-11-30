import 'package:get/get.dart';
import 'package:meal_app/res/routes/route_names.dart';
import 'package:meal_app/view/descripiton/decription_screen.dart';
import 'package:meal_app/view/home/home_screen.dart';
import 'package:meal_app/view/splash/splash_screen.dart';

class AppRoute {
  static appRoute() => [
        GetPage(
            name: RouteName.splashScreen,
            page: () => const SplashScreen(),
            // transitionDuration: const Duration(milliseconds: 250),
            transition: Transition.leftToRightWithFade),
        GetPage(
          name: RouteName.homeScreen,
          page: () => HomeScreen(),
          // transition: Transition.
        ),
        GetPage(
          name: RouteName.descripitonScren,
         page: (){
          DescriptionScreen _descriptionScreen = Get.arguments;
          return _descriptionScreen;
         }
        )
      ];
}
