import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/app/theme/my_strings.dart';
import 'package:login_app/app/theme/my_styles.dart';

import '../register_controller.dart';
import 'button.dart';
import 'field.dart';

class RegisterFormBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      builder: (_) => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                MyStrings.LOGIN_TITLE,
                style: MyStyles.Text1_bold_30,
              ),
            ),
            RegisterField(
              text: MyStrings.EMAIL,
              index: 0,
              textInputType: TextInputType.emailAddress,
              inputAction: TextInputAction.next,
              onlyNumbersAndLetters: false,
            ),
            SizedBox(
              height: 15.0,
            ),
            RegisterField(
              text: MyStrings.NAME,
              index: 1,
              textInputType: TextInputType.text,
              inputAction: TextInputAction.next,
            ),
            SizedBox(
              height: 15.0,
            ),
            RegisterField(
              text: MyStrings.LAST_NAME,
              index: 2,
              textInputType: TextInputType.text,
              inputAction: TextInputAction.done,
            ),
            SizedBox(
              height: 15.0,
            ),
            Text(MyStrings.GENDER),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.radio_button_unchecked_sharp,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  MyStrings.GENDER,
                  style: MyStyles.primary_13,
                ),
                SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.radio_button_unchecked_sharp,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  MyStrings.GENDER,
                  style: MyStyles.primary_13,
                ),
              ],
            ),
            _.error == true
                ? Column(
                    children: [
                      SizedBox(
                        height: 15.0,
                      ),
                      Text(MyStrings.ERROR_FIELDS,
                          style: MyStyles.BodyText_semiMedium_15.merge(
                              TextStyle(color: Colors.red))),
                    ],
                  )
                : Container(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            RegisterButton(
              text: MyStrings.NEXT,
              willLogin: _.color,
            ),
          ],
        ),
      ),
    );
  }
}
