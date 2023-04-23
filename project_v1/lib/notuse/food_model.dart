class FoodModel {
  int? id;
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
    id = json['idMeal'];
    name = json['strMeal'];
    DrinkAlternate = json['strDrinkAlternate'];
    Category = json['strCategory'];
    area = json['strArea'];
    Instructions = json['strInstructions'];
    Thumb = json['strMealThumb'];
    name = json['strTags'];
    youtube = json['strYoutube'];
    Ingredient = json['strIngredient1'];
    Ingredient = json['strIngredient2'];
    Ingredient = json['strIngredient3'];
    Ingredient = json['strIngredient4'];
    Ingredient = json['strIngredient5'];
    Ingredient = json['strIngredient6'];
    Ingredient = json['strIngredient7'];
    Ingredient = json['strIngredient8'];
    Ingredient = json['strIngredient9'];
    Ingredient = json['strIngredient10'];
    Ingredient = json['strIngredient11'];
    Ingredient = json['strIngredient12'];
    Ingredient = json['strIngredient13'];
    Ingredient = json['strIngredient14'];
    Ingredient = json['strIngredient15'];
    Ingredient = json['strIngredient16'];
    Ingredient = json['strIngredient17'];
    Ingredient = json['strIngredient18'];
    Ingredient = json['strIngredient19'];
    Ingredient = json['strIngredient20'];
    Measure = json['strMeasure1'];
    Measure = json['strMeasure2'];
    Measure = json['strMeasure3'];
    Measure = json['strMeasure4'];
    Measure = json['strMeasure5'];
    Measure = json['strMeasure6'];
    Measure = json['strMeasure7'];
    Measure = json['strMeasure8'];
    Measure = json['strMeasure9'];
    Measure = json['strMeasure10'];
    Measure = json['strMeasure11'];
    Measure = json['strMeasure12'];
    Measure = json['strMeasure13'];
    Measure = json['strMeasure14'];
    Measure = json['strMeasure15'];
    Measure = json['strMeasure16'];
    Measure = json['strMeasure17'];
    Measure = json['strMeasure18'];
    Measure = json['strMeasure19'];
    Measure = json['strMeasure20'];
    Source = json['strSource'];
    ImageSource = json['strImageSource'];
    CreativeCommonsConfirmed = json['strCreativeCommonsConfirmed'];
    dateModified = json['dateModified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idMeal'] = id;
    data['strMeal'] = name;
    data['strDrinkAlternate'] = DrinkAlternate;
    data['strCategory'] = Category;
    data['strArea'] = area;
    data['strInstructions'] = Instructions;
    data['strMealThumb'] = Thumb;
    data['strTags'] = tags;
    data['strYoutube'] = youtube;
    data['strIngredient1'] = Ingredient;
    data['strIngredient2'] = Ingredient;
    data['strIngredient3'] = Ingredient;
    data['strIngredient4'] = Ingredient;
    data['strIngredient5'] = Ingredient;
    data['strIngredient6'] = Ingredient;
    data['strIngredient7'] = Ingredient;
    data['strIngredient8'] = Ingredient;
    data['strIngredient9'] = Ingredient;
    data['strIngredient10'] = Ingredient;
    data['strIngredient11'] = Ingredient;
    data['strIngredient12'] = Ingredient;
    data['strIngredient13'] = Ingredient;
    data['strIngredient14'] = Ingredient;
    data['strIngredient15'] = Ingredient;
    data['strIngredient16'] = Ingredient;
    data['strIngredient17'] = Ingredient;
    data['strIngredient18'] = Ingredient;
    data['strIngredient19'] = Ingredient;
    data['strIngredient20'] = Ingredient;
    data['strMeasure1'] = Measure;
    data['strMeasure2'] = Measure;
    data['strMeasure3'] = Measure;
    data['strMeasure4'] = Measure;
    data['strMeasure5'] = Measure;
    data['strMeasure6'] = Measure;
    data['strMeasure7'] = Measure;
    data['strMeasure8'] = Measure;
    data['strMeasure9'] = Measure;
    data['strMeasure10'] = Measure;
    data['strMeasure11'] = Measure;
    data['strMeasure12'] = Measure;
    data['strMeasure13'] = Measure;
    data['strMeasure14'] = Measure;
    data['strMeasure15'] = Measure;
    data['strMeasure16'] = Measure;
    data['strMeasure17'] = Measure;
    data['strMeasure18'] = Measure;
    data['strMeasure19'] = Measure;
    data['strMeasure20'] = Measure;
    data['strSource'] = Source;
    data['strImageSource'] = ImageSource;
    data['strCreativeCommonsConfirmed'] = CreativeCommonsConfirmed;
    data['dateModified'] = dateModified;
    return data;
  }

  String foodTable = """CREATE TABLE foodCart(
        id INTEGER PRIMARY KEY NOT NULL,
        name TEXT,
        DrinkAlternate TEXT,
        Category TEXT,
        Instructions TEXT,
        Thumb TEXT,
        youtube TEXT,
        Ingredient TEXT,
        Measure TEXT,
        Source TEXT,
        ImageSource TEXT,
        CreativeCommonsConfirmed TEXT,
        dateModified TEXT,
        tags TEXT,
        createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
      )""";
}
