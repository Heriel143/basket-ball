import 'team.dart';
import 'package:json_annotation/json_annotation.dart';

part 'player.g.dart';

@JsonSerializable(explicitToJson: true)
class Player {
  final int id;
  final String firstName;
  // final dynamic heightFeet;
  final dynamic heightInches;
  final String lastName;
  final String position;
  final Team team;
  final dynamic weightPounds;

  Player({
    required this.id,
    required this.firstName,
    // this.heightFeet,
    this.heightInches,
    required this.lastName,
    required this.position,
    required this.team,
    this.weightPounds,
  });

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
  Map<String, dynamic> toJson() => _$PlayerToJson(this);
}
