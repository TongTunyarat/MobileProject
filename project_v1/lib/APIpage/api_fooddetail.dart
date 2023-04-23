// ignore_for_file: non_constant_identifier_names
import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<FoodModel> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://www.themealdb.com/api/json/v1/1/search.php?s='));
  if (response.statusCode == 200) {
    print(response.body);
    return FoodModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }
}

class FoodModel {
  String? id;
  String? name;
  String? DrinkAlternate;
  String? Category;
  String? area;
  String? Instructions;
  String? Thumb;
  String? youtube;
  String? Ingredient;
  String? Measure;
  String? Source;
  String? ImageSource;
  String? CreativeCommonsConfirmed;
  String? dateModified;
  String? tags;

  FoodModel(
      {this.id,
      this.name,
      this.DrinkAlternate,
      this.Category,
      this.area,
      this.Instructions,
      this.Thumb,
      this.youtube,
      this.Ingredient,
      this.Measure,
      this.Source,
      this.ImageSource,
      this.CreativeCommonsConfirmed,
      this.dateModified,
      this.tags});

  FoodModel.fromJson(Map<String, dynamic> json) {
    id = json['meals'][0]['idMeal'];
    name = json['meals'][1]['strMeal'];
    DrinkAlternate = json['meals'][0]['strDrinkAlternate'];
    Category = json['meals'][0]['strCategory'];
    area = json['meals'][0]['strArea'];
    Instructions = json['meals'][0]['strInstructions'];
    Thumb = json['meals'][0]['strMealThumb'];
    tags = json['meals'][0]['strTags'];
    youtube = json['meals'][0]['strYoutube'];
    Ingredient = json['meals'][0]['strIngredient1'];
    Ingredient = json['meals'][0]['strIngredient2'];
    Ingredient = json['meals'][0]['strIngredient3'];
    Ingredient = json['meals'][0]['strIngredient4'];
    Ingredient = json['meals'][0]['strIngredient5'];
    Ingredient = json['meals'][0]['strIngredient6'];
    Ingredient = json['meals'][0]['strIngredient7'];
    Ingredient = json['meals'][0]['strIngredient8'];
    Ingredient = json['meals'][0]['strIngredient9'];
    Ingredient = json['meals'][0]['strIngredient10'];
    Ingredient = json['meals'][0]['strIngredient11'];
    Ingredient = json['meals'][0]['strIngredient12'];
    Ingredient = json['meals'][0]['strIngredient13'];
    Ingredient = json['meals'][0]['strIngredient14'];
    Ingredient = json['meals'][0]['strIngredient15'];
    Ingredient = json['meals'][0]['strIngredient16'];
    Ingredient = json['meals'][0]['strIngredient17'];
    Ingredient = json['meals'][0]['strIngredient18'];
    Ingredient = json['meals'][0]['strIngredient19'];
    Ingredient = json['meals'][0]['strIngredient20'];
    Measure = json['meals'][0]['strMeasure1'];
    Measure = json['meals'][0]['strMeasure2'];
    Measure = json['meals'][0]['strMeasure3'];
    Measure = json['meals'][0]['strMeasure4'];
    Measure = json['meals'][0]['strMeasure5'];
    Measure = json['meals'][0]['strMeasure6'];
    Measure = json['meals'][0]['strMeasure7'];
    Measure = json['meals'][0]['strMeasure8'];
    Measure = json['meals'][0]['strMeasure9'];
    Measure = json['meals'][0]['strMeasure10'];
    Measure = json['meals'][0]['strMeasure11'];
    Measure = json['meals'][0]['strMeasure12'];
    Measure = json['meals'][0]['strMeasure13'];
    Measure = json['meals'][0]['strMeasure14'];
    Measure = json['meals'][0]['strMeasure15'];
    Measure = json['meals'][0]['strMeasure16'];
    Measure = json['meals'][0]['strMeasure17'];
    Measure = json['meals'][0]['strMeasure18'];
    Measure = json['meals'][0]['strMeasure19'];
    Measure = json['meals'][0]['strMeasure20'];
    Source = json['meals'][0]['strSource'];
    ImageSource = json['meals'][0]['strImageSource'];
    CreativeCommonsConfirmed = json['meals'][0]['strCreativeCommonsConfirmed'];
    dateModified = json['meals'][0]['dateModified'];
  }
}

// class FoodDetailPage extends StatelessWidget {
//   final FoodModel? foodModel;

//   FoodDetailPage({Key? key, this.foodModel}) : super(key: key);
//   static const double cornerRedius = 20;
//   final FoodModel foodController = Get.put(FoodModel());

// ------/

class My_search extends StatefulWidget {
  // const My_search({Key? key}) : super(key: key);
  final FoodModel? meal;

  My_search({Key? key, this.meal}) : super(key: key);
  static const double cornerRedius = 20;
  final FoodModel foodController = Get.put(FoodModel());

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<My_search> {
  late Future<FoodModel> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: null,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, "/foodList");
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "/cart");
            },
            icon: Icon(Icons.shopping_cart),
            color: Colors.black,
          ),
          IconButton(
            onPressed: () {
              print("go search");
            },
            icon: Icon(Icons.search),
            color: Colors.black,
          )
        ],
      ),
      body: Center(
        child: FutureBuilder<FoodModel>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.name as String,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    height: 5,
                    fontSize: 20,
                    color: Color.fromARGB(255, 34, 31, 26),
                  ));
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
    // );
  }
}
