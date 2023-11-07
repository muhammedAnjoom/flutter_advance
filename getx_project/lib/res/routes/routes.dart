import 'package:get/get_navigation/get_navigation.dart';
import 'package:getx_project/res/routes/routes_name.dart';
import 'package:getx_project/view/login_screen.dart';
import 'package:getx_project/view/splash_screen.dart';

class AppRoute {
  static appRoutes() => [
        GetPage(
          name: RouteName.splashScreen,
          page: () => SplashScreen(),
          transitionDuration: Duration(milliseconds: 250),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(
          name: RouteName.loginScreen,
          page: () => LoginScreen(),
          transition: Transition.leftToRightWithFade,
        )
      ];
}
