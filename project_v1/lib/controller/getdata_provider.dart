import 'dart:developer';
import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_v1/controller/response_data.dart';
// import 'package:shimmer_example/response/response_data.dart';
import 'package:http/http.dart' as http;

class GetDataProvider with ChangeNotifier {
  ResponseData responseData = ResponseData();

  bool isLoading = false;

  getMyData() async {
    isLoading = true;
    responseData = await getAllData();
    isLoading = false;
    notifyListeners();
  }

  Future<ResponseData> getAllData() async {
    try {
      final response = await http.get(
        Uri.parse(
            'https://api.spoonacular.com/food/menuItems/search?query=burger'),
        headers: {
          'x-api-key': '19013de93689434d8f423327d5f6d934',
        },
      );
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        responseData = ResponseData.fromJson(item);
        notifyListeners();
      } else {
        print("else");
      }
    } catch (e) {
      log(e.toString());
    }

    return responseData;
  }
}
