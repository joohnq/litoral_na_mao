import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  List<City> cities;

  Welcome({
    required this.cities,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        cities: List<City>.from(json["cities"].map((x) => City.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "cities": List<dynamic>.from(cities.map((x) => x.toJson())),
      };
}

class City {
  String name;
  List<String> images;
  List<Tourism> tourism;
  List<CommercialGuide> commercialGuide;

  City({
    required this.name,
    required this.images,
    required this.tourism,
    required this.commercialGuide,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        name: json["name"],
        images: List<String>.from(json["images"].map((x) => x)),
        tourism:
            List<Tourism>.from(json["tourism"].map((x) => Tourism.fromJson(x))),
        commercialGuide: List<CommercialGuide>.from(
            json["commercialGuide"].map((x) => CommercialGuide.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "images": List<dynamic>.from(images.map((x) => x)),
        "tourism": List<dynamic>.from(tourism.map((x) => x.toJson())),
        "commercialGuide":
            List<dynamic>.from(commercialGuide.map((x) => x.toJson())),
      };
}

class CommercialGuide {
  String name;
  String description;

  CommercialGuide({
    required this.name,
    required this.description,
  });

  factory CommercialGuide.fromJson(Map<String, dynamic> json) =>
      CommercialGuide(
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
      };
}

class Tourism {
  String category;
  List<Point> points;

  Tourism({
    required this.category,
    required this.points,
  });

  factory Tourism.fromJson(Map<String, dynamic> json) => Tourism(
        category: json["category"],
        points: List<Point>.from(json["points"].map((x) => Point.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "points": List<dynamic>.from(points.map((x) => x.toJson())),
      };
}

class Point {
  String name;
  String image;
  String description;

  Point({
    required this.name,
    required this.image,
    required this.description,
  });

  factory Point.fromJson(Map<String, dynamic> json) => Point(
        name: json["name"],
        image: json["image"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "description": description,
      };
}
