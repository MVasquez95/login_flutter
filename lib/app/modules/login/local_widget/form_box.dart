import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/app/route/app_routes.dart';
import 'package:login_app/app/theme/my_strings.dart';
import 'package:login_app/app/theme/my_styles.dart';

import '../login_controller.dart';
import 'button.dart';
import 'field.dart';

class LoginFormBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginController _controller = LoginController();
    return GetBuilder<LoginController>(
      init: _controller,
      builder: (_) => Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: Get.height * 0.2),
            LoginField(
              text: MyStrings.EMAIL,
              index: 0,
              textInputType: TextInputType.emailAddress,
              inputAction: TextInputAction.next,
            ),
            SizedBox(
              height: 15.0,
            ),
            LoginField(
              text: MyStrings.PASSWORD,
              index: 1,
              textInputType: TextInputType.visiblePassword,
              obscure: true,
              inputAction: TextInputAction.done,
            ),
            SizedBox(
              height: 15.0,
            ),
            _.error == true
                ? Column(
                    children: [
                      Text(MyStrings.ERROR_FIELDS,
                          style: MyStyles.BodyText_semiMedium_15.merge(
                              TextStyle(color: Colors.red))),
                      SizedBox(
                        height: 15.0,
                      ),
                    ],
                  )
                : Container(),
            LoginButton(
              text: MyStrings.LOGIN,
              willLogin: _.color,
            ),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(MyStrings.FORGOT_PASSWORD,
                    style: MyStyles.BodyText_semiMedium_15.merge(
                        TextStyle(color: Colors.grey))),
                SizedBox(
                  width: 15.0,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.REGISTER);
                  },
                  child: Text(MyStrings.REGISTER,
                      style: MyStyles.BodyText_semiMedium_15.merge(
                          TextStyle(color: Colors.red))),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
