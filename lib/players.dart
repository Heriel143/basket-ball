import 'dart:convert';
import 'package:first_app/providers/player_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:first_app/models/player.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Players extends StatelessWidget {
  /// Constructs a [Players] widget.
  Players({super.key});
  Future<List<Player>> fetchPlayers() async {
    final response =
        await http.get(Uri.parse('https://www.balldontlie.io/api/v1/players'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body)['data'];
      List<Player> players = data.map((json) => Player.fromJson(json)).toList();

      return players;
    } else {
      throw Exception('Failed to fetch categories');
    }
  }

  // var numba = 0;
  final List<String> url = <String>[
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRtvK8ycVBe6rK6pAP48JcHmhldu26Zz9UqQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRB79sYOPNA3TVj-VPZCNRhVqYqcJ6QvxdH_Q&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0tiQBB7I1vxBLxFHfMlA4z-epKAabXTM8vQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT64WKxj_QEm8S6DyXwkUXcqpQm5s1sUA9thw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9UR8TeAALsG7ntuZdyJf67OirAn69ecTfRQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCobfsXFA3HhyQKYIewyJW24P1AaUUsX7lIg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_ySjKa1PSOYEy2OX0i-pYli9oq_pKrefLgg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTGDLQ12o7rKjJC4kwB9CgBzI7lljZocsGHug&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJ6ZHyCaXU59B2qdgOD2cCFPt8OWRdaEisSw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7SfL1vtaanfcwGY0s0NNyHw-j-0yvD5glJA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1zFQMngrLEiruSfLVKd17_15UWbHjOXTLZA&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEC0E_-oZAdXK5rpPVqKN3diH_nBydjFfT_Q&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQEC0E_-oZAdXK5rpPVqKN3diH_nBydjFfT_Q&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbPgkcMrUTi3W2kA_uwWdH0QWiLtFsYQnEWg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOtxG5iT8XHslu82QP2R_LDEpqM02SNPswKg&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRIUT9pXKCnouTXpBRA_7FF0L2QV11yafjuQ&usqp=CAU'
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayerListProvider>(
      builder: (context, playerProvider, child) => Scaffold(
          appBar: AppBar(
            title: const Text(
              'Players',
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
          ),
          body: FutureBuilder<List<Player>>(
              future: fetchPlayers(),
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  // print(snapshot.data![0]);
                  var numba = 0;
                  playerProvider.add(snapshot.data!);
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: GridView.count(
                      // Create a grid with 2 columns. If you change the scrollDirection to
                      // horizontal, this produces 2 rows.
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,

                      mainAxisSpacing: 16,
                      // Generate 100 widgets that display their index in the List.
                      children: List.generate(snapshot.data!.length, (index) {
                        var player = snapshot.data![index];
                        numba += 1;
                        if (numba > 15) numba = 0;
                        return GestureDetector(
                          onTap: () {
                            GoRouter.of(context)
                                .go('/players/details/${player.id}');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 205, 204, 204),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: <Widget>[
                                CircleAvatar(
                                  radius: 77,
                                  backgroundColor: Colors.grey.shade800,
                                  backgroundImage: NetworkImage(
                                    url[numba],
                                  ),
                                ),
                                // Image.asset('assets/images$numba.png',
                                //     fit: BoxFit.contain,
                                //     height: 150,
                                //     width: 150),
                                // const Icon(
                                //   Icons.person,
                                //   size: 140,
                                //   color: Color.fromARGB(143, 32, 9, 180),
                                // ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text(
                                        "${player.firstName} ${player.lastName}",
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20),
                                      ),
                                      const Icon(
                                        Icons.thumb_up,
                                        color: Color.fromARGB(255, 166, 87, 87),
                                        size: 26,
                                      )
                                    ])
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
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
