import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/rendering.dart';

class Homee extends StatefulWidget {
  const Homee({Key? key}) : super(key: key);

  @override
  State<Homee> createState() => _HomeeState();
}

class _HomeeState extends State<Homee> {
  late final PageController pageController;
  final ScrollController _scrollController = ScrollController();
  int pageNo = 0;

  Timer? carasouelTmer;

  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 2), (timer) {
      if (pageNo == url.length) {
        pageNo = 0;
      }
      pageController.animateToPage(
        pageNo,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCirc,
      );
      pageNo++;
    });
  }

  final List<String> url = <String>[
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRtvK8ycVBe6rK6pAP48JcHmhldu26Zz9UqQ&usqp=CAU',
    'https://e00-marca.uecdn.es/assets/multimedia/imagenes/2022/03/10/16469292672376.jpg',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0tiQBB7I1vxBLxFHfMlA4z-epKAabXTM8vQ&usqp=CAU',
    'https://a4.espncdn.com/combiner/i?img=%2Fphoto%2F2023%2F0316%2Fr1145470_1296x729_16%2D9.jpg',
    'https://e0.365dm.com/21/10/768x432/skysports-nba-giannis-antetokounmpo_5551080.jpg?20211018203931',
    'https://library.sportingnews.com/styles/twitter_card_120x120/s3/2023-04/GettyImages-1244568141%20%281%29.jpg?itok=UzuMyc4-',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Carter_vs_Gasol%2C_Lakers_vs_Magic.jpg/640px-Carter_vs_Gasol%2C_Lakers_vs_Magic.jpg'
  ];

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
    carasouelTmer = getTimer();
    _scrollController.addListener(() {
      if (_scrollController.position.userScrollDirection ==
          ScrollDirection.reverse) {
        showBtmAppBr = false;
        setState(() {});
      } else {
        showBtmAppBr = true;
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  bool showBtmAppBr = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SafeArea(
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                const SizedBox(
                  height: 5.0,
                ),
                SizedBox(
                  height: 250,
                  child: PageView.builder(
                    controller: pageController,
                    onPageChanged: (index) {
                      pageNo = index;
                      setState(() {});
                    },
                    itemBuilder: (_, index) {
                      return AnimatedBuilder(
                        animation: pageController,
                        builder: (ctx, child) {
                          return child!;
                        },
                        child: GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text("Hello you tapped at ${index + 1} "),
                              ),
                            );
                          },
                          onPanDown: (d) {
                            carasouelTmer?.cancel();
                            carasouelTmer = null;
                          },
                          onPanCancel: () {
                            carasouelTmer = getTimer();
                          },
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              child: Image.network(
                                url[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: url.length,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    url.length,
                    (index) => GestureDetector(
                      child: Container(
                        margin: const EdgeInsets.all(2.0),
                        child: Icon(
                          Icons.circle,
                          size: 12.0,
                          color: pageNo == index
                              ? Colors.indigoAccent
                              : Colors.grey.shade300,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
