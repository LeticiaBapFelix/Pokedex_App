import 'package:desafio_layout2/models/pokemon_model.dart';
import 'package:desafio_layout2/repositories/pokedex_repository.dart';
import 'package:desafio_layout2/pages/home/widgets/pokemon_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PokedexPage extends StatefulWidget {
  @override
  _PokedexPageState createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  @override
  void initState() {
    super.initState();
    var repository = PokedexRepository();
    repository.getPokedex().then(
          (result) => setState(
            () {
              pokemonss = result;
            },
          ),
        );
  }

  PokemonsModel pokemonss;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              top: -115,
              right: -135,
              child: Image.asset(
                'assets/pokeball.png',
                color: Colors.grey.shade200,
                height: 350,
                width: 350,
              ),
            ),
            Positioned(
              top: 55,
              right: 28,
              child: Icon(Icons.menu),
            ),
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(top: 140),
                padding: EdgeInsets.only(right: 16, left: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 13),
                      child: Text(
                        'Pokedex',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Expanded(
                      child: PokemonItems(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
