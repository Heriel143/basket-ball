import 'dart:convert';

import 'package:first_app/models/team.dart';
import 'package:first_app/providers/team_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
// import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Teams extends StatelessWidget {
  /// Constructs a [Teams] widget.
  Teams({super.key});
  Future<List<Team>> fetchTeams() async {
    final response =
        await http.get(Uri.parse('https://www.balldontlie.io/api/v1/teams'));

    if (response.statusCode == 200) {
      var one = json.decode(response.body);
      List<dynamic> data = one['data'];
      // print(data);
      List<Team> teams = data.map((json) => Team.fromJson(json)).toList();

      // print(teams[0].fullName);
      return teams;
    } else {
      throw Exception('Failed to fetch categories');
    }
  }

  final List<String> entries = <String>['A', 'B', 'B'];

  @override
  Widget build(BuildContext context) {
    return Consumer<TeamListProvider>(
      builder: (context, teamProvider, child) => Scaffold(
          appBar: AppBar(
            title: const Text(
              'Teams',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
          ),
          body: FutureBuilder<List<Team>>(
              future: fetchTeams(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  var hell = 0;
                  teamProvider.add(snapshot.data!);
                  return ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final team = snapshot.data![index];
                      hell += 1;
                      if (hell > 10) hell = 1;
                      // print(team[]);
                      return GestureDetector(
                          onTap: () {
                            GoRouter.of(context)
                                .go('/teams/details/${team.id}');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color:
                                    const Color.fromARGB(255, 141, 140, 140)),
                            height: 110,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: 40,
                                    backgroundColor: const Color.fromARGB(
                                        255, 141, 140, 140),
                                    backgroundImage: NetworkImage(
                                      'https://loodibee.com/wp-content/uploads/nba-${team.fullName.toLowerCase().replaceAll(' ', '-')}-logo-300x300.png',
                                    ),
                                  ),
                                ),
                                // const Icon(
                                //   Icons.person,
                                //   size: 100,
                                // ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      team.fullName,
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${team.conference}-${team.division}',
                                          style: const TextStyle(
                                              fontSize: 18,
                                              decorationStyle:
                                                  TextDecorationStyle.dotted),
                                        ),
                                        const SizedBox(
                                          width: 40.0,
                                        ),
                                        const Text(
                                          'Follow',
                                          style: TextStyle(
                                              color: Colors.blue,
                                              backgroundColor: Colors.white),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ));
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
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
