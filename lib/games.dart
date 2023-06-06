import 'dart:convert';
import 'package:first_app/providers/game_provider.dart';
import 'package:first_app/slider.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'models/game.dart';

class Games extends StatelessWidget {
  /// Constructs a [Games] widget.
  const Games({super.key});
  Future<List<Game>> fetchGames() async {
    final response =
        await http.get(Uri.parse('https://www.balldontlie.io/api/v1/games'));

    if (response.statusCode == 200) {
      var one = json.decode(response.body);
      List<dynamic> data = one['data'];
      // print(data);
      List<Game> games = data.map((json) => Game.fromJson(json)).toList();
      // Provider<GameListProvider>(create: (context) => games);

      // print(games[0].id);
      return games;
    } else {
      throw Exception('Failed to fetch categories');
    }
  }

  // final List<String> entries = <String>['A', 'B', 'B'];

  @override
  Widget build(BuildContext context) {
    return Consumer<GameListProvider>(
      builder: (context, gameProvider, child) => Scaffold(
          appBar: AppBar(
            title: const Text('Games', style: TextStyle(color: Colors.black)),
            backgroundColor: Colors.white,
          ),
          backgroundColor: Colors.white10,
          body: FutureBuilder<List<Game>>(
              future: fetchGames(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  // print(snapshot.data!.length);
                  // Provider.of<GameListProvider>(
                  //     create: (context) => snapshot.data);
                  // Provider<ApiService>(create: (context) => ApiService()),

                  gameProvider.add(snapshot.data!);
                  return Column(
                    children: [
                      const Homee(),
                      Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.all(8),
                          itemCount: snapshot.data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            var game = snapshot.data![index];
                            // gameProvider.add(game);
                            // print(game.homeTeam.fullName);
                            return GestureDetector(
                                onTap: () {
                                  GoRouter.of(context)
                                      .go('/games/details/${game.id}');
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: const Color.fromARGB(
                                          255, 153, 152, 152)),
                                  height: 110,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      const Text(
                                        'East - Conf. Semifinals',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 16),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                  game.homeTeamScore.toString(),
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 44,
                                                    fontWeight: FontWeight.w900,
                                                  )),
                                              Text(game.homeTeam.name,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w700,
                                                  )),
                                            ],
                                          ),
                                          Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  game.homeTeamScore >
                                                          game.visitorTeamScore
                                                      ? const Icon(
                                                          Icons
                                                              .arrow_left_outlined,
                                                          color: Colors.black)
                                                      : const Text(''),
                                                  Text(
                                                    game.status,
                                                    style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                  game.visitorTeamScore >
                                                          game.homeTeamScore
                                                      ? const Icon(
                                                          Icons
                                                              .arrow_right_outlined,
                                                          color: Colors.black)
                                                      : const Text('')
                                                ],
                                              ),
                                              Text(
                                                DateFormat.yMMMMd()
                                                    .format(game.date),
                                                style: const TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 71, 71, 71),
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                  game.visitorTeamScore
                                                      .toString(),
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 44,
                                                    fontWeight: FontWeight.w900,
                                                  )),
                                              Text(game.visitorTeam.name,
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w700,
                                                  )),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ));
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(),
                        ),
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              })),
    );
  }
}
