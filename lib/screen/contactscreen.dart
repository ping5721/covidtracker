import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({Key key}) : super(key: key);

  @override
  _ContactScreenState createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  TextEditingController _name = TextEditingController();
  TextEditingController _subject = TextEditingController();
  TextEditingController _message = TextEditingController();
  Future sendEmail() async {
    Email submitemail = Email(
      body: _message.text,
      subject: "Contact for more information (COVID-19) from ${_name.text}",
      recipients: ["pongpith@cybertoryth.com"],
    );
    await FlutterEmailSender.send(submitemail);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xffd9354f),
        body: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
                child: Text(
                  "Get in touch!",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Text(
                  "Contact us for more information",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 20, 0, 20),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Contact form",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w800),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 20),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Your name",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                )),
                            Container(
                              margin: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.grey[400]),
                                  borderRadius: BorderRadius.circular(15)),
                              child: TextField(
                                controller: _name,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    icon: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Icon(Icons.person),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 20),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Subject",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                )),
                            Container(
                              margin: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.grey[400]),
                                  borderRadius: BorderRadius.circular(15)),
                              child: TextField(
                                controller: _subject,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    icon: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Icon(Icons.subject),
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 20),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Message",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600),
                                )),
                            Container(
                              height: MediaQuery.of(context).size.height * .2,
                              margin: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.grey[400]),
                                  borderRadius: BorderRadius.circular(15)),
                              child: TextField(
                                keyboardType: TextInputType.multiline,
                                maxLines: 8,
                                controller: _message,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    icon: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Icon(Icons.message),
                                    )),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: RaisedButton(
                                onPressed: () {
                                  sendEmail();
                                  print("pressed");
                                },
                                color: Color(0xffd9354f),
                                child: Text(
                                  "Submit",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
