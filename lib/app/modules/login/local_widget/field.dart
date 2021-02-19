import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/app/global_widgets/item_text_field.dart';
import 'package:login_app/app/theme/my_styles.dart';

import '../login_controller.dart';

class LoginField extends StatelessWidget {
  final String text;
  final int index;
  final TextInputType textInputType;
  final bool obscure;
  final TextInputAction inputAction;

  const LoginField(
      {Key key,
        this.text,
        this.index,
        this.textInputType,
        this.obscure,
        this.inputAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController _controller = LoginController();
    return GetBuilder<LoginController>(
      init: _controller,
      builder: (_) => ItemTextField(
        textInputAction: inputAction,
        labelText: text,
        style: _.errorText[index] != null
            ? MyStyles.primary_13.merge(TextStyle(color: Colors.red))
            : MyStyles.BodyText_semiMedium_15,
        index: index,
        active: _.active,
        controller: _.controller[index],
        focusNode: _.focusNode,
        errorText: _.errorText[index],
        keyboardType: textInputType,
        obscureText: obscure == true ? _.obscure : null,
        textCapitalization: TextCapitalization.none,
        setState: () => _.update(['input']),
        onChanged: (value) => _.onChange(),
        toggle: () => _.toggle(),
      ),
    );
  }
}