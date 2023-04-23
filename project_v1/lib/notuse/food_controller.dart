import 'dart:convert';

import 'package:project_v1/notuse/food_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FoodController extends GetxController {
  RxList<FoodModel> foodModels = <FoodModel>[].obs;
  RxInt amount = 1.obs;

  void addItem() {
    amount.value++;
  }

  void removeItem() {
    if (amount > 1) {
      amount.value--;
    }
  }

  void fetchFools() async {
    final response = await http.get(Uri.parse("https://www.themealdb.com/api/json/v1/1/search.php?s="));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body).cast<Map<String, dynamic>>();
      foodModels.value =
          data.map<FoodModel>((json) => FoodModel.fromJson(json)).toList();
    } else {
      throw Exception('failed');
    }
  }

  void addCart(FoodModel? foodModel, int piece) async {}

  void getCart() async {}
}
