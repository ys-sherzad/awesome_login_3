import 'package:awesome_login_3/styles/common.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({
    Key key,
    this.title,
    this.width,
  }) : super(key: key);

  final String title;
  final double width;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: kBorderRadius,
      child: Container(
        height: 54.0,
        width: width ?? size.width,
        child: Material(
          color: Color(0xfffd6439),
          child: InkWell(
            child: Center(child: Text(title, style: kAuthBtnText)),
            onTap: () {
              print('Button Pressed');
            },
          ),
        ),
      ),
    );
  }
}
