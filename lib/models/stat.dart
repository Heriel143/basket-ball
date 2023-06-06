// import 'dart:ffi';

// import 'game.dart';
// import 'player.dart';
import 'team.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stat.g.dart';

@JsonSerializable(explicitToJson: true)
class Stat {
  final int id;
  final dynamic ast;
  final dynamic blk;
  final dynamic dreb;
  // final double fg3Pct;
  // final int fg3A;
  // final int fg3M;
  // final double fgPct;
  // final int fga;
  // final int fgm;
  // final double ftPct;
  final dynamic fta;
  // final int ftm;
  // final Game game;
  final dynamic min;
  // final int oreb;
  // final int pf;
  // final Player player;
  // final int pts;
  // final int reb;
  // final int stl;
  final Team team;
  final dynamic turnover;

  Stat({
    required this.id,
    this.ast,
    required this.blk,
    required this.dreb,
    // required this.fg3Pct,
    // required this.fg3A,
    // required this.fg3M,
    // required this.fgPct,
    // required this.fga,
    // required this.fgm,
    // required this.ftPct,
    required this.fta,
    // required this.ftm,
    // required this.game,
    required this.min,
    // required this.oreb,
    // required this.pf,
    // required this.player,
    // required this.pts,
    // required this.reb,
    // required this.stl,
    required this.team,
    required this.turnover,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);
  Map<String, dynamic> toJson() => _$StatToJson(this);
}
