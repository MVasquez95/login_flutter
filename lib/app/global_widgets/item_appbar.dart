import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_app/app/theme/my_styles.dart';

class AppBarItem extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final String desc;
  final double sizeTitle;
  final FontWeight weightTitle;
  final double elevation;
  final IconData icon;
  final Color bgColor;
  final Color iconColor;
  final String actionText;
  final VoidCallback onTapAction;
  final VoidCallback onBackAction;
  final double height;
  final bool showBack;
  final String msgShowBack;
  final bool row;

  AppBarItem(
      {Key key,
        this.title = '',
        this.desc = '',
        this.sizeTitle = 18.0,
        this.weightTitle = FontWeight.w500,
        this.elevation = 0.0,
        this.icon = Icons.arrow_back,
        this.bgColor = Colors.white,
        this.iconColor = Colors.white,
        this.actionText = '',
        this.onTapAction,
        this.onBackAction,
        this.showBack = true,
        this.msgShowBack = 'Valoración',
        this.row = true,
        this.height = MyStyles.appBarHeight})
      : preferredSize = Size.fromHeight(height),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _AppBarItemState createState() => _AppBarItemState();
}

class _AppBarItemState extends State<AppBarItem> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
        preferredSize: widget.preferredSize,
        child: Container(
          alignment: Alignment.center,
            width: Get.width,
            height: widget.preferredSize.height,
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
            color: widget.bgColor,
            child: (widget.row) ? _row() : _column() //_stackViews()
        ));
  }

  Widget _column() {
    //
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: widget.showBack
                ? widget.onBackAction != null
                ? widget.onBackAction
                : () {
              Get.back();
            }
                : null, //Navigator.pop(context),
            child: Icon(Icons.arrow_back, color: Colors.blue,) //((Icon(widget.icon, color: widget.iconColor)
        ),
        SizedBox(height: 12),
        Row(
          children: [
            Flexible(
              child: Text(
                widget.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: widget.sizeTitle,
                  fontWeight: widget.weightTitle,
                ),
              ),
            ),
            SizedBox(width: 1),
            if (widget.desc.length > 0)
              Text(widget.desc, style: MyStyles.primary_button)
          ],
        )
      ],
    );
  }

  Widget _row() {
    //SvgPicture.asset(MyImages.upgrade_arrow)
    final childContainer = (widget.showBack)
        ? Icon(widget.icon, color: widget.iconColor, size: 48)
        : Align(
        alignment: Alignment.centerLeft,
        child: Text(widget.msgShowBack, style: MyStyles.Text1_bold_30));

    return Row(
      children: [
        GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: widget.showBack
                ? widget.onBackAction != null
                ? widget.onBackAction
                : () {
              Get.back();
            }
                : null, //Navigator.pop(context),
            child: Container(
              //padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: childContainer,
            )),
        SizedBox(width: 8),
        Flexible(
          child: Text(
            widget.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: Colors.black,
                fontSize: widget.sizeTitle,
                fontWeight: widget.weightTitle),
          ),
        ),
      ],
    );
  }
}