import 'package:flutter/material.dart';
import 'package:login_app/app/theme/my_styles.dart';

class ItemPrimaryButton extends StatelessWidget {
  final String text;
  final bool hasIcon;
  final IconData icon;
  final TextStyle style;
  final Color bgColor;
  final Color borderColor;
  final Color textColor;
  final VoidCallback onTap;
  final bool isDisabled;
  final double elevation;
  final double height;
  final double width;

  const ItemPrimaryButton({
    Key key,
    this.text,
    this.hasIcon,
    this.icon,
    this.onTap,
    this.style = MyStyles.primary_button,
    this.bgColor = Colors.blueAccent,
    this.borderColor = Colors.blueAccent,
    this.textColor = Colors.white,
    this.isDisabled = false,
    this.elevation = 0.0,
    this.height = 40.0,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width == null ? MediaQuery.of(context).size.width : width,
      child: ButtonTheme(
        height: height,
        child: RaisedButton(
          color: bgColor,
          elevation: elevation,
          onPressed: () => onTap(),
          disabledColor: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (icon != null)
                Icon(
                  icon,
                  color: Colors.blue,
                ),
              if (icon != null)
                SizedBox(
                  width: 10.0,
                ),
              Text(
                text,
                style: style.merge(TextStyle(
                  color: textColor,
                )),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: borderColor, width: 1, style: BorderStyle.solid),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}