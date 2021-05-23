import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_api/objects/pokemon_obj.dart';
import 'package:pokemon_api/pages/full_pokemon_detail.dart';
import 'package:pokemon_api/utils/api_const.dart';
import 'package:pokemon_api/utils/text_style.dart';

class PokemonWidget extends StatelessWidget {
  const PokemonWidget({Key key, this.pokemonObj}) : super(key: key);

  final PokemonObj pokemonObj;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        shadowColor: Colors.grey,
        elevation: 3.5,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.network(
                POKEMON_IMAGE + pokemonObj.variations[0].image,
                height: 100.0,
                width: 100.0,
              ),
            ),
            Text(
              pokemonObj.name,
              style: nameStyle,
            ),
            Text(
              pokemonObj.num.toString(),
              style: nameStyle,
            ),
            Text(
              pokemonObj.variations[0].specie,
              style: nameStyle,
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(CupertinoPageRoute(
            builder: (context) => PokemonDetail(
                  pokemonObj: pokemonObj,
                )));
      },
    );
  }
}
