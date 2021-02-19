import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/app/global_widgets/item_primary_button.dart';
import 'package:login_app/app/theme/my_styles.dart';

import '../login_controller.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final bool willLogin;

  const LoginButton({Key key, this.text, this.willLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        builder: (_) => Container(
            margin: MyStyles.bodyMargin,
            child: Column(
              children: [
                ItemPrimaryButton(
                  text: text,
                  bgColor: willLogin ? Colors.blue : Colors.grey,
                  borderColor: willLogin ? Colors.blue : Colors.grey,
                  height: 38,
                  onTap: () => _.validate(willLogin),
                ),
              ],
            )));
  }
}
