import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/app/global_widgets/item_appbar.dart';
import 'package:login_app/app/theme/my_styles.dart';

import 'local_widgets/form_box.dart';
import 'register_controller.dart';

class RegisterPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final RegisterController _controller = RegisterController();
    return GetBuilder<RegisterController>(
      init: _controller,
      builder: (_) =>
          Stack(
            children: [
              SafeArea(
                child: Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBarItem(
                    onTapAction: () {
                      Get.back();
                    },
                    bgColor: Colors.white,
                    height: 80,
                    row: false,
                    weightTitle: FontWeight.w700,
                  ),
                  body: SingleChildScrollView(
                    physics: ScrollPhysics(),
                    child: Column(
                      children: <Widget>[
                        Container(
                          padding: MyStyles.bodyMargin,
                          child: RegisterFormBox(),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
    );
  }

}