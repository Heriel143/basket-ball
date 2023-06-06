import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models/game.dart';

class Api {
  Future<List<Game>> fetchGames() async {
    final response =
        await http.get(Uri.parse('https://www.balldontlie.io/api/v1/games'));

    if (response.statusCode == 200) {
      var one = json.decode(response.body);
      List<dynamic> data = one['data'];
      // print(data);
      List<Game> games = data.map((json) => Game.fromJson(json)).toList();
      // Provider<GameListProvider>(create: (context) => games);
      // gameslist = games;
      // print(games[0].id);
      return games;
    } else {
      throw Exception('Failed to fetch categories');
    }
  }
}
