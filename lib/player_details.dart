import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/player_provider.dart';
// import 'package:go_router/go_router.dart';

class PlayerDetails extends StatelessWidget {
  /// Constructs a [PlayerDetails].
  const PlayerDetails({
    required this.id,
    super.key,
  });

  /// The label to display in the center of the screen.
  final String id;

  @override
  Widget build(BuildContext context) {
    final player = Provider.of<PlayerListProvider>(context, listen: false)
        .playerslist
        .firstWhere((element) => element.id == int.parse(id));
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Player Details',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        // actionsIconTheme: IconThemeData(color: Colors.black),
      ),
      body: ListView(
        children: [
          Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                buildCoverImage(),
                Positioned(top: 210, child: buildProfileImage())
              ]),
          Center(
            child: Text(
              "${player.firstName} ${player.lastName}",
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          // Container(
          //   margin: const EdgeInsets.only(top: 14),
          //   child: const Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //     children: [
          //       Column(
          //         children: [
          //           Text('PPG'),
          //           Text(
          //             '9.8',
          //             style:
          //                 TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //           ),
          //         ],
          //       ),
          //       Column(
          //         children: [
          //           Text('PPG'),
          //           Text(
          //             '9.8',
          //             style:
          //                 TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //           ),
          //         ],
          //       ),
          //       Column(
          //         children: [
          //           Text('PPG'),
          //           Text(
          //             '9.8',
          //             style:
          //                 TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //           ),
          //         ],
          //       ),
          //       Column(
          //         children: [
          //           Text('PPG'),
          //           Text(
          //             '9.8',
          //             style:
          //                 TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
          SizedBox(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Height: ${player.heightInches}'),
                Text('Weight: ${player.weightPounds}'),
                Text('Position: ${player.position}'),
                Text('Team: ${player.team.fullName}'),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        margin: const EdgeInsets.only(bottom: 90),
        child: Image.network(
          'https://e00-marca.uecdn.es/assets/multimedia/imagenes/2021/11/27/16380165558995.jpg',
          width: double.infinity,
          height: 280,
          fit: BoxFit.cover,
        ),
      );
  Widget buildProfileImage() => CircleAvatar(
        radius: 70,
        backgroundColor: Colors.grey.shade800,
        backgroundImage: const NetworkImage(
          'https://www.pvamu.edu/wp-content/uploads/2023/02/i.png',
        ),
      );
}
