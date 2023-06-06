// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) => Game(
      id: json['id'] as int,
      date: DateTime.parse(json['date'] as String),
      homeTeam: Team.fromJson(json['home_team'] as Map<String, dynamic>),
      homeTeamScore: json['home_team_score'] as int,
      period: json['period'] as int,
      postseason: json['postseason'] as bool,
      season: json['season'] as int,
      status: json['status'] as String,
      // time: json['time'] as String,
      visitorTeam: Team.fromJson(json['visitor_team'] as Map<String, dynamic>),
      visitorTeamScore: json['visitor_team_score'] as int,
    );

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'home_team': instance.homeTeam.toJson(),
      'home_team_score': instance.homeTeamScore,
      'period': instance.period,
      'postseason': instance.postseason,
      'season': instance.season,
      'status': instance.status,
      // 'time': instance.time,
      'visitor_team': instance.visitorTeam.toJson(),
      'visitor_team_score': instance.visitorTeamScore,
    };
