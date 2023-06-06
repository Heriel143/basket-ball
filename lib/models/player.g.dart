// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Player _$PlayerFromJson(Map<String, dynamic> json) => Player(
      id: json['id'] as int,
      firstName: json['first_name'] as String,
      // heightFeet: json['height_feet'] as dynamic,
      heightInches: json['height_inches'] as dynamic,
      lastName: json['last_name'] as String,
      position: json['position'] as String,
      team: Team.fromJson(json['team'] as Map<String, dynamic>),
      weightPounds: json['weight_pounds'] as dynamic,
    );

Map<String, dynamic> _$PlayerToJson(Player instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      // 'height_feet': instance.heightFeet,
      'height_inches': instance.heightInches,
      'last_name': instance.lastName,
      'position': instance.position,
      'team': instance.team.toJson(),
      'weight_pounds': instance.weightPounds,
    };
