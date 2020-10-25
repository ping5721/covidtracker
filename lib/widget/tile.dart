import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  const Tile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.1,
        color: Colors.grey[100],
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network("https://www.countryflags.io/th/flat/64.png"),
              Text(
                "THAILAND",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text('546(45)'),
              Text('54645'),
              Text('54645')
            ],
          ),
        ));
  }
}
