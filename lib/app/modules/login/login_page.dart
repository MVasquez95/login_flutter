import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/app/theme/my_styles.dart';

import 'local_widget/form_box.dart';
import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginController _controller = LoginController();
    return GetBuilder<LoginController>(
        init: _controller,
        builder: (_) => SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Container(
                      padding: MyStyles.bodyMargin,
                      child: Align(
                        alignment: Alignment.center,
                        child: LoginFormBox(),
                      )),
                ),
              ),
            ));
  }
}
