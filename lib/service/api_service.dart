import 'dart:convert';

import 'package:http/http.dart';
import 'package:population_app/models/data_model.dart';

class ApiService{
  static Future<AutoGenerate> getPopulation()async{
    var response=await get(Uri.parse("https://datausa.io/api/data?drilldowns=Nation&measures=Population"));
    return AutoGenerate.fromJson(json.decode(response.body));
  }
}