class CityModel {
  String name;
  // List<Tourism> tourism;
  // List<CommercialGuide> commercialGuide;

  CityModel({
    required this.name,
    // required this.tourism,
    // required this.commercialGuide
  });

  factory CityModel.fromMap(Map<String, dynamic> map) {
    // var tourismList = map['turism'] as List;
    // var commercialGuideList = map['guiaComercial'] as List;

    // List<Tourism> tourism =
    //     tourismList.map((item) => Tourism.fromMap(item)).toList();
    // List<CommercialGuide> commercialGuide = commercialGuideList
    //     .map((item) => CommercialGuide.fromMap(item))
    //     .toList();

    return CityModel(
      name: map['name'],
      // tourism: tourism,
      // commercialGuide: commercialGuide,
    );
  }
}

// class Tourism {
//   String category;
//   List<Point> points;

//   Tourism({required this.category, required this.points});

//   factory Tourism.fromMap(Map<String, dynamic> map) {
//     var pointsList = map['points'] as List;
//     List<Point> points =
//         pointsList.map((item) => Point.fromMap(item)).toList();

//     return Tourism(
//       category: map['category'],
//       points: points,
//     );
//   }
// }

// class Point {
//   String name;
//   String image;
//   String description;

//   Point({required this.name, required this.image, required this.description});

//   factory Point.fromMap(Map<String, dynamic> map) {
//     return Point(
//       name: map['name'],
//       image: map['image'],
//       description: map['description'],
//     );
//   }
// }

// class CommercialGuide {
//   String category;
//   List<Place> places;

//   CommercialGuide({required this.category, required this.places});

//   factory CommercialGuide.fromMap(Map<String, dynamic> map) {
//     var placesList = map['places'] as List;
//     List<Place> places =
//         placesList.map((item) => Place.fromMap(item)).toList();

//     return CommercialGuide(
//       category: map['category'],
//       places: places,
//     );
//   }
// }

// class Place {
//   String name;
//   String description;

//   Place({required this.name, required this.description});

//   factory Place.fromMap(Map<String, dynamic> map) {
//     return Place(
//       name: map['name'],
//       description: map['description'],
//     );
//   }
// }
