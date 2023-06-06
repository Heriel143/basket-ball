import 'package:json_annotation/json_annotation.dart';
import 'team.dart';

part 'game.g.dart';

@JsonSerializable(explicitToJson: true)
class Game {
  final int id;
  final DateTime date;
  final Team homeTeam;
  final int homeTeamScore;
  final int period;
  final bool postseason;
  final int season;
  final String status;
  // final String time;
  final Team visitorTeam;
  final int visitorTeamScore;

  Game({
    required this.id,
    required this.date,
    required this.homeTeam,
    required this.homeTeamScore,
    required this.period,
    required this.postseason,
    required this.season,
    required this.status,
    // required this.time,
    required this.visitorTeam,
    required this.visitorTeamScore,
  });

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
  Map<String, dynamic> toJson() => _$GameToJson(this);
}
