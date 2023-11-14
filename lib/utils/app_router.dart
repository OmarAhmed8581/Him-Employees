
import 'package:face_detection_app/screens/splash.dart';
import 'package:face_detection_app/utils/app_route_name.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    return MaterialPageRoute(
        settings: routeSettings,
        builder: (BuildContext context) {
          switch (routeSettings.name) {

            case AppRouteName.splashScreenRoute:
              return const SplashScreen();
            
            default:
              return Container();
          }
        });
  }
}
