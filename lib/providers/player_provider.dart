import 'package:first_app/models/player.dart';
import 'package:flutter/material.dart';

class PlayerListProvider extends ChangeNotifier {
  List<Player> playerslist = [];

  void add(List<Player> players) {
    playerslist = players;

    notifyListeners();
  }
}
