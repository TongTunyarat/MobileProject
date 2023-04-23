import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ResponseData {
  String? type;
  List<MenuItems>? menuItems;
  int? offset;
  int? number;
  int? totalMenuItems;
  int? processingTimeMs;
  int? expires;

  ResponseData({
    this.type,
    this.menuItems,
    this.offset,
    this.number,
    this.totalMenuItems,
    this.processingTimeMs,
    this.expires,
  });

  ResponseData.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    if (json['menuItems'] != null) {
      menuItems = <MenuItems>[];
      json['menuItems'].forEach((v) {
        menuItems!.add(new MenuItems.fromJson(v));
      });
    }
    offset = json['offset'];
    number = json['number'];
    totalMenuItems = json['totalMenuItems'];
    processingTimeMs = json['processingTimeMs'];
    expires = json['expires'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['offset'] = this.offset;
    data['number'] = this.number;
    if (this.menuItems != null) {
      data['menuItems'] = this.menuItems!.map((v) => v.toJson()).toList();
    }
    data['totalMenuItems'] = this.totalMenuItems;
    data['processingTimeMs'] = this.processingTimeMs;
    data['expires'] = this.expires;
    return data;
  }
}

// "id": 419357,
//             "title": "Burger Sliders",
//             "image": "https://images.spoonacular.com/file/wximages/419357-312x231.png",
//             "imageType": "png",
//             "restaurantChain":

class MenuItems {
  int? id;
  String? title;
  String? image;
  String? imageType;
  String? restaurantChain;
  String? servings;

  MenuItems(
      {this.id,
      this.title,
      this.image,
      this.imageType,
      this.restaurantChain,
      this.servings});

  MenuItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    imageType = json['imageType'];
    restaurantChain = json['restaurantChain'];
    servings = json['servings'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['images'] = this.imageType;
    data['restaurantChain'] = this.restaurantChain;
    data['servings'] = this.servings;
    return data;
  }
}
