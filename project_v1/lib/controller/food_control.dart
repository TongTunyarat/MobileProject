import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

//----------------Spongcular----------------------
Future<FoodModel> fetchFood() async {
  final response = await http.get(
    Uri.parse(
        'https://api.spoonacular.com/food/menuItems/search?query=burger&number=2'),
    headers: {
      'x-api-key': '19013de93689434d8f423327d5f6d934',
    },
  );
  if (response.statusCode == 200) {
    return FoodModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class FoodModel {
  final String type;
  final List menuItems;
  final int offset;
  final int number;
  final int totalMenuItems;
  final int processingTimeMs;
  final int expires;

  const FoodModel({
    required this.type,
    required this.menuItems,
    required this.offset,
    required this.number,
    required this.totalMenuItems,
    required this.processingTimeMs,
    required this.expires,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      type: json['type'],
      menuItems: json['menuItems'],
      offset: json['offset'],
      number: json['number'],
      totalMenuItems: json['totalMenuItems'],
      processingTimeMs: json['processingTimeMs'],
      expires: json['expires'],
    );
  }
}
