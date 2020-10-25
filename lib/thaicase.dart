import 'dart:convert';
import 'package:http/http.dart' as http;

class ThailandCase {
  int confirmed;
  int recovered;
  int hospitalized;
  int death;
  String lastupdate;
  int newconfirmed;
  int newrecovered;
  int newhospitalized;
  int newdeath;

  ThailandCase(
      this.confirmed,
      this.death,
      this.hospitalized,
      this.lastupdate,
      this.recovered,
      this.newconfirmed,
      this.newdeath,
      this.newhospitalized,
      this.newrecovered);
  factory ThailandCase.fromJson(Map json) {
    return ThailandCase(
      json["Confirmed"],
      json["Deaths"],
      json["Hospitalized"],
      json["UpdateDate"],
      json["Recovered"],
      json["NewConfirmed"],
      json["NewDeaths"],
      json["NewHospitalized"],
      json["NewRecovered"],
    );
  }
}

Future getThaicase() async {
  var thailandcase =
      await http.get('https://covid19.th-stat.com/api/open/today');
  var result = json.decode(thailandcase.body);
  var data = ThailandCase.fromJson(result);
  return data;
}
