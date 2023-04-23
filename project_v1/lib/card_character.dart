import 'package:flutter/material.dart';

class Mycard extends StatelessWidget {
  final String data;

  const Mycard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 250, 244, 226),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              //color: Color(0xFFF8B400),
              gradient: RadialGradient(
                  colors: [
                    // Color.fromARGB(255, 244, 230, 192),
                    // Color.fromARGB(255, 246, 205, 90),
                    // Color(0xFFF8B400),
                    // Color(0xFFF8B400),
                    Color(0xFF125B50),
                    Color.fromARGB(255, 44, 141, 127),
                    Color.fromARGB(255, 138, 229, 215),
                  ],
                  focal: Alignment(0, -4), //เลขเป็นแกน X,Y
                  radius: 3),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 11, 21, 9), //New
                  blurRadius: 5.0,
                )
              ],
            ),
            height: MediaQuery.of(context).size.height * 0.60,
            width: MediaQuery.of(context).size.width * 0.90,
            child: Center(
              child: Column(
                children: [
                  //margin const EdgeInsets.all(10.0),

                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: CircleAvatar(
                      //padding :

                      backgroundColor: Colors.brown.shade800,
                      backgroundImage: AssetImage('img/3.png'),
                      radius: 120,
                      //child: const Text('logo',),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.all(24),
                    padding: const EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color.fromARGB(255, 245, 249, 249),
                      // gradient: RadialGradient(
                      //     colors: [
                      //       Color.fromARGB(255, 244, 230, 192),
                      //       Color.fromARGB(255, 246, 245, 244),

                      //     ],
                      //     focal: Alignment(0, -4), //เลขเป็นแกน X,Y
                      //     radius: 3),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 99, 87, 49), //New
                          blurRadius: 15.0,
                        )
                      ],
                    ),
                    height: 180,
                    width: 350,
                    child: Column(
                      children: [
                        Text(
                          data,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color.fromARGB(255, 17, 16, 12),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\n Welcome to Find Food Feed \n Have a enjoy with us!\n',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            foreground: Paint()
                              ..shader = LinearGradient(
                                colors: <Color>[
                                  Color.fromARGB(255, 72, 184, 167),
                                  //Color(0xFFFAF5E4),
                                  Color(0xFF125B50), //add more color here.
                                ],
                              ).createShader(
                                  Rect.fromLTWH(50.0, 0.0, 100.0, 50.0)),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
