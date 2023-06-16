import 'package:first_app/login.dart';
// import 'package:first_app/main.dart';
import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
import 'package:introduction_screen/introduction_screen.dart';

class Introduction extends StatelessWidget {
  Introduction({Key? key}) : super(key: key);

  final List<PageViewModel> pages = [
    PageViewModel(
      // titleWidget: ,
      decoration: const PageDecoration(
        contentMargin: EdgeInsets.all(0),
        bodyFlex: 0,
      ),
      title: 'Basket ball',
      body:
          'Live updates, statistics, individual players information just on your finger tips.',
      image: Center(
        child: Image.asset(
          'assets/logo10.png',
          width: 400,
        ),
      ),
    ),
    PageViewModel(
      decoration:
          const PageDecoration(contentMargin: EdgeInsets.all(0), bodyFlex: 0),
      image: Center(
        child: Image.asset(
          'assets/logo5.png',
          width: 500,
        ),
      ),
      title: 'Play Off',
      body:
          'Best players, records and Tranfer rumors you can get them right away.',
      // footer: const ElevatedButton(
      //   onPressed: () {},
      //   child: Text('Lets go'),
      // )
    ),
    PageViewModel(
      decoration:
          const PageDecoration(contentMargin: EdgeInsets.all(0), bodyFlex: 0),
      image: Center(
        child: Image.asset(
          'assets/cartoon-basketball-player-is-moving-dribble-with-a-smile-vector-2D1XDDE1.png',
          // width: 1500,
          // height: 700,
        ),
      ),
      title: 'Live Score',
      body:
          'Updates on basketball teams, score points, next match and many more all available in here.',
      // footer: const ElevatedButton(
      //   onPressed: () {},
      //   child: Text('Lets go'),
      // )
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Title'),
      //   centerTitle: true,
      // ),
      // appBar: AppBar(
      //   debugShowCheckedModeBanner: false,
      // ),
      body: IntroductionScreen(
        pages: pages,
        dotsDecorator: const DotsDecorator(
          size: Size(15, 15),
          color: Colors.blue,
          activeColor: Colors.black,
          activeSize: Size.square(20),
        ),
        showDoneButton: true,
        done: const Text(
          'Start to explore',
          // style: TextStyle(
          //   backgroundColor: Colors.blue,
          //   color: Colors.white,
          //   height: 2,
          // ),
        ),
        showSkipButton: true,
        skip: const Text('Skip'),
        showNextButton: true,
        next: const Icon(
          Icons.arrow_forward,
          size: 20,
        ),
        onDone: () {
          onDone(context);
        },
      ),
    );
  }
}

void onDone(context) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  // GoRouter.of(context).go('/');
  // Main();
}
