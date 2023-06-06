// // To parse this JSON data, do
// //
// //     final Game = GameFromJson(jsonString);

// import 'dart:convert';

// List<Game> GameFromJson(String str) =>
//     List<Game>.from(json.decode(str).map((x) => Game.fromJson(x)));

// String GameToJson(List<Game> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Game {
//   final int id;
//   final DateTime date;
//   final Team homeTeam;
//   final int homeTeamScore;
//   final int period;
//   final bool postseason;
//   final int season;
//   final Status status;
//   final Time time;
//   final Team visitorTeam;
//   final int visitorTeamScore;

//   Game({
//     required this.id,
//     required this.date,
//     required this.homeTeam,
//     required this.homeTeamScore,
//     required this.period,
//     required this.postseason,
//     required this.season,
//     required this.status,
//     required this.time,
//     required this.visitorTeam,
//     required this.visitorTeamScore,
//   });

//   factory Game.fromJson(Map<String, dynamic> json) => Game(
//         id: json["id"],
//         date: DateTime.parse(json["date"]),
//         homeTeam: Team.fromJson(json["home_team"]),
//         homeTeamScore: json["home_team_score"],
//         period: json["period"],
//         postseason: json["postseason"],
//         season: json["season"],
//         status: statusValues.map[json["status"]]!,
//         time: timeValues.map[json["time"]]!,
//         visitorTeam: Team.fromJson(json["visitor_team"]),
//         visitorTeamScore: json["visitor_team_score"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "date": date.toIso8601String(),
//         "home_team": homeTeam.toJson(),
//         "home_team_score": homeTeamScore,
//         "period": period,
//         "postseason": postseason,
//         "season": season,
//         "status": statusValues.reverse[status],
//         "time": timeValues.reverse[time],
//         "visitor_team": visitorTeam.toJson(),
//         "visitor_team_score": visitorTeamScore,
//       };
// }

// class Team {
//   final int id;
//   final String abbreviation;
//   final String city;
//   final Conference conference;
//   final Division division;
//   final String fullName;
//   final String name;

//   Team({
//     required this.id,
//     required this.abbreviation,
//     required this.city,
//     required this.conference,
//     required this.division,
//     required this.fullName,
//     required this.name,
//   });

//   factory Team.fromJson(Map<String, dynamic> json) => Team(
//         id: json["id"],
//         abbreviation: json["abbreviation"],
//         city: json["city"],
//         conference: conferenceValues.map[json["conference"]]!,
//         division: divisionValues.map[json["division"]]!,
//         fullName: json["full_name"],
//         name: json["name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "abbreviation": abbreviation,
//         "city": city,
//         "conference": conferenceValues.reverse[conference],
//         "division": divisionValues.reverse[division],
//         "full_name": fullName,
//         "name": name,
//       };
// }

// enum Conference { EAST, WEST }

// final conferenceValues =
//     EnumValues({"East": Conference.EAST, "West": Conference.WEST});

// enum Division { ATLANTIC, SOUTHEAST, PACIFIC, CENTRAL, SOUTHWEST, NORTHWEST }

// final divisionValues = EnumValues({
//   "Atlantic": Division.ATLANTIC,
//   "Central": Division.CENTRAL,
//   "Northwest": Division.NORTHWEST,
//   "Pacific": Division.PACIFIC,
//   "Southeast": Division.SOUTHEAST,
//   "Southwest": Division.SOUTHWEST
// });

// enum Status { FINAL }

// final statusValues = EnumValues({"Final": Status.FINAL});

// enum Time { EMPTY, TIME }

// final timeValues = EnumValues({" ": Time.EMPTY, "     ": Time.TIME});

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
