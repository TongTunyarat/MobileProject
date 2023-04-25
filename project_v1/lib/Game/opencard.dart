import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';


class OpenTheCard extends StatefulWidget {
  const OpenTheCard({super.key});

  @override
  State<OpenTheCard> createState() => OpenTheCardState();
}

/// [AnimationController]s can be created with `vsync: this` because of
/// [TickerProviderStateMixin].

class OpenTheCardState extends State<OpenTheCard>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    int _currentIndex = 0;

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 250, 245, 228),
        appBar: AppBar(
          title: const Text(
            'Open The Card',
            style: TextStyle(
                fontSize: 35, color: Color.fromARGB(255, 8, 8, 8), fontWeight: FontWeight.bold),
          ),
          backgroundColor: Color.fromARGB(255, 249, 249, 248),
          leading: const CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 20,
            child: BackButton(
              color: Color.fromARGB(255, 10, 10, 10),
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
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 30, top: 30, bottom: 10),
                      child: GridView.count(
                        primary: false,
                        padding: const EdgeInsets.only(top: 30, right: 20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 3,
                        children: <Widget>[
                          FlipCard(
                            direction: FlipDirection.VERTICAL,
                            front: Container(
                              decoration: const BoxDecoration(
                                // color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/card.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                            back: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/mac.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                          ),
                          FlipCard(
                            direction: FlipDirection.VERTICAL,
                            front: Container(
                              decoration: const BoxDecoration(
                                // color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/card.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                            back: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/tum.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                          ),
                          FlipCard(
                            direction: FlipDirection.VERTICAL,
                            front: Container(
                              decoration: const BoxDecoration(
                                // color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/card.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                            back: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/ton.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                          ),
                          FlipCard(
                            direction: FlipDirection.VERTICAL,
                            front: Container(
                              decoration: const BoxDecoration(
                                // color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/card.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                            back: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/teiew.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                          ),
                          FlipCard(
                            direction: FlipDirection.VERTICAL,
                            front: Container(
                              decoration: const BoxDecoration(
                                // color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/card.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                            back: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/logo/company.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                          ),
                          FlipCard(
                            direction: FlipDirection.VERTICAL,
                            front: Container(
                              decoration: const BoxDecoration(
                                // color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/card.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                            back: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/saim.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                          ),
                          FlipCard(
                            direction: FlipDirection.VERTICAL,
                            front: Container(
                              decoration: const BoxDecoration(
                                // color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/card.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                            back: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/ohgaju.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                          ),
                          FlipCard(
                            direction: FlipDirection.VERTICAL,
                            front: Container(
                              decoration: const BoxDecoration(
                                // color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/card.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                            back: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/bbq.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                          ),
                          FlipCard(
                            direction: FlipDirection.VERTICAL,
                            front: Container(
                              decoration: const BoxDecoration(
                                // color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/card.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                            back: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/domino.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                          ),
                          FlipCard(
                            direction: FlipDirection.VERTICAL,
                            front: Container(
                              decoration: const BoxDecoration(
                                // color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/card.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                            back: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/shabu.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                          ),
                          FlipCard(
                            direction: FlipDirection.VERTICAL,
                            front: Container(
                              decoration: const BoxDecoration(
                                // color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/card.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                            back: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/kfc.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                          ),
                          FlipCard(
                            direction: FlipDirection.VERTICAL,
                            front: Container(
                              decoration: const BoxDecoration(
                                // color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/card.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                            back: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/hachi.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                          ),
                          FlipCard(
                            direction: FlipDirection.VERTICAL,
                            front: Container(
                              decoration: const BoxDecoration(
                                // color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/card.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                            back: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/gulabp.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                          ),
                          FlipCard(
                            direction: FlipDirection.VERTICAL,
                            front: Container(
                              decoration: const BoxDecoration(
                                // color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/card.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                            back: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/burger.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                          ),
                          FlipCard(
                            direction: FlipDirection.VERTICAL,
                            front: Container(
                              decoration: const BoxDecoration(
                                // color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/card.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                            back: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/hut.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                          ),
                          FlipCard(
                            direction: FlipDirection.VERTICAL,
                            front: Container(
                              decoration: const BoxDecoration(
                                // color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/card.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                            back: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/ches.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                          ),
                          FlipCard(
                            direction: FlipDirection.VERTICAL,
                            front: Container(
                              decoration: const BoxDecoration(
                                // color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/card.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                            back: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/mk.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                          ),
                          FlipCard(
                            direction: FlipDirection.VERTICAL,
                            front: Container(
                              decoration: const BoxDecoration(
                                // color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/card.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                            back: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/zab.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                          ),
                          FlipCard(
                            direction: FlipDirection.VERTICAL,
                            front: Container(
                              decoration: const BoxDecoration(
                                // color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/card.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                            back: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/aroi.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                          ),
                          FlipCard(
                            direction: FlipDirection.VERTICAL,
                            front: Container(
                              decoration: const BoxDecoration(
                                // color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/card.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                            back: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/pepper.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                          ),
                          FlipCard(
                            direction: FlipDirection.VERTICAL,
                            front: Container(
                              decoration: const BoxDecoration(
                                // color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/card.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                            back: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                    image: AssetImage("assets/logo/upsorn.png"),
                                    fit: BoxFit.fill,
                                    alignment: Alignment.center),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
            ]),
          ),
        ));
  }
}
