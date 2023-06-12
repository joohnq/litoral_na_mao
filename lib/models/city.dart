// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

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
  List<Turism> turism;
  List<GuiaComercial>? guiaComercial;
  List<GuiaComercial>? guiaComercialList;

  City({
    required this.name,
    required this.images,
    required this.turism,
    this.guiaComercial,
    this.guiaComercialList,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        name: json["name"],
        images: List<String>.from(json["images"].map((x) => x)),
        turism:
            List<Turism>.from(json["turism"].map((x) => Turism.fromJson(x))),
        guiaComercial: json["guiaComercial"] == null
            ? []
            : List<GuiaComercial>.from(
                json["guiaComercial"]!.map((x) => GuiaComercial.fromJson(x))),
        guiaComercialList: json["guia_comercial_list"] == null
            ? []
            : List<GuiaComercial>.from(json["guia_comercial_list"]!
                .map((x) => GuiaComercial.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "images": List<dynamic>.from(images.map((x) => x)),
        "turism": List<dynamic>.from(turism.map((x) => x.toJson())),
        "guiaComercial": guiaComercial == null
            ? []
            : List<dynamic>.from(guiaComercial!.map((x) => x.toJson())),
        "guia_comercial_list": guiaComercialList == null
            ? []
            : List<dynamic>.from(guiaComercialList!.map((x) => x.toJson())),
      };
}

class GuiaComercial {
  String category;
  List<Place> places;

  GuiaComercial({
    required this.category,
    required this.places,
  });

  factory GuiaComercial.fromJson(Map<String, dynamic> json) => GuiaComercial(
        category: json["category"],
        places: List<Place>.from(json["places"].map((x) => Place.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "places": List<dynamic>.from(places.map((x) => x.toJson())),
      };
}

class Place {
  String name;
  String description;

  Place({
    required this.name,
    required this.description,
  });

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
      };
}

class Turism {
  String category;
  List<Point> points;

  Turism({
    required this.category,
    required this.points,
  });

  factory Turism.fromJson(Map<String, dynamic> json) => Turism(
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
