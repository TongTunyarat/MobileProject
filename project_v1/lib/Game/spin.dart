import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
class SpinPage extends StatefulWidget {
  const SpinPage({super.key});
  @override
  _SpinPageState createState() => _SpinPageState();
}

class _SpinPageState extends State<SpinPage> with TickerProviderStateMixin {
  StreamController<int> selected = StreamController<int>();
  late TabController _tabController;

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final items = <String>[
      'Omelette',
      'Salad',
      'Hamburger',
      'Sandwich',
      'Pizza',
      'Steak',
      'Spaghetti',
      'Noodle',
      'Fried chicken',
      'Green Curry',
      'Massa man Curry',
      'Tom Yum Kung',
    ];
    int _currentIndex = 0;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'SPIN',
            style: TextStyle(
                fontSize: 35, color: Color.fromARGB(255, 20, 20, 20), fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color.fromARGB(255, 251, 250, 250),
          leading: const CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 20,
            child: BackButton(
              color: Color.fromARGB(255, 20, 20, 20),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/1.png"),
                  colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.75),
                    BlendMode.modulate,
                  ),
                  fit: BoxFit.cover)),
          child: SafeArea(
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 50, bottom: 450),
                child: Image.asset("lib/image/gametime.png", width: 300),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.65,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Text(
                              "Let's play!! to choose a food",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            alignment: Alignment.topCenter,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: FortuneWheel(
                              selected: selected.stream,
                              items: [
                                for (var it in items)
                                  FortuneItem(
                                      child: Text(
                                    it,
                                    style: TextStyle(color: Colors.black),
                                  )),
                              ],
                              // styleStrategy: const UniformStyleStrategy(
                              //   borderColor: Colors.white,
                              //   color: Colors.,
                              // ),
                              indicators: const [
                                FortuneIndicator(
                                  alignment: Alignment.topCenter,
                                  child: TriangleIndicator(
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selected.add(
                                Fortune.randomInt(0, items.length),
                              );
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 50, top: 50),
                            child: Container(
                              height: 50,
                              width: 150,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  color: Colors.amber[800]),
                              child: Center(
                                  child: Text(
                                "START",
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ]),
          ),
        ));
  }
}
