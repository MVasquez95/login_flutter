import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/app/global_widgets/item_text_field.dart';
import 'package:login_app/app/modules/register_data/register_controller.dart';
import 'package:login_app/app/theme/my_styles.dart';

class RegisterField extends StatelessWidget {
  final String text;
  final int index;
  final TextInputType textInputType;
  final bool obscure;
  final bool onlyNumbersAndLetters;
  final TextInputAction inputAction;

  const RegisterField(
      {Key key,
        this.text,
        this.index,
        this.textInputType,
        this.obscure,
        this.onlyNumbersAndLetters = false,
        this.inputAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegisterController _controller = RegisterController();
    return GetBuilder<RegisterController>(
      init: _controller,
      builder: (_) => ItemTextField(
        textInputAction: inputAction,
        labelText: text,
        index: index,
        style: _.errorText[index] != null
            ? MyStyles.primary_13.merge(TextStyle(color: Colors.red))
            : MyStyles.primary_13,
        active: _.active,
        controller: _.controller[index],
        focusNode: _.focusNode,
        errorText: _.errorText[index],
        onlyNumbersAndLetter: onlyNumbersAndLetters,
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