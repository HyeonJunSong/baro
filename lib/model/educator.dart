
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Educator{
  DateTime startDate;
  DateTime endDate;
  int price;
  String image;
  String name;
  int educatorCount;
  int careerYear;
  double rating;
  LatLng coor;
  String description;

  Educator({
    required this.startDate,
    required this.endDate,
    required this.price,
    required this.image,
    required this.name,
    required this.educatorCount,
    required this.careerYear,
    required this.rating,
    required this.coor,
    required this.description,
  });

}