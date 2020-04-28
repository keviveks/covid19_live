import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:covid19_live/config/config.dart';
import 'package:covid19_live/data/models/covid_country.dart';
import 'package:covid19_live/data/models/covid_summary.dart';

class CovidDatasource {
  Future<CovidSummary> getSummary() async {
    var response = await http.get(Config.covid_summary_url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      CovidSummary covidSummary = CovidSummary.fromJson(data);
      return covidSummary;
    } else {
      throw Exception('API failed!');
    }
  }

  Future<List<CovidCountry>> getCountries() async {
    var response = await http.get(Config.covid_country_url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List<CovidCountry> covidCountryList = CovidCountryList.fromJson(data).countries;
      return covidCountryList;
    } else {
      throw Exception('API failed!');
    }
  }
}