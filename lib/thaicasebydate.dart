import 'dart:convert';

import 'package:http/http.dart' as http;

class ThaiCasebyDate {
  String date;
  int confirmed;
  int recovered;
  int hospitalized;
  int death;
  ThaiCasebyDate(this.confirmed, this.date, this.death, this.hospitalized);

  ThaiCasebyDate.fromJson(Map json) {
    date = json["Date"];
    confirmed = json["Confirmed"];
    recovered = json["Recovered"];
    hospitalized = json["Hospitalized"];
    death = json["Deaths"];
  }
}

Future getCasebyDate() async {
  List data = [[], [], [], [], []];
  var response =
      await http.get('https://covid19.th-stat.com/api/open/timeline');
  var responsejson = json.decode(response.body)["Data"] as List;
  List casebydate =
      responsejson.map((e) => ThaiCasebyDate.fromJson(e)).toList();
  for (int i = 0; i < casebydate.length; i++) {
    var _date = casebydate[i].date.toString().substring(0, 2);
    data[0].add(_date);
    var _confirmed = casebydate[i].confirmed;
    data[1].add(_confirmed);
    var _recovered = casebydate[i].recovered;
    data[2].add(_recovered);
    var _hospitalized = casebydate[i].hospitalized;
    data[3].add(_hospitalized);
    var _death = casebydate[i].death;
    data[4].add(_death);
  }

  return data;
}
