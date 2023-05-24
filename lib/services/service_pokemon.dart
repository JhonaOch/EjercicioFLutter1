import 'dart:convert';

import 'package:comsumo_api_flutter/global/const.dart';
import 'package:comsumo_api_flutter/model/model_pokemon.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Service {
  Global api = Global();

  Future<Pokemon?> getPokemon() async {
    try {
      final response = await http.get(Uri.parse('${api.apiUrl}pokemon/'));
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final pokemon = Pokemon.fromJson(data);

      return pokemon;
    } catch (_) {
      print('Error');
      return null;
    }
  }
}
