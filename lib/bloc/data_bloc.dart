import 'dart:async';
import 'dart:convert';
import 'package:pokemon_api/objects/pokemon_obj.dart';
import 'package:pokemon_api/objects/response_obj.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_api/utils/api_const.dart';

class DataBloc {
  StreamController<ResponseObj> _streamController =
      StreamController<ResponseObj>();

  Stream<ResponseObj> dataStream() => _streamController.stream;

  getData() async {
    ResponseObj responseObj = ResponseObj(msgStage: MsgStage.loading);
    _streamController.sink.add(responseObj);

    var url = Uri.parse(POKEMON_API);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      List<PokemonObj> pmList = [];
      List<dynamic> list = jsonDecode(response.body);
      list.forEach((data) {
        pmList.add(PokemonObj.fromJson(data));
      });
      responseObj.msgStage = MsgStage.data;
      responseObj.data = pmList;
      _streamController.sink.add(responseObj);
    } else if (response.statusCode == 500) {
      responseObj.msgStage = MsgStage.error;
      responseObj.errorState = ErrorState.serverErr;
      _streamController.sink.add(responseObj);
    } else if (response.statusCode == 404) {
      responseObj.msgStage = MsgStage.error;
      responseObj.errorState = ErrorState.notfoundErr;
      _streamController.sink.add(responseObj);
    } else {
      responseObj.msgStage = MsgStage.error;
      responseObj.errorState = ErrorState.unknownErr;
      _streamController.sink.add(responseObj);
    }
  }

  dispose() {
    _streamController.close();
  }
}
