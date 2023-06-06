import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/team_provider.dart';
// import 'package:go_router/go_router.dart';

class TeamDetails extends StatelessWidget {
  /// Constructs a [TeamDetails].
  const TeamDetails({
    required this.id,
    super.key,
  });

  /// The label to display in the center of the screen.
  final String id;

  @override
  Widget build(BuildContext context) {
    final team = Provider.of<TeamListProvider>(context, listen: false)
        .teamslist
        .firstWhere((element) => element.id == int.parse(id));
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Team Details',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
      ),
      body: ListView(children: [
        Stack(clipBehavior: Clip.none, alignment: Alignment.center, children: [
          buildCoverImage(),
          Positioned(
            top: 290,
            child: CircleAvatar(
              radius: 100,
              backgroundColor: const Color.fromARGB(255, 254, 252, 252),
              backgroundImage: NetworkImage(
                'https://loodibee.com/wp-content/uploads/nba-${team.fullName.toLowerCase().replaceAll(' ', '-')}-logo-300x300.png',
              ),
            ),
          )
          // Positioned(top: 210, child: buildProfileImage())
        ]),
        Container(
          margin: const EdgeInsets.only(top: 110),
          child: SizedBox(
            height: 200,
            child: Column(
              children: [
                Text(
                  '${team.fullName}-${team.abbreviation}',
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Name: ${team.name}',
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
                Text(
                  'City: ${team.city}',
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
                Text(
                  'Conference: ${team.conference}',
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
                Text(
                  'Division: ${team.division}',
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  Widget buildCoverImage() => Container(
        color: Colors.grey,
        margin: const EdgeInsets.only(bottom: 90),
        child: Image.network(
          'https://i.cbc.ca/1.5443354.1580238594!/fileImage/httpImage/bryant-logo.jpg',
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
