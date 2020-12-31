import 'package:awesome_login_3/styles/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Input extends HookWidget {
  const Input({Key key, this.hintText, this.icon, this.inputWidth})
      : super(key: key);
  final String hintText;
  final IconData icon;
  final double inputWidth;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 54.0,
      width: inputWidth ?? size.width * .8,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white38),
        borderRadius: kBorderRadius,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white70,
            size: 20.0,
            semanticLabel: 'Email icno',
          ),
          SizedBox(width: 12.0),
          Expanded(
            child: TextField(
              style: TextStyle(color: Colors.white70, fontFamily: 'OpenSans'),
              decoration: InputDecoration.collapsed(
                  hintText: hintText,
                  hintStyle: TextStyle(color: Colors.white30)),
            ),
          )
        ],
      ),
    );
  }
}
