// import 'dart:async';
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/APIpage/api_fooddetail.dart';
// import 'package:http/http.dart' as http;

// class Meal {
//   final String id;
//   final String name;
//   final String? thumbnailUrl;
//   String? category;
//   String? tags;

//   Meal({
//     required this.id,
//     required this.name,
//     this.thumbnailUrl,
//     this.tags,
//     this.category,
//   });

//   factory Meal.fromJson(Map<String, dynamic> json) {
//     return Meal(
//         id: json['idMeal'],
//         name: json['strMeal'],
//         thumbnailUrl: json['strMealThumb'],
//         category: json['strCategory'],
//         tags: json['strTags']);
//   }
// }

// class HomeList extends StatefulWidget {
//   @override
//   _HomeListState createState() => _HomeListState();
// }

// class _HomeListState extends State<HomeList> {
//   late Future<List<Meal>> _futureMeals;

//   @override
//   void initState() {
//     super.initState();
//     _futureMeals = fetchMealsH();
//   }

//   Future<List<Meal>> fetchMealsH() async {
//     final response = await http.get(
//       Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s=meat'),
//     );

//     if (response.statusCode == 200) {
//       final parsed =
//           json.decode(response.body)['meals'].cast<Map<String, dynamic>>();
//       return parsed.map<Meal>((json) => Meal.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load meals');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<Meal>>(
//       future: _futureMeals,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return GridView.builder(
//           padding: const EdgeInsets.only(left: 15, right: 15),
//           shrinkWrap: true,
//           gridDelegate:
//           const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 1,
//           ),
//           // mainAxisSpacing: 18,
//           // mainAxisExtent: 250,
//           // crossAxisSpacing: 18),
//           itemCount: snapshot.data!.length,
//           itemBuilder: (context, index) {
//             final meal = snapshot.data![index];
//             return Padding(
//           padding: const EdgeInsets.only(
//               top: 50.0, bottom: 10, left: 20, right: 20),
//           child: Column(children: [
//             Container(
//               height: 150,
//               width: 500,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(10),
//                     topRight: Radius.circular(10)),
//                 boxShadow: const [
//                   BoxShadow(
//                     color: Color.fromARGB(255, 102, 102, 102),
//                     blurRadius: 10,
//                     offset: Offset(8, 5), // Shadow position
//                   ),
//                 ],
//                 image: DecorationImage(
//                   image: NetworkImage(meal.thumbnailUrl!),
//                   fit: BoxFit.fitWidth,
//                 ),
//               ),
//             ),
//             Container(
//               height: 70,
//               width: 500,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(10),
//                     bottomRight: Radius.circular(10)),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Color.fromARGB(255, 102, 102, 102),
//                     blurRadius: 10,
//                     offset: Offset(8, 5), // Shadow position
//                   ),
//                 ],
//               ),
//               child: Flexible(
//                 child: ListTile(
//                   title: Text(meal.name,
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 15,
//                           fontWeight: FontWeight.bold)),
//                   subtitle: Text(
//                     meal.tags ?? "",
//                     style: TextStyle(
//                         color: Colors.grey,
//                         fontSize: 15,
//                         fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//             ),
//           ]),
//             );

//             // return Card(
//             //   elevation: 10,
//             //   color: Colors.white,
//             //   child: Container(
//             //     // margin: EdgeInsets.all(10),
//             //     // padding: EdgeInsets.all(5),
//             //     height: 280,
//             //     width: MediaQuery.of(context).size.width * 0.67,
//             //     child: Column(
//             //       crossAxisAlignment: CrossAxisAlignment.start,
//             //       children: [
//             //         Center(
//             //           child: Container(
//             //               // right: 0,
//             //               child: Image.network(
//             //             meal.thumbnailUrl ?? "",
//             //             height: 100,
//             //             width: 100,
//             //           )),
//             //         ),
//             //         const SizedBox(
//             //           height: 5,
//             //         ),
//             //         Text(
//             //           meal.name,
//             //           style: TextStyle(
//             //               fontSize: 18,
//             //               fontWeight: FontWeight.bold),
//             //         ),
//             //         Text(meal.tags ?? "",
//             //             maxLines: 5,
//             //             overflow: TextOverflow.ellipsis,
//             //             style: TextStyle(
//             //               fontSize: 10,
//             //             )),
//             //         ElevatedButton(
//             //           onPressed: () {
//             //             // onTap:
//             //             // () => _onMealTap(meal);
//             //           },
//             //           child: Text("See Now"),
//             //           style: ElevatedButton.styleFrom(
//             //               backgroundColor: Colors.orange),
//             //         )
//             //       ],
//             //     ),
//             //   ),
//             // );
//           });
//     } else if (snapshot.hasError) {
//       return Text('${snapshot.error}');
//     }
//     return const CircularProgressIndicator();
//         },
//       );
//     // );
//   }

//   // void _onMealTap(Meal meal) {
//   //   Navigator.push(
//   //     context,
//   //     MaterialPageRoute(
//   //       builder: (context) => My_search(meal: meal),
//   //     ),
//   //   );
//   // }
// }

// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:project_v1/APIpage/api_fooddetail.dart';
import 'package:http/http.dart' as http;

class Meal {
  final String id;
  final String name;
  final String? thumbnailUrl;
  String? category;
  String? tags;

  Meal({
    required this.id,
    required this.name,
    this.thumbnailUrl,
    this.tags,
    this.category,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
        id: json['idMeal'],
        name: json['strMeal'],
        thumbnailUrl: json['strMealThumb'],
        category: json['strCategory'],
        tags: json['strTags']);
  }
}

class HomeList extends StatefulWidget {
  @override
  _HomeListState createState() => _HomeListState();
}

class _HomeListState extends State<HomeList> {
  late Future<List<Meal>> _futureMeals;

  @override
  void initState() {
    super.initState();
    _futureMeals = fetchMeals();
  }

  Future<List<Meal>> fetchMeals() async {
    final response = await http.get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s=meat'),
    );

    if (response.statusCode == 200) {
      final parsed =
          json.decode(response.body)['meals'].cast<Map<String, dynamic>>();
      return parsed.map<Meal>((json) => Meal.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load meals');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FutureBuilder<List<Meal>>(
          future: _futureMeals,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return
                  //  Expanded(
                  //     child:
                  ListView.builder(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      shrinkWrap: true,
                      // gridDelegate:
                      //     const SliverGridDelegateWithFixedCrossAxisCount(
                      //         crossAxisCount: 4,
                      //         mainAxisSpacing: 50,
                      //         mainAxisExtent: 270,
                      //         crossAxisSpacing: 50
                      // ),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final meal = snapshot.data![index];
                        return Row(
                          // clipBehavior: Clip.none,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 50.0, bottom: 10, left: 20, right: 20),
                              child: Column(children: [
                                Container(
                                  height: 150,
                                  width: MediaQuery.of(context).size.width * 0.8,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color.fromARGB(255, 102, 102, 102),
                                        blurRadius: 10,
                                        offset: Offset(8, 5), // Shadow position
                                      ),
                                    ],
                                    image: DecorationImage(
                                      image: AssetImage(meal.thumbnailUrl ?? ""),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 70,
                                  width: MediaQuery.of(context).size.width * 0.8,
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
                                      title: Text(meal.name,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      subtitle: Row(
                                        children: [
                                          // Text(
                                          //   "Category: ",
                                          //   style: TextStyle(
                                          //       color: Colors.grey,
                                          //       fontSize: 15,
                                          //       fontWeight: FontWeight.bold),
                                          // ),
                                          Text(
                                            meal.category!,
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            ": ",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            meal.tags?? "",
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                            // Card(
                            //   elevation: 10,
                            //   color: Colors.white,
                            //   child: Container(
                            //     margin: EdgeInsets.all(10),
                            //     padding: EdgeInsets.all(5),
                            //     height: 280,
                            //     width:
                            //         MediaQuery.of(context).size.width * 0.5 -
                            //             48,
                            //     child: Column(
                            //       crossAxisAlignment:
                            //           CrossAxisAlignment.start,
                            //       children: [
                            //         Center(
                            //           child: Container(
                            //               // right: 0,
                            //               child: Image.network(
                            //             meal.thumbnailUrl ?? "",
                            //             height: 100,
                            //             width: 100,
                            //           )),
                            //         ),
                            //         const SizedBox(
                            //           height: 5,
                            //         ),
                            //         Text(
                            //           meal.name,
                            //           style: TextStyle(
                            //               fontSize: 18,
                            //               fontWeight: FontWeight.bold),
                            //         ),
                            //         Text(meal.tags ?? "",
                            //             maxLines: 5,
                            //             overflow: TextOverflow.ellipsis,
                            //             style: TextStyle(
                            //               fontSize: 10,
                            //             )),
                            //         ElevatedButton(
                            //           onPressed: () {},
                            //           child: Text("See Now"),
                            //           style: ElevatedButton.styleFrom(
                            //               backgroundColor: Colors.orange),
                            //         )
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
                        );
                      }
                      // )
                      );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ],
    );
    //   ),
    // );
  }
}
