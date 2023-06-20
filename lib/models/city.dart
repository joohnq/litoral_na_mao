class CitiesModel {
  List<City> cities;

  CitiesModel({
    required this.cities,
  });

  factory CitiesModel.fromJson(Map<String, dynamic> json) => CitiesModel(
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
  List<Event> events;

  City({
    required this.name,
    required this.images,
    required this.tourism,
    required this.commercialGuide,
    required this.events,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
        name: json["name"],
        images: List<String>.from(json["images"].map((x) => x)),
        tourism:
            List<Tourism>.from(json["tourism"].map((x) => Tourism.fromJson(x))),
        commercialGuide: List<CommercialGuide>.from(
            json["commercialGuide"].map((x) => CommercialGuide.fromJson(x))),
        events: List<Event>.from(json["events"].map((x) => Event.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "images": List<dynamic>.from(images.map((x) => x)),
        "tourism": List<dynamic>.from(tourism.map((x) => x.toJson())),
        "commercialGuide":
            List<dynamic>.from(commercialGuide.map((x) => x.toJson())),
        "events": List<dynamic>.from(events.map((x) => x.toJson())),
      };
}

class CommercialGuide {
  String name;
  String description;
  String adress;
  List<String> images;
  List<String> tel;
  List<SocialMedia> socialMedia;
  List<String> workHour;
  String about;
  String locationMap;

  CommercialGuide({
    required this.name,
    required this.description,
    required this.adress,
    required this.images,
    required this.tel,
    required this.socialMedia,
    required this.workHour,
    required this.about,
    required this.locationMap,
  });

  factory CommercialGuide.fromJson(Map<String, dynamic> json) =>
      CommercialGuide(
        name: json["name"],
        description: json["description"],
        adress: json["adress"],
        images: List<String>.from(json["images"].map((x) => x)),
        tel: List<String>.from(json["tel"].map((x) => x)),
        socialMedia: List<SocialMedia>.from(
            json["socialMedia"].map((x) => SocialMedia.fromJson(x))),
        workHour: List<String>.from(json["workHour"].map((x) => x)),
        about: json["about"],
        locationMap: json["locationMap"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "adress": adress,
        "images": List<String>.from(images.map((x) => x)),
        "tel": List<String>.from(tel.map((x) => x)),
        "socialMedia": List<dynamic>.from(socialMedia.map((x) => x.toJson())),
        "workHour": List<String>.from(workHour.map((x) => x)),
        "about": about,
        "locationMap": locationMap,
      };
}

class SocialMedia {
  String? facebook;
  String? twitter;
  String? youtube;
  String? pintrest;
  String? instagram;

  SocialMedia({
    required this.facebook,
    required this.twitter,
    required this.youtube,
    required this.pintrest,
    required this.instagram,
  });

  factory SocialMedia.fromJson(Map<String, dynamic> json) => SocialMedia(
        facebook: json["facebook"],
        twitter: json["twitter"],
        youtube: json["youtube"],
        pintrest: json["pintrest"],
        instagram: json["instagram"],
      );

  Map<String, dynamic> toJson() => {
        "facebook": facebook,
        "twitter": twitter,
        "youtube": youtube,
        "pintrest": pintrest,
        "instagram": instagram,
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

class Event {
  String name;
  String description;

  Event({
    required this.name,
    required this.description,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
      };
}
