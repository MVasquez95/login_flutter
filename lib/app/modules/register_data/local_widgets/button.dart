import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/app/global_widgets/item_primary_button.dart';
import 'package:login_app/app/theme/my_styles.dart';

import '../register_controller.dart';

class RegisterButton extends StatelessWidget {
  final String text;
  final bool willLogin;

  const RegisterButton({Key key, this.text, this.willLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
        builder: (_) => Container(
            margin: MyStyles.bodyMargin,
            child: Column(
              children: [
                ItemPrimaryButton(
                  text: text,
                  bgColor: willLogin ? Colors.blue : Colors.grey,
                  borderColor:
                  willLogin ? Colors.blue : Colors.grey,
                  height: 38,
                  onTap: () => _.validate(willLogin),
                ),
              ],
            )));
  }
}