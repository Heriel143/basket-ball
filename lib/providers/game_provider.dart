// ignore_for_file: public_member_api_docs, sort_constructors_fi

import 'package:flutter/material.dart';
import 'package:first_app/models/game.dart';

class GameListProvider with ChangeNotifier {
  List<Game> gameslist = [];

  // GameListProvider({
  //   this.gameslist,
  // });

  void add(List<Game> games) {
    gameslist = games;

    notifyListeners();
  }

  List<Game> get() {
    return [...gameslist];
  }
}
