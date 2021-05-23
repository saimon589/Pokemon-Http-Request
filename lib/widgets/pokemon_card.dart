import 'package:flutter/material.dart';
import 'package:pokemon_api/utils/text_style.dart';

class DetailCard extends StatelessWidget {
  const DetailCard({Key key, this.title, this.subTitle, this.imagePath})
      : super(key: key);
  final String title;
  final String subTitle;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.redAccent,
      elevation: 2.5,
      child: ListTile(
        leading: Image.network(
          imagePath,
          fit: BoxFit.cover,
          height: 35.0,
          width: 30.0,
        ),
        title: Text(
          title,
          style: listTitle,
        ),
        subtitle: Text(
          subTitle,
          style: listsubTitle,
        ),
      ),
    );
  }
}
