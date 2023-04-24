import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
// import 'package:flutter_application_1/APIpage/api_fooddetail.dart';
import 'package:project_v1/FoodDetail/food_ingredient.dart';
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

class MealsList extends StatefulWidget {
  @override
  _MealsListState createState() => _MealsListState();
}

class _MealsListState extends State<MealsList> {
  late Future<List<Meal>> _futureMeals;

  @override
  void initState() {
    super.initState();
    _futureMeals = fetchMeals();
  }

  Future<List<Meal>> fetchMeals() async {
    final response = await http.get(
      Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s='),
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
    return Scaffold(
      backgroundColor: Colors.amber[800],
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Meals",
          style: TextStyle(
              fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/home");
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Column(children: [
          FutureBuilder<List<Meal>>(
            future: _futureMeals,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                    child: GridView.builder(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 18,
                                mainAxisExtent: 250,
                                crossAxisSpacing: 18),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final meal = snapshot.data![index];
                          return  GestureDetector(
                            onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => FoodIngredientnPage( mealId : meal.id),),),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, bottom: 10, left: 10, right: 10),
                              child: Column(children: [
                                Container(
                                  height: 150,
                                  width: MediaQuery.of(context).size.width * 0.7,
                                  decoration:  BoxDecoration(
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
                                          meal.thumbnailUrl ?? ""),
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
                                      title: Text(
                                          meal.name,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                      subtitle: Text(
                                        meal.tags ?? "",
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
                          );
                          // Stack(
                          //   clipBehavior: Clip.none,
                          //   children: [
                          //     Card(
                          //       elevation: 10,
                          //       color: Colors.white,
                          //       child: Container(
                          //         margin: EdgeInsets.all(10),
                          //         padding: EdgeInsets.all(5),
                          //         height: 230,
                          //         width:
                          //             MediaQuery.of(context).size.width * 0.5 -
                          //                 48,
                          //         child: Column(
                          //           crossAxisAlignment:
                          //               CrossAxisAlignment.start,
                          //           children: [
                          //             Center(
                          //               child: Container(
                          //                   // right: 0,
                          //                   child: Image.network(
                          //                 meal.thumbnailUrl ?? "",
                          //                 height: 100,
                          //                 width: 100,
                          //               )),
                          //             ),
                          //             const SizedBox(
                          //               height: 5,
                          //             ),
                          //             Text(
                          //               meal.name,
                          //               style: TextStyle(
                          //                   fontSize: 18,
                          //                   fontWeight: FontWeight.bold),
                          //             ),
                          //             Text(meal.tags ?? "",
                          //                 maxLines: 5,
                          //                 overflow: TextOverflow.ellipsis,
                          //                 style: TextStyle(
                          //                   fontSize: 10,
                          //                 )),
                          //             Text("",
                          //                 maxLines: 5,
                          //                 overflow: TextOverflow.ellipsis,
                          //                 style: TextStyle(
                          //                   fontSize: 10,
                          //                 )),
                          //             GestureDetector(
                          //               onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => FoodIngredientnPage( mealId : meal.id),),),
                          //               child:Container(
                          //                   height: 20,
                          //                   width: 100,
                          //                   decoration: BoxDecoration(
                          //                       borderRadius: BorderRadius.circular(10),
                          //                       color: Colors.amber[800]),
                          //                   child: Center(
                          //                       child: Text(
                          //                     "See More",
                          //                     style: TextStyle(
                          //                         fontSize: 15,
                          //                         color: Colors.white,
                          //                         fontWeight: FontWeight.bold),
                          //                   )
                          //                 ),
                          //               ),
                          //             )
                          //           ],
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // );
                        }));
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ]),
      ),
    );
  }
}
