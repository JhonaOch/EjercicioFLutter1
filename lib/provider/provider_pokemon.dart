
import 'package:comsumo_api_flutter/model/model_pokemon.dart';
import 'package:comsumo_api_flutter/services/service_pokemon.dart';
import 'package:flutter/material.dart';

class ProviderPokemon with ChangeNotifier{

  Pokemon? data;

  Service s= Service();




  void getAllPokemon()async{

    final res= await s.getPokemon();
    data=res;

    notifyListeners();


  }


}