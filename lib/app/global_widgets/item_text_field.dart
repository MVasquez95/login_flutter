import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = new StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: new TextSelection.collapsed(offset: string.length));
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = new StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != newText.length) {
        buffer.write(' ');
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: new TextSelection.collapsed(offset: string.length));
  }
}

class ItemTextField extends StatelessWidget {
  final int index;
  final List<bool> active;
  final TextEditingController controller;
  final List<FocusNode> focusNode;
  final TextInputAction textInputAction;
  final VoidCallback setState;
  final VoidCallback onEditComplete;
  final VoidCallback onTapField;
  final bool obscureText;
  final VoidCallback toggle;
  final TextInputType keyboardType;
  final String type;
  final String hintText;
  final int maxLines;
  final String labelText;
  final TextAlign textAlign;
  final TextCapitalization textCapitalization;
  final String errorText;
  final bool isTextArea;
  final bool isEnabled;
  final ValueChanged<String> onChanged;
  final bool onlyNumbers;
  final bool isCard;
  final bool formater;
  final bool onlyNumbersAndLetter;
  final TextStyle style;
  final bool showTitleField;
  final String titleField;
  final TextStyle titleFieldStyle;
  final EdgeInsetsGeometry decorationPadding;
  final String prefixText;
  final int maxLength;

  const ItemTextField(
      {Key key,
        this.active,
        this.controller,
        this.focusNode,
        this.index,
        this.textInputAction = TextInputAction.next,
        this.setState,
        this.obscureText,
        this.toggle,
        this.keyboardType = TextInputType.text,
        this.type = 'text',
        this.hintText = '',
        this.maxLines = 1,
        this.labelText,
        this.textAlign = TextAlign.start,
        this.textCapitalization = TextCapitalization.sentences,
        this.errorText,
        this.isTextArea = false,
        this.isEnabled = true,
        this.onChanged,
        this.onlyNumbers,
        this.onlyNumbersAndLetter = false,
        this.isCard,
        this.formater,
        this.style,
        this.titleField,
        this.titleFieldStyle,
        this.showTitleField = false,
        this.prefixText = '',
        this.decorationPadding,
        this.onEditComplete,
        this.onTapField,
        this.maxLength})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (showTitleField) Text(titleField, style: titleFieldStyle),
        //if(showTitleField) SizedBox(height:14),
        TextFormField(
          inputFormatters: onlyNumbers == true
              ? [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            new LengthLimitingTextInputFormatter(maxLength)
          ]
              : isCard == true
              ? [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            new LengthLimitingTextInputFormatter(19),
            new CardNumberInputFormatter()
          ]
              : formater == true
              ? [
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            new LengthLimitingTextInputFormatter(4),
            new CardMonthInputFormatter()
          ]
              : onlyNumbersAndLetter  ?  [FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9.@]"))] : null,
          onTap: () {
            for (int i = 0; i < active.length; i++) {
              active[i] = (i == index) ? true : false;
            }
            setState();
            onTapField();
          },
          maxLines: maxLines,
          textCapitalization: textCapitalization,
          controller: controller,
          style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
          focusNode: focusNode[index],
          textInputAction: textInputAction,
          textAlign: textAlign,
          onFieldSubmitted: (value) {
            active[index] = false;
            if (index != active.length) {
              active[index + 1] = true;
              FocusScope.of(context).requestFocus(focusNode[index + 1]);
            }
            setState();
          },
          onChanged: onChanged,
          decoration: InputDecoration(
            prefixStyle: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
            prefixText: prefixText,
            contentPadding: decorationPadding,
            suffixIcon: obscureText == null
                ? null
                : IconButton(
              icon: Icon(
                obscureText ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: () => toggle(),
            ),
            enabledBorder: isTextArea
                ? OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 1))
                : UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1)),
            focusedBorder: isTextArea
                ? OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 1))
                : UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 1)),
            border: isTextArea ? OutlineInputBorder() : UnderlineInputBorder(),
            labelText: labelText,
            hintText: hintText,
            labelStyle: style,
            errorText: errorText,
            errorBorder: isTextArea
                ? OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1))
                : UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1)),
            focusedErrorBorder: isTextArea
                ? OutlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1))
                : UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red, width: 1)),
          ),
          keyboardType: keyboardType,
          obscureText: obscureText != null ? obscureText : false,
          enabled: isEnabled,
          onEditingComplete: onEditComplete,
        ),
      ],
    );
  }
}