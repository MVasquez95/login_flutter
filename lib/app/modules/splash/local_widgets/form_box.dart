import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class LogoBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FadeInUp(
              delay: Duration(seconds: 1),
              duration: Duration(seconds: 2),
              child: Icon(Icons.wb_sunny)),
        ],
      ),
    );
  }
}
