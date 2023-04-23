import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:project_v1/FoodDetail/food_Instructions.dart';
import 'package:http/http.dart' as http;
import 'dart:async';


class FoodModels {
  final String id;
  final String name;
  final String? drinkAlternate;
  final String? category;
  final String? area;
  final String instructions;
  final String thumb;
  final String? youtube;
  final List<String> ingredients;
  final List<String> measures;
  final String? source;
  final String? imageSource;
  final String? creativeCommonsConfirmed;
  final String? dateModified;
  final String? tags;

  FoodModels({
    required this.id,
    required this.name,
    this.drinkAlternate,
    this.category,
    this.area,
    required this.instructions,
    required this.thumb,
    this.youtube,
    required this.ingredients,
    required this.measures,
    this.source,
    required this.imageSource,
    this.creativeCommonsConfirmed,
    this.dateModified,
    this.tags,
  });

  factory FoodModels.fromJson(Map<String, dynamic> json) {
    final ingredients = <String>[];
    final measures = <String>[];
    for (int i = 1; i <= 20; i++) {
      final ingredient = json['strIngredient$i'];
      final measure = json['strMeasure$i'];
      if (ingredient != null && ingredient.isNotEmpty) {
        ingredients.add(ingredient);
        measures.add(measure ?? '');
      }
    }
    return FoodModels(
      id: json['idMeal'],
      name: json['strMeal'],
      drinkAlternate: json['strDrinkAlternate'],
      category: json['strCategory'],
      area: json['strArea'],
      instructions: json['strInstructions'],
      thumb: json['strMealThumb'],
      youtube: json['strYoutube'],
      ingredients: ingredients,
      measures: measures,
      source: json['strSource'],
      imageSource: json['strImageSource'],
      creativeCommonsConfirmed: json['strCreativeCommonsConfirmed'],
      dateModified: json['dateModified'],
      tags: json['strTags'],
    );
  }
}

class FoodIngredientnPage extends StatefulWidget {
  final String mealId;
  FoodIngredientnPage({required this.mealId});

  @override
  _FoodIngredientnPage createState() => _FoodIngredientnPage();
}

class _FoodIngredientnPage extends State<FoodIngredientnPage> {
  late Future<List<FoodModels>> _futureFoodModels;

  @override
  void initState() {
    super.initState();
    _futureFoodModels = fetchFoodModels(widget.mealId);
  }

  Future<List<FoodModels>> fetchFoodModels(String mealId) async {
    final response = await http.get(
        Uri.parse('https://www.themealdb.com/api/json/v1/1/lookup.php?i=$mealId'));
    if (response.statusCode == 200) {
      final parsed =
          json.decode(response.body)['meals'].cast<Map<String, dynamic>>();
      return parsed
          .map<FoodModels>((json) => FoodModels.fromJson(json))
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
        elevation: 0.0,
        title: null,
        leading: const CircleAvatar(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            radius: 20,
            child: BackButton(
              color: Colors.black,
            ),
          ),
        actions: [
          IconButton(
            onPressed: () {
              print("add food");
            },
            icon: Icon(Icons.bookmark_border),
            color: Colors.black,
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Center(
        child: FutureBuilder<List<FoodModels>>(
          future: _futureFoodModels,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final foodModel = snapshot.data![0]; // get the first item in the list
              final ingredientsList = foodModel.ingredients;
              final measuressList = foodModel.measures;
              final ingredientItems = <Widget>[];
              for (var i = 0; i < ingredientsList.length && i < measuressList.length; i++) {
                final ingredient = ingredientsList[i];
                final measures = measuressList[i];
                final ingredientWidget = ListTile(
                  title: Text('${ingredient}: ${measures}', style: TextStyle(fontSize: 15, height: 0.1, color: Colors.black87)),
                );
                ingredientItems.add(ingredientWidget);
              }
              return ListView(
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          Image.network(
                            foodModel.thumb,
                            fit: BoxFit.cover,
                            // height: MediaQuery.of(context).size.height * 0.5,
                          ),
                          Positioned(
                            top:
                                (MediaQuery.of(context).size.height * 0.5) - 20,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 20,
                              decoration: const BoxDecoration(
                                // color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        constraints: BoxConstraints(
                          maxHeight: double.infinity,
                          minHeight: MediaQuery.of(context).size.height * 0.4,
                        ),
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Text(
                                  foodModel.name,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                'Ingredients: ',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: ingredientItems,
                              ),
                              GestureDetector(
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => FoodInstructionPage(mealId: foodModel.id),
                                  ),
                                ),
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(top: 20, bottom: 10),
                                  height: 40,
                                  decoration: const BoxDecoration(
                                    color: Colors.deepOrange,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                  ),
                                  child: const Center(
                                      child: Text(
                                    "Instructions",
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white),
                                    textAlign: TextAlign.center,
                                  )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

