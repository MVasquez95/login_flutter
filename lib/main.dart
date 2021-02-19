import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app/modules/splash/splash_binding.dart';
import 'app/modules/splash/splash_page.dart';
import 'app/route/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          accentColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            color: Colors.white,
          ),
          fontFamily: 'TwCenMTStd'),
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      initialBinding: SplashBinding(),
      getPages: AppPages.pages,
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: GlowRemover(),
          child: child,
        );
      },
    );
  }
}

class GlowRemover extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    GlowingOverscrollIndicator(
      color: Colors.transparent,
      axisDirection: AxisDirection.up,
    );
    return child;
  }
}
