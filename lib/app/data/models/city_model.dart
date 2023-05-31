// ignore_for_file: avoid_print

import 'dart:convert';

class CityModel {
  String name;
  List<Tourism> tourism;
  List<CommercialGuide> commercialGuide;

  CityModel(
      {required this.name,
      required this.tourism,
      required this.commercialGuide});

  factory CityModel.fromMap(Map<String, dynamic> map) {
    var tourismList = map['turism'] as List;
    var commercialGuideList = map['guiaComercial'] as List;

    List<Tourism> tourism =
        tourismList.map((item) => Tourism.fromMap(item)).toList();
    List<CommercialGuide> commercialGuide = commercialGuideList
        .map((item) => CommercialGuide.fromMap(item))
        .toList();

    return CityModel(
      name: map['name'],
      tourism: tourism,
      commercialGuide: commercialGuide,
    );
  }
}

class Tourism {
  String category;
  List<Point> points;

  Tourism({required this.category, required this.points});

  factory Tourism.fromMap(Map<String, dynamic> map) {
    var pointsList = map['points'] as List;
    List<Point> points =
        pointsList.map((item) => Point.fromMap(item)).toList();

    return Tourism(
      category: map['category'],
      points: points,
    );
  }
}

class Point {
  String name;
  String image;
  String description;

  Point({required this.name, required this.image, required this.description});

  factory Point.fromMap(Map<String, dynamic> map) {
    return Point(
      name: map['name'],
      image: map['image'],
      description: map['description'],
    );
  }
}

class CommercialGuide {
  String category;
  List<Place> places;

  CommercialGuide({required this.category, required this.places});

  factory CommercialGuide.fromMap(Map<String, dynamic> map) {
    var placesList = map['places'] as List;
    List<Place> places =
        placesList.map((item) => Place.fromMap(item)).toList();

    return CommercialGuide(
      category: map['category'],
      places: places,
    );
  }
}

class Place {
  String name;
  String description;

  Place({required this.name, required this.description});

  factory Place.fromMap(Map<String, dynamic> map) {
    return Place(
      name: map['name'],
      description: map['description'],
    );
  }
}

// Parsing the JSON
var json = '''
  {
  "cities": [
    {
      "name": "Rio de Janeiro",
      "turism": [
        {
          "category": "Monumentos",
          "points": [
            {
              "name": "Cristo Redentor",
              "image": "https://example.com/cristo_redentor.jpg",
              "description": "Uma das Sete Maravilhas do Mundo Moderno, o Cristo Redentor é um famoso monumento no topo do morro do Corcovado, no Rio de Janeiro."
            }
          ]
        }
      ],
      "guiaComercial": [
        {
          "category": "Restaurantes",
          "places": [
            {
              "name": "Churrascaria Carretão",
              "description": "Um restaurante especializado em churrascos, oferecendo uma grande variedade de carnes e acompanhamentos."
            },
            {
              "name": "Café Colombo",
              "description": "Um tradicional café com ambiente elegante, servindo deliciosos quitutes e bebidas quentes."
            }
          ]
        },
        {
          "category": "Lojas",
          "places": [
            {
              "name": "Shopping Rio Sul",
              "description": "Um shopping center moderno, com uma ampla seleção de lojas de marcas nacionais e internacionais."
            },
            {
              "name": "Feira de Artesanato de Copacabana",
              "description": "Uma feira popular de artesanato, onde é possível encontrar uma variedade de produtos locais e souvenirs."
            }
          ]
        }
      ]
    },
    {
      "name": "São Paulo",
      "turism": [
        {
          "category": "Monumentos",
          "points": [
            {
              "name": "Catedral da Sé",
              "image": "https://example.com/catedral_da_se.jpg",
              "description": "A Catedral Metropolitana de São Paulo é uma das maiores igrejas góticas do mundo, localizada no centro histórico da cidade."
            }
          ]
        }
      ],
      "guia_comercial_list": [
        {
          "category": "Restaurantes",
          "places": [
            {
              "name": "D.O.M.",
              "description": "Um premiado restaurante com estrelas Michelin, famoso por sua cozinha contemporânea e ingredientes brasileiros."
            },
            {
              "name": "Mercado Municipal de São Paulo",
              "description": "Um mercado tradicional com diversos restaurantes e barracas que oferecem comida brasileira, incluindo o famoso sanduíche de mortadela."
            }
          ]
        },
        {
          "category": "Compras",
          "places": [
            {
              "name": "Shopping Iguatemi São Paulo",
              "description": "Um dos shoppings mais luxuosos da cidade, com uma seleção exclusiva de lojas de marcas internacionais e nacionais."
            },
            {
              "name": "Rua 25 de Março",
              "description": "Uma movimentada rua de comércio popular, conhecida por suas diversas lojas de roupas, acessórios e itens variados a preços acessíveis."
            }
          ]
        }
      ]
    }
  ]
}
''';

var data = jsonDecode(json);

List<CityModel> cities =
    (data['cities'] as List).map((item) => CityModel.fromMap(item)).toList();
