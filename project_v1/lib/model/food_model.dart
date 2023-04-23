
// import 'dart:ffi';
// import ''

// class FoodModel {
//   String? name;
//   String? description;
//   String? images;
//   Array? ingredients;

//   FoodModel({this.name, this.description, this.images, this.ingredients});

//   FoodModel.fromJson(Map<String, dynamic> json) {
//     name = json["name"];
//     description = json["description"];
//     images = json["images"];
//     ingredients = json["ingredients"];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data["name"] = name ;
//     data["description"] = description;
//     data["images"] = images;
//     data["ingredients"] = ingredients;
//     return data;
//   }

//   // String foodTable = """CREATE TABLE foodCart(
//   //       id INTEGER PRIMARY KEY NOT NULL,
//   //       name TEXT,
//   //       description TEXT,
//   //       image TEXT,
//   //       price INTEGER,
//   //       piece INTEGER,
//   //       createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
//   //     )""";
// }