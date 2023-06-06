import 'package:first_app/providers/game_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
// import 'package:go_router/go_router.dart';

class GameDetails extends StatelessWidget {
  /// Constructs a [GameDetails].
  const GameDetails({
    required this.id,
    super.key,
  });

  /// The label to display in the center of the screen.
  final String id;

  // var one = Provider.of<GameListProvider>(context).gameslist;

  @override
  Widget build(BuildContext context) {
    final games = Provider.of<GameListProvider>(context, listen: false)
        .gameslist
        .firstWhere((element) => element.id == int.parse(id));
    // var game = 0;
    // for (int i = 0; i <= games.gameslist.length; i++) {
    //   if (games.gameslist[i].id == int.parse(id)) {
    //     game = i;
    //     break;
    //   }
    // }
    return Consumer<GameListProvider>(
      builder: (context, gameProvider, child) => Scaffold(
          appBar: AppBar(
            title: const Text(
              'Game details',
              style: TextStyle(color: Colors.black),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => Navigator.of(context).pop(),
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
          ),
          body: Column(
            children: [
              SizedBox(
                  height: 300,
                  child: Image.asset(
                    'assets/all-time-greatest-nba-teams-for-each-continent.jpg',
                    fit: BoxFit.cover,
                  )),
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  SizedBox(
                    width: 200,
                    // height: 300,
                    child: Column(
                      children: [
                        const Text(
                          'Home Team',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Name: ${games.homeTeam.name}',
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Score: ${games.homeTeamScore}',
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                            if (games.homeTeamScore > games.visitorTeamScore)
                              SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Image.asset(
                                    'assets/win.png',
                                    fit: BoxFit.cover,
                                  )),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: Column(
                      children: [
                        const Text(
                          'Away Team',
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Name: ${games.visitorTeam.name}',
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Score: ${games.visitorTeamScore}',
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                            if (games.visitorTeamScore > games.homeTeamScore)
                              SizedBox(
                                  height: 100,
                                  width: 100,
                                  child: Image.asset(
                                    'assets/win.png',
                                    fit: BoxFit.cover,
                                  )),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Status: ${games.status}',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Period: ${games.period}',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Date: ${DateFormat.yMMMMd().format(games.date)}',
                  style: const TextStyle(fontSize: 18),
                ),
              )
            ],
          )),
    );
  }
}
