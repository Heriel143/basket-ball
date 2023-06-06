// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stat _$StatFromJson(Map<String, dynamic> json) => Stat(
      id: json['id'] as int,
      ast: json['ast'] as dynamic,
      blk: json['blk'] as dynamic,
      dreb: json['dreb'] as dynamic,
      // fg3Pct: (json['fg3_pct'] as num).toDouble(),
      // fg3A: json['fg3a'] as int,
      // fg3M: json['fg3m'] as int,
      // fgPct: (json['fg_pct'] as num).toDouble(),
      // fga: json['fga'] as int,
      // fgm: json['fgm'] as int,
      // ftPct: (json['ft_pct'] as num).toDouble(),
      fta: json['fta'] as dynamic,
      // ftm: json['ftm'] as int,
      // game: Game.fromJson(json['game'] as Map<String, dynamic>),
      min: json['min'] as dynamic,
      // oreb: json['oreb'] as int,
      // pf: json['pf'] as int,
      // player: Player.fromJson(json['player'] as Map<String, dynamic>),
      // pts: json['pts'] as int,
      // reb: json['reb'] as int,
      // stl: json['stl'] as int,
      team: Team.fromJson(json['team'] as Map<String, dynamic>),
      turnover: json['turnover'] as dynamic,
    );

Map<String, dynamic> _$StatToJson(Stat instance) => <String, dynamic>{
      'id': instance.id,
      'ast': instance.ast,
      'blk': instance.blk,
      'dreb': instance.dreb,
      // 'fg3_pct': instance.fg3Pct,
      // 'fg3a': instance.fg3A,
      // 'fg3m': instance.fg3M,
      // 'fg_pct': instance.fgPct,
      // 'fga': instance.fga,
      // 'fgm': instance.fgm,
      // 'ft_pct': instance.ftPct,
      'fta': instance.fta,
      // 'ftm': instance.ftm,
      // 'game': instance.game.toJson(),
      'min': instance.min,
      // 'oreb': instance.oreb,
      // 'pf': instance.pf,
      // 'player': instance.player.toJson(),
      // 'pts': instance.pts,
      // 'reb': instance.reb,
      // 'stl': instance.stl,
      'team': instance.team.toJson(),
      'turnover': instance.turnover,
    };
