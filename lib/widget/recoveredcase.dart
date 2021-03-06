import 'package:covid/thaicase.dart';
import 'package:covid/widget/cardboard.dart';
import 'package:flutter/material.dart';

class RecoverCase extends StatelessWidget {
  const RecoverCase({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getThaicase(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done)
          return Cardboard(
            MediaQuery.of(context).size.width * 0.27,
            MediaQuery.of(context).size.height * 0.15,
            Colors.white,
            Stack(
              children: [
                Align(
                    alignment: Alignment(0, 0),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            snapshot.data.recovered.toString(),
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            snapshot.data.newconfirmed > 0
                                ? "(+${(snapshot.data.newrecovered.toString())})"
                                : "(-${(snapshot.data.newrecovered.toString())})",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: snapshot.data.newrecovered > 0
                                    ? Colors.green
                                    : Colors.red),
                          ),
                        ],
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Text(
                    'Recover',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            EdgeInsets.fromLTRB(5, 15, 5, 0),
          );
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Cardboard(
            MediaQuery.of(context).size.width * 0.27,
            MediaQuery.of(context).size.height * 0.15,
            Colors.white,
            Center(child: CircularProgressIndicator()),
            EdgeInsets.fromLTRB(5, 15, 5, 0),
          );
        }
        return null;
      },
    );
  }
}
