import 'dart:convert';
//import 'dart:io';
import 'package:league_game/domain/models/game_model.dart';
import 'package:league_game/domain/services/misiontic_interface.dart';
import 'package:http/http.dart' as http;

class VideogamesPoolService implements MisionTicService {
  //ACTIVIDAD
  // AÑADA SUS CREDENCIALES PARA CONECTARSE AL SERVICIO EXTERNO
  final String baseUrl = 'www.freetogame.com';
  //final String apiKey = '8.S6qnd1GDkfxgaE3nTDFui4paIOLMTwH2KSbf1qTQpRMvwcueHNW';

  @override
  Future<List<GameModel>> fecthData({int limit = 10, Map? map}) async {
    // Defina la URI para hacer las peticiones al servicio
    var queryParameters = {'limit': limit.toString()};
    var uri = Uri.https(baseUrl, '/api/games', queryParameters);

    // Implemente la solicitud
    final response = await http.get(uri, headers: <String, String>{
      'Content-type': 'application/json; charset=UTF-8',
      //'key': apiKey
    });

    if (response.statusCode == 200) {
      var res = json.decode(response.body);
      final List<GameModel> games = [];
      for (var game in res.take(limit)) {
        games.add(GameModel.fromJson(game));
      }
      return games;
    } else {
      throw Exception('Error on request');
    }
  }
}
