import 'package:covid/widget/emaillogin.dart';
import 'package:covid/widget/facebooklogin.dart';
import 'package:covid/widget/gmaillogin.dart';
import 'package:flutter/material.dart';

class Loginscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Emaillogin(),
              FacebookButton(),
              GoogleButton(),
            ],
          ),
        ),
      ),
    );
  }
}
