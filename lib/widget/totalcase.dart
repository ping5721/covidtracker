import 'package:covid/thaicase.dart';
import 'package:covid/widget/cardboard.dart';
import 'package:flutter/material.dart';

class TotalCase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getThaicase(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Cardboard(
            MediaQuery.of(context).size.width * 0.85,
            MediaQuery.of(context).size.height * 0.2,
            Colors.white,
            Stack(
              children: [
                Align(
                    alignment: Alignment(0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          snapshot.data.confirmed.toString(),
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          snapshot.data.newconfirmed > 0
                              ? "(+${(snapshot.data.newconfirmed.toString())})"
                              : "(-${(snapshot.data.newconfirmed.toString())})",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: snapshot.data.newconfirmed > 0
                                  ? Colors.red
                                  : Colors.green),
                        ),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                  child: Align(
                    alignment: Alignment(1, -1),
                    child: CircleAvatar(
                      child: Image(
                        image: AssetImage('assets/thailand.png'),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                  child: Align(
                    alignment: Alignment(-1, -1),
                    child: Text(
                      'Total Case',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                  child: Align(
                    child: Text(
                      'Updated on ${snapshot.data.lastupdate}',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                    ),
                    alignment: Alignment(1, 1),
                  ),
                )
              ],
            ),
            EdgeInsets.only(top: 10),
          );
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Cardboard(
            MediaQuery.of(context).size.width * 0.85,
            MediaQuery.of(context).size.height * 0.2,
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
