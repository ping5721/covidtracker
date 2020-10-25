import 'package:http/http.dart' as http;
import 'dart:convert';

class WorldCase {
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;
  String countrycode;
  String country;
  WorldCase(
      this.country,
      this.newConfirmed,
      this.newDeaths,
      this.newRecovered,
      this.totalConfirmed,
      this.totalDeaths,
      this.totalRecovered,
      this.countrycode);

  factory WorldCase.fromJson(Map json) {
    return WorldCase(
        json["Country"],
        json["NewConfirmed"],
        json["NewDeaths"],
        json["NewRecovered"],
        json["TotalConfirmed"],
        json["TotalDeaths"],
        json["TotalRecovered"],
        json["CountryCode"]);
  }
}

Future getWorld() async {
  var response = await http.get("https://api.covid19api.com/summary");
  var data = (json.decode(response.body)["Countries"] as List);
  List worldlist = data.map((e) => WorldCase.fromJson(e)).toList();

  return worldlist;
}

Future getGlobalcase() async {
  var response = await http.get("https://api.covid19api.com/summary");
  var data = json.decode(response.body)["Global"];
  var global = WorldCase.fromJson(data);

  return global;
}
