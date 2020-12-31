import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import '../Button.dart';
import '../Input.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class SignupContent extends HookWidget {
  const SignupContent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      children: [
        Input(hintText: 'Email address', icon: Feather.at_sign),
        SizedBox(height: 18.0),
        Input(hintText: 'Password', icon: Feather.key),
        SizedBox(height: 18.0),
        Input(hintText: 'Confirm password', icon: Feather.lock),
        SizedBox(height: 30.0),
        Button(
          title: 'Sign up',
          width: size.width * .8,
        )
      ],
    );
  }
}
