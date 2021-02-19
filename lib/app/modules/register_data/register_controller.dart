import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/app/util/app_helpers.dart';

class RegisterController extends GetxController {
  final _length = 3;
  bool obscure = true;
  bool color = false;
  bool error = false;

  List<bool> _active = [];
  List<TextEditingController> _controller = [];
  List<FocusNode> _focusNode = [];
  List<String> _errorText = [];

  List<bool> get active => _active;

  List<TextEditingController> get controller => _controller;

  List<FocusNode> get focusNode => _focusNode;

  List<String> get errorText => _errorText;

  @override
  void onInit() {
    super.onInit();

    _setVariables();
  }

  void _setVariables() {
    List.generate(_length, (val) => _active.add(false));
    List.generate(_length, (val) => _controller.add(TextEditingController()));
    List.generate(_length, (val) => _focusNode.add(FocusNode()));
    List.generate(_length, (val) => _errorText.add(null));
  }

  void onChange() {
    for (int i = 0; i < _length; i++) _errorText[i] = null;

    bool _emailValid =
    RegExp(AppHelpers.REGEX_EMAIL).hasMatch(_controller[0].text);

    bool aux = _emailValid;

    _errorText[0] = null;
    _errorText[1] = null;
    _errorText[2] = null;
    color = aux &&
        _controller[1].text.length >= 3 &&
        _controller[2].text == _controller[1].text &&
        _controller[2].text.length >= 3;
    error = false;
    update();
  }

  void validate(bool willLogin) {
    bool _isValid = false;
    bool _emailValid =
    RegExp(AppHelpers.REGEX_EMAIL).hasMatch(_controller[0].text);

    _errorText[0] = _emailValid ? null : '';
    _errorText[1] = _controller[1].text.length >= 3 ? null : '';
    _errorText[2] = _controller[2].text == _controller[1].text &&
        _controller[2].text.length >= 3
        ? null
        : '';

    _isValid =
        _errorText[0] == null && _errorText[1] == null && _errorText[2] == null;

    if (_isValid)
      print("Están bien los datos");
    else
      error = true;

    update();
  }

  void toggle() {
    obscure = !obscure;
    update();
  }

  void goToPage(String page) {
    Get.toNamed(page);
  }
}