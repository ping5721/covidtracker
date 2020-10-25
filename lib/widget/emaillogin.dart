import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class Emaillogin extends StatelessWidget {
  const Emaillogin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(width: 1, color: Colors.grey[200])),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Username", border: InputBorder.none),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(5),
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(width: 1, color: Colors.grey[200])),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Password", border: InputBorder.none),
                obscureText: true,
                obscuringCharacter: '*',
              ),
            ),
            SizedBox(height: 15),
            SubmitButton(),
          ],
        ),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SignInButton(
        Buttons.Email,
        onPressed: () {
          print("EMAIL login");
        },
      ),
    );
  }
}
