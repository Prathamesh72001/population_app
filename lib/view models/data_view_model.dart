import 'package:flutter/material.dart';
import 'package:population_app/service/api_service.dart';

class DataViewModel extends ChangeNotifier{
  String Population="";

  String get getPopulation{
    return Population;
  }

  Future<void> getPopulationApi(String idNation, String idYear)async{
    var response=await ApiService.getPopulation();
    var data=response.data.firstWhere((element) => (element.ID_Nation==idNation && element.ID_Year.toString()==idYear));
    Population=data.Population.toString();
    notifyListeners();
  }
}