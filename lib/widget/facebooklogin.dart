import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class FacebookButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SignInButton(
      Buttons.FacebookNew,
      onPressed: () {
        Navigator.popAndPushNamed(context, '/dashboard');
      },
    );
  }
}
