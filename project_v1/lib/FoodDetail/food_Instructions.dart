import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;


class MealDetails {
  final String id;
  final String name;
  final String? thumbnailUrl;
  String? category;
  String? tags;
  String instructions;

  MealDetails({
    required this.id,
    required this.name,
    this.thumbnailUrl,
    this.category,
    this.tags,
    required this.instructions,
  });

  factory MealDetails.fromJson(Map<String, dynamic> json) {
    return MealDetails(
      id: json['idMeal'],
      name: json['strMeal'],
      thumbnailUrl: json['strMealThumb'],
      category: json['strCategory'],
      tags: json['strTags'],
      instructions: json['strInstructions'],
    );
  }
}

class FoodInstructionPage extends StatefulWidget {
  final String mealId;
  FoodInstructionPage({required this.mealId});

  @override
  _FoodInstructionPage createState() => _FoodInstructionPage();
}

class _FoodInstructionPage extends State<FoodInstructionPage> {
  late Future<List<MealDetails>> _futureMeals;

  @override
  void initState() {
    super.initState();
    _futureMeals = fetchMeals(widget.mealId);
  }

  Future<List<MealDetails>> fetchMeals(String mealId) async {
    final response = await http.get(Uri.parse(
        'https://www.themealdb.com/api/json/v1/1/lookup.php?i=$mealId'));
    if (response.statusCode == 200) {
      final parsed =
          json.decode(response.body)['meals'].cast<Map<String, dynamic>>();
      return parsed
          .map<MealDetails>((json) => MealDetails.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load meals');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: null,
        leading: const CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 20,
          child: BackButton(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              print("add food");
            },
            icon: Icon(Icons.bookmark_border),
            color: Colors.white,
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/3.png"),
                colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.75),
                  BlendMode.modulate,
                ),
                fit: BoxFit.cover)),
        child: Center(
          child: FutureBuilder<List<MealDetails>>(
            future: _futureMeals,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final foods = snapshot.data![0];
                return ListView(
                  children: [
                    GestureDetector(
                        // onTap: () => _onMealTap(meal),
                        child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Container(
                          constraints: BoxConstraints(
                              maxHeight: double.infinity,
                              minHeight:
                                  MediaQuery.of(context).size.height * 0.4),
                          width: MediaQuery.of(context).size.width,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(top: 30),
                                    child: Text(
                                      "Instructions",
                                      // foodModel?.Instructions ?? "",
                                      style: TextStyle(
                                          fontSize: 19,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    )),
                                Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      foods.instructions,
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ])),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
