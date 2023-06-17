import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapCustom extends StatelessWidget {
  const MapCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 100),
      child: FlutterMap(
        options: MapOptions(
            center: const LatLng(-11.6546, -39.0089), zoom: 15, maxZoom: 18),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
        ],
      ),
    );
  }
}
