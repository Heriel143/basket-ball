// import 'package:first_app/api.dart';
import 'package:first_app/home.dart';
import 'package:first_app/introduction.dart';
import 'package:first_app/player_details.dart';
import 'package:first_app/providers/team_provider.dart';
import 'package:first_app/team_details.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

import 'games.dart';
import 'players.dart';
import 'providers/game_provider.dart';
import 'providers/player_provider.dart';
import 'stats.dart';
import 'teams.dart';
import 'game_details.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  /// Creates a [MyApp]
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GameListProvider()),
        ChangeNotifierProvider(create: (context) => PlayerListProvider()),
        ChangeNotifierProvider(create: (context) => TeamListProvider()),
        // Provider<Api>(create: (context) => Api()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Introduction(),
      ),
    );
  }
}

/// Builds the "shell" for the app by building a Scaffold with a
/// BottomNavigationBar, where [child] is placed in the body of the Scaffold.
class ScaffoldWithNavBar extends StatelessWidget {
  /// Constructs an [ScaffoldWithNavBar].
  const ScaffoldWithNavBar({
    required this.child,
    super.key,
  });

  /// The widget to display in the body of the Scaffold.
  /// In this sample, it is a Navigator.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Basket'),
      // ),

      body: child,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          child: GNav(
              backgroundColor: Colors.white,
              color: Colors.black,
              activeColor: Colors.black,
              // rippleColor: Colors.white,

              // tabActiveBorder: Colors.white,
              // tabBackgroundColor: Color.fromARGB(225, 54, 54, 54),
              gap: 4,
              tabActiveBorder: Border.all(width: 2),
              padding: const EdgeInsets.all(10),
              selectedIndex: _calculateSelectedIndex(context),
              onTabChange: (int index) => _onItemTapped(index, context),
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                  // onPressed: Go,
                  // iconActiveColor: Colors.white,
                  // activeBorder: Colors.white,
                ),
                GButton(
                  icon: Icons.scoreboard_outlined,
                  text: 'Games',
                  // onPressed: Go,
                  // iconActiveColor: Colors.white,
                  // activeBorder: Colors.white,
                ),
                GButton(
                  icon: Icons.sports_handball_outlined,
                  text: 'Players',
                ),
                GButton(
                  icon: Icons.bar_chart_outlined,
                  text: 'Stats',
                ),
                GButton(
                  icon: Icons.sports_basketball_outlined,
                  text: 'Teams',
                )
              ]),
        ),
      ),
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final String location = GoRouterState.of(context).location;
    if (location.startsWith('/')) {
      return 0;
    }
    if (location.startsWith('/games')) {
      return 1;
    }
    if (location.startsWith('/players')) {
      return 2;
    }
    if (location.startsWith('/stats')) {
      return 3;
    }
    if (location.startsWith('/teams')) {
      return 4;
    }
    return 0;
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/');
        break;
      case 1:
        GoRouter.of(context).go('/games');
        break;
      case 2:
        GoRouter.of(context).go('/players');
        break;
      case 3:
        GoRouter.of(context).go('/stats');
        break;
      case 4:
        GoRouter.of(context).go('/teams');
        break;
    }
  }
}

class Main extends StatelessWidget {
  Main({Key? key}) : super(key: key);

  final GoRouter _router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: <RouteBase>[
      /// Application shell
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return ScaffoldWithNavBar(child: child);
        },
        routes: <RouteBase>[
          /// The first screen to display in the bottom navigation bar.
          GoRoute(
            path: '/',
            builder: (BuildContext context, GoRouterState state) {
              return Home();
            },
            // routes: <RouteBase>[
            //   // The details screen to display stacked on the inner Navigator.
            //   // This will cover screen A but not the application shell.
            //   GoRoute(
            //     path: 'details',
            //     builder: (BuildContext context, GoRouterState state) {
            //       return const DetailsScreen(label: 'GAMES');
            //     },
            //   ),
            // ],
          ),
          GoRoute(
            path: '/games',
            builder: (BuildContext context, GoRouterState state) {
              return const Games();
            },
            routes: <RouteBase>[
              // The details screen to display stacked on the inner Navigator.
              // This will cover screen A but not the application shell.
              GoRoute(
                  path: 'details/:id',
                  builder: (context, state) =>
                      GameDetails(id: state.pathParameters['id']!)),
            ],
          ),

          /// Displayed when the second item in the the bottom navigation bar is
          /// selected.
          GoRoute(
            path: '/players',
            builder: (BuildContext context, GoRouterState state) {
              return Players();
            },
            routes: <RouteBase>[
              /// Same as "/a/details", but displayed on the root Navigator by
              /// specifying [parentNavigatorKey]. This will cover both screen B
              /// and the application shell.
              GoRoute(
                path: 'details/:id',
                // parentNavigatorKey: _rootNavigatorKey,
                builder: (BuildContext context, GoRouterState state) {
                  return PlayerDetails(id: state.pathParameters['id']!);
                },
              ),
            ],
          ),

          /// The third screen to display in the bottom navigation bar.
          GoRoute(
            path: '/stats',
            builder: (BuildContext context, GoRouterState state) {
              return const Stats();
            },
            // routes: <RouteBase>[
            //   // The details screen to display stacked on the inner Navigator.
            //   // This will cover screen A but not the application shell.
            //   GoRoute(
            //     path: 'details',
            //     builder: (BuildContext context, GoRouterState state) {
            //       return const DetailsScreen(label: 'STATS');
            //     },
            //   ),
            // ],
          ),
          GoRoute(
            path: '/teams',
            builder: (BuildContext context, GoRouterState state) {
              return Teams();
            },
            routes: <RouteBase>[
              // The details screen to display stacked on the inner Navigator.
              // This will cover screen A but not the application shell.
              GoRoute(
                path: 'details/:id',
                builder: (BuildContext context, GoRouterState state) {
                  return TeamDetails(id: state.pathParameters['id']!);
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Basket',
      color: Colors.black,
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primarySwatch: Colors.grey,
      //   // cardColor: Colors.amber,
      // ),
      // home: Home(),
      routerConfig: _router,
    );
  }
}
