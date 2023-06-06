// import 'package:first_app/slider.dart';
import 'package:first_app/slider.dart';
import 'package:flutter/material.dart';

// import 'slider.dart';
// import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  Home({
    super.key,
  });

  // List<Map<String, dynamic>> wote = [{name:''}];

  /// The label to display in the center of the screen.
  // final String label;
  final List<String> names = <String>[
    'James',
    'Michael',
    'Jordan',
    'Johnson',
    'Kevin'
  ];
  final List<String> url = <String>[
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRtvK8ycVBe6rK6pAP48JcHmhldu26Zz9UqQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRB79sYOPNA3TVj-VPZCNRhVqYqcJ6QvxdH_Q&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT0tiQBB7I1vxBLxFHfMlA4z-epKAabXTM8vQ&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT64WKxj_QEm8S6DyXwkUXcqpQm5s1sUA9thw&usqp=CAU',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9UR8TeAALsG7ntuZdyJf67OirAn69ecTfRQ&usqp=CAU'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Basket ball",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Players',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                Text(
                  'View all',
                  style: TextStyle(
                      color: Colors.blue[400], fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 180,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) => Container(
                            // height: 200,
                            width: 120,
                            // decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(30)),
                            margin: const EdgeInsets.all(10),
                            // color: Colors.green[700],
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 60,
                                  backgroundColor: Colors.grey.shade800,
                                  backgroundImage: NetworkImage(
                                    url[index],
                                  ),
                                ),
                                // Image.asset(
                                //   'assets/images${index + 1}.png',
                                //   fit: BoxFit.contain,
                                // ),
                                Text(
                                  names[index],
                                  style: const TextStyle(fontSize: 18),
                                )
                              ],
                            ),
                          )),
                )
              ],
            ),
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Games',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          const Homee(),
        ],
      ),
    );
  }
}
