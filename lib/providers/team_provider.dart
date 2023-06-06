import 'package:first_app/models/team.dart';
import 'package:flutter/material.dart';

class TeamListProvider extends ChangeNotifier {
  List<Team> teamslist = [];

  void add(List<Team> teams) {
    teamslist = teams;

    notifyListeners();
  }
}
