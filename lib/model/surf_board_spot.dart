import 'package:baro/model/surf_board.dart';
import 'package:baro/model/user.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SurfBoardSpot{
  SurfBoard surfBoard;
  User user;
  LatLng coor;

  SurfBoardSpot({
    required this.surfBoard,
    required this.user,
    required this.coor,
  });
}