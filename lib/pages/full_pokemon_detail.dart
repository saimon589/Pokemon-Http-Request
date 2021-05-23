import 'package:flutter/material.dart';
import 'package:pokemon_api/objects/pokemon_obj.dart';
import 'package:pokemon_api/utils/api_const.dart';
import 'package:pokemon_api/utils/text_style.dart';
import 'package:pokemon_api/widgets/pokemon_card.dart';

class PokemonDetail extends StatelessWidget {
  const PokemonDetail({Key key, this.pokemonObj}) : super(key: key);

  final PokemonObj pokemonObj;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Full Details'),
        backgroundColor: Colors.teal[800],
      ),
      body: ListView(
        padding: EdgeInsets.all(10.0),
        children: [
          Image.network(
            POKEMON_IMAGE + pokemonObj.variations[0].image,
            height: 250.0,
            width: double.infinity,
          ),
          DetailCard(
            imagePath: POKEMON_IMAGE + pokemonObj.variations[0].image,
            title: 'Name',
            subTitle: pokemonObj.name,
          ),
          DetailCard(
            imagePath: POKEMON_IMAGE + pokemonObj.variations[0].image,
            title: 'Number',
            subTitle: pokemonObj.num.toString(),
          ),
          DetailCard(
            imagePath: POKEMON_IMAGE + pokemonObj.variations[0].image,
            title: 'Species',
            subTitle: pokemonObj.variations[0].specie,
          ),
          DetailCard(
            imagePath: POKEMON_IMAGE + pokemonObj.variations[0].image,
            title: 'Description',
            subTitle: pokemonObj.variations[0].description,
          ),
          DetailCard(
            imagePath: POKEMON_IMAGE + pokemonObj.variations[0].image,
            title: 'Speed',
            subTitle: pokemonObj.variations[0].stats.speed.toString(),
          ),
          DetailCard(
            imagePath: POKEMON_IMAGE + pokemonObj.variations[0].image,
            title: 'Attack Speed',
            subTitle: pokemonObj.variations[0].stats.speedAttack.toString(),
          ),
          DetailCard(
            imagePath: POKEMON_IMAGE + pokemonObj.variations[0].image,
            title: 'Defensed Speed',
            subTitle: pokemonObj.variations[0].stats.speedDefense.toString(),
          ),
          DetailCard(
            imagePath: POKEMON_IMAGE + pokemonObj.variations[0].image,
            title: 'Type',
            subTitle: pokemonObj.variations[0].types[0],
          ),
          DetailCard(
            imagePath: POKEMON_IMAGE + pokemonObj.variations[0].image,
            title: 'Abilities',
            subTitle: pokemonObj.variations[0].abilities[0],
          ),
        ],
      ),
    );
  }
}
