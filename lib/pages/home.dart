import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_api/bloc/data_bloc.dart';
import 'package:pokemon_api/objects/pokemon_obj.dart';
import 'package:pokemon_api/objects/response_obj.dart';
import 'package:pokemon_api/utils/text_style.dart';
import 'package:pokemon_api/widgets/pokemon_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bloc = DataBloc();

  @override
  void initState() {
    super.initState();
    _bloc.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon Api'),
        backgroundColor: Colors.teal,
      ),
      body: StreamBuilder<ResponseObj>(
        initialData: ResponseObj(
          msgStage: MsgStage.loading,
        ),
        stream: _bloc.dataStream(),
        builder: (BuildContext context, AsyncSnapshot<ResponseObj> snapshot) {
          ResponseObj respObj = snapshot.data;
          if (respObj.msgStage == MsgStage.data) {
            List<PokemonObj> pmList = respObj.data;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: pmList.length,
              itemBuilder: (context, index) {
                return PokemonWidget(
                  pokemonObj: pmList[index],
                );
              },
            );
          } else if (respObj.msgStage == MsgStage.error) {
            if (respObj.errorState == ErrorState.serverErr) {
              return Center(
                child: Text(
                  '500\nSeverError',
                  style: errorText,
                ),
              );
            } else if (respObj.errorState == ErrorState.notfoundErr) {
              return Center(
                child: Text(
                  '404\nPage not found',
                  style: errorText,
                ),
              );
            } else {
              return Center(
                child: Text(
                  'UnknownError',
                  style: errorText,
                ),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
