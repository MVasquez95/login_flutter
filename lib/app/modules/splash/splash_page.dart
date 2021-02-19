import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/app/modules/splash/splash_controller.dart';

import 'local_widgets/form_box.dart';

class SplashPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (_) => Scaffold(
        backgroundColor: Colors.white,
        body: LogoBox(),
      ),
    );
  }

}