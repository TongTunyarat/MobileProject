import 'package:flutter/material.dart';
import 'package:project_v1/home_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_v1/Login/singup_page.dart';


TextEditingController _input = new TextEditingController();

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePage1();
}

class _HomePage1 extends State<HomePage> with TickerProviderStateMixin {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
      appBar: AppBar(
        leadingWidth: 25,
        backgroundColor: Colors.amber[800],

        leading: Icon(Icons.restaurant,
            color: Colors.white, size: 30),

        actions: [

          IconButton(
            onPressed: () {
              signOut(context);
            },
            icon: Icon(Icons.output, size: 30),
            color: Colors.white,
          )
        ],
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 20, left: 5),
                  child: Text("Recommended",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left)),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 10, left: 10, right: 10),
                        child: Column(children: [
                          Container(
                            height: 150,
                            width: MediaQuery.of(context).size.width * 0.7,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 102, 102, 102),
                                  blurRadius: 10,
                                  offset: Offset(8, 5), // Shadow position
                                ),
                              ],
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://www.themealdb.com/images/media/meals/ypuxtw1511297463.jpg"),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          Container(
                            height: 70,
                            width: MediaQuery.of(context).size.width * 0.7,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 102, 102, 102),
                                  blurRadius: 10,
                                  offset: Offset(8, 5), // Shadow position
                                ),
                              ],
                            ),
                            child: Flexible(
                              child: ListTile(
                                title: Text('Turkey Meatloaf',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                subtitle: Text(
                                  'Miscellaneous, Alcoholic',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 10, left: 10, right: 10),
                        child: Column(children: [
                          Container(
                            height: 150,
                            width: MediaQuery.of(context).size.width * 0.7,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 102, 102, 102),
                                  blurRadius: 10,
                                  offset: Offset(8, 5), // Shadow position
                                ),
                              ],
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://www.themealdb.com/images/media/meals/uttupv1511815050.jpg"),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          Container(
                            height: 70,
                            width: MediaQuery.of(context).size.width * 0.7,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 102, 102, 102),
                                  blurRadius: 10,
                                  offset: Offset(8, 5), // Shadow position
                                ),
                              ],
                            ),
                            child: Flexible(
                              child: ListTile(
                                title: Text('Montreal Smoked Meat',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                subtitle: Text(
                                  'Beef, Speciality, Snack, StrongFlavor',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 10, left: 10, right: 10),
                        child: Column(children: [
                          Container(
                            height: 150,
                            width: 500,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 102, 102, 102),
                                  blurRadius: 10,
                                  offset: Offset(8, 5), // Shadow position
                                ),
                              ],
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://www.themealdb.com/images/media/meals/lhqev81565090111.jpg"),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          Container(
                            height: 70,
                            width: 500,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 102, 102, 102),
                                  blurRadius: 10,
                                  offset: Offset(8, 5), // Shadow position
                                ),
                              ],
                            ),
                            child: Flexible(
                              child: ListTile(
                                title: Text('Bitterballen (Dutch meatballs',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                subtitle: Text(
                                  'Beef, DinnerParty, HangoverFood, Alcoholic',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 10.0, bottom: 10, left: 10, right: 10),
                        child: Column(children: [
                          Container(
                            height: 150,
                            width: 500,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 102, 102, 102),
                                  blurRadius: 10,
                                  offset: Offset(8, 5), // Shadow position
                                ),
                              ],
                              image: DecorationImage(
                                image: NetworkImage(
                                    "https://www.themealdb.com/images/media/meals/o2wb6p1581005243.jpg"),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          Container(
                            height: 70,
                            width: 500,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 102, 102, 102),
                                  blurRadius: 10,
                                  offset: Offset(8, 5), // Shadow position
                                ),
                              ],
                            ),
                            child: Flexible(
                              child: ListTile(
                                title: Text(
                                    'Soy-Glazed Meatloaves with Wasabi Mashed Potatoes & Roasted Carrots',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                subtitle: Text(
                                  'Beef',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ]),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 310, left: 5),
                  child: Text("Menu",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left)),
              Padding(
                padding: const EdgeInsets.only(top: 370),
                child: SizedBox(
                  height: 120,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, "/foodlist");
                      },
                      child: Container(
                        // height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.8,
                        // alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          image: DecorationImage(
                              image: AssetImage("assets/images/burger.png"),
                              // fit: BoxFit.fitWidth,
                              alignment: Alignment.centerRight),
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(255, 102, 102, 102),
                              blurRadius: 10,
                              offset: Offset(8, 5), // Shadow position
                            ),
                          ],
                        ),
                        child: Padding(
                            padding: const EdgeInsets.only(top: 50, left: 20),
                            child: const Text("Meals",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left)),
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 520, left: 5),
                child: Text("LET's Play!!",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 570, right: 5),
                  child: SizedBox(
                      height: 170,
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/spin');
                            },
                            child: Container(
                              width: 170,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: const Color.fromARGB(255, 255, 255, 255),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 102, 102, 102),
                                    blurRadius: 10,
                                    offset: Offset(8, 5), // Shadow position
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Image.asset(
                                      'lib/image/spin.png',
                                      width: 110,
                                      height: 110,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 1),
                                    child: Text("Spin",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/opencard');
                            },
                            child: Container(
                              width: 170,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: const Color.fromARGB(255, 255, 255, 255),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromARGB(255, 102, 102, 102),
                                    blurRadius: 10,
                                    offset: Offset(8, 5), // Shadow position
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Image.asset(
                                      'lib/image/card.png',
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 10),
                                    child: Text("Open Card",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ]))),
              Padding(
                padding: const EdgeInsets.only(top: 550),
                child: Column(
                  children: [
                    Text(
                      "......",
                      style: TextStyle(
                        fontSize: 50,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      // width: 500,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signOut(BuildContext context) {
    _auth.signOut();
    print('user logged out');
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => singup_Page()));
    //Navigator.pushNamed(context, '/singup');
  }
}
