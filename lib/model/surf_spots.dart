import 'package:google_maps_flutter/google_maps_flutter.dart';

class SurfSpot {
  String name;
  String surf;
  String tide;
  String wind;
  LatLng coor;

  SurfSpot({
    required this.name,
    required this.surf,
    required this.tide,
    required this.wind,
    required this.coor,
  });

  SurfSpot.nullInit() :
    name = '',
    surf = '',
    tide = '',
    wind = '',
    coor = LatLng(0, 0);
}