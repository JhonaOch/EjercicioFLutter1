import 'package:comsumo_api_flutter/model/model_pokemon.dart';
import 'package:comsumo_api_flutter/provider/provider_pokemon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/service_pokemon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final p = Provider.of<ProviderPokemon>(context, listen: false);
      p.getAllPokemon();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProviderPokemon>(
        builder: (context, value, child) {
          final data = value.data!.results;

          return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                Result r = data[index];

                return ListTile(
                  title: Text(r.name),
                );
              });
        },
      ),
    );
  }
}
