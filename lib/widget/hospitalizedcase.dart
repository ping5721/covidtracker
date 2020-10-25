import 'package:covid/thaicase.dart';
import 'package:covid/widget/cardboard.dart';
import 'package:flutter/material.dart';

class HospitalizedCase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getThaicase(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Cardboard(
              MediaQuery.of(context).size.width * 0.27,
              MediaQuery.of(context).size.height * 0.15,
              Colors.white,
              Stack(
                children: [
                  Align(
                    alignment: Alignment(0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          snapshot.data.hospitalized.toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          (snapshot.data.newhospitalized > 0
                              ? "(+${(snapshot.data.newhospitalized.toString())})"
                              : "(-${(snapshot.data.newhospitalized.toString())})"),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: snapshot.data.newhospitalized > 0
                                  ? Colors.red
                                  : Colors.green),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                    child: Text(
                      'Cure',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              EdgeInsets.fromLTRB(5, 15, 5, 0));
        }
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
