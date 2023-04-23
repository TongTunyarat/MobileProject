import 'package:flutter/material.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 250, 245, 228),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage("assets/images/3.png"),
            colorFilter: ColorFilter.mode(
              Colors.white.withOpacity(0.85),
              BlendMode.modulate,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(children: [
          Flexible(
            child: Row(
              children: [
                const Flexible(
                  child: Padding(
                    padding: EdgeInsets.only(left: 50, bottom: 300),
                    child: Text(
                      "F",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 300,
                        fontFamily: 'RobotoSlab',
                        fontWeight: FontWeight.w900,
                        shadows: [
                          Shadow(
                            blurRadius: 20.0, // shadow blur
                            color: Color.fromARGB(255, 0, 0, 0), // shadow color
                            offset:
                                Offset(3, 3), // how much shadow will be shown
                          ),
                        ],
                      ),
                      strutStyle: StrutStyle(
                        fontSize: 350.0,
                        height: 1.1,
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    const Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(top: 200, right: 40, left: 0),
                        child: Text(
                          "IND",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 40,
                            fontFamily: 'RobotoSlab',
                            fontWeight: FontWeight.w900,
                            shadows: [
                              Shadow(
                                blurRadius: 20.0, // shadow blur
                                color: Color.fromARGB(
                                    255, 0, 0, 0), // shadow color
                                offset: Offset(
                                    5, 3), // how much shadow will be shown
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(right: 35, top: 10),
                        child: Text(
                          "OOD",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 40,
                            fontFamily: 'RobotoSlab',
                            fontWeight: FontWeight.w900,
                            shadows: [
                              Shadow(
                                blurRadius: 20.0, // shadow blur
                                color: Color.fromARGB(
                                    255, 0, 0, 0), // shadow color
                                offset: Offset(
                                    5, 3), // how much shadow will be shown
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Flexible(
                      child: Padding(
                        padding: EdgeInsets.only(right: 40, top: 5, bottom: 15),
                        child: Text(
                          "EED",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 40,
                            fontFamily: 'RobotoSlab',
                            fontWeight: FontWeight.w900,
                            shadows: [
                              Shadow(
                                blurRadius: 20.0, // shadow blur
                                color: Color.fromARGB(
                                    255, 0, 0, 0), // shadow color
                                offset: Offset(
                                    5, 3), // how much shadow will be shown
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/signin');
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 40),
                        child: Container(
                          height: 50,
                          width: 110,
                          // width: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color.fromARGB(255, 0, 0, 0),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(255, 51, 51, 51),
                                blurRadius: 10,
                                offset: Offset(8, 5), // Shadow position
                              ),
                            ],
                          ),
                          child: const Center(
                            child: Text(
                              "Get Start!",
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
