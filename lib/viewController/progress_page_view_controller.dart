import 'package:baro/model/surf_spot.dart';
import 'package:baro/services/get_BitmapDescriptor_from_asset.dart';
import 'package:baro/view/21_progress_place_page/dialog_surfSpot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ProgressPageViewController extends GetxController {

  //////////////////////////////////////////////////////////////////////////////Progress Page

  Rx<TabController?> tabBarController = Rx<TabController?>(null);
  void initTabController(TabController tabController) {
    tabBarController(tabController);
  }

  RxInt progressPageIndex = 0.obs;
  void increaseProgressPageIndex() {
    progressPageIndex.value++;
    tabBarController.value!.index = progressPageIndex.value;
  }
  void decreaseProgressPageIndex() {
    progressPageIndex.value--;
  }
  void setProgressPageIndex(int index) {
    progressPageIndex(index);
  }

  //////////////////////////////////////////////////////////////////////////////Place Select Page

  late GoogleMapController MapController_placePage;
  void onMapCreated_placePage(GoogleMapController controller) {
    MapController_placePage = controller;
    updateMarkers_placePage_BySurfSpots(surfSpots);
  }

  List<SurfSpot> surfSpots = [
    SurfSpot(
      name: 'The Hook',
      surf: '1-2 ft',
      tide: '3.5 ft',
      wind: '4 kts',
      coor: LatLng(36.959970, -121.964819),
    ),
    SurfSpot(
      name: 'Maverick’s',
      surf: '2-3 ft+',
      tide: '3.8 ft',
      wind: '6 kts',
      coor: LatLng(37.497060, -122.496688),
    ),
    SurfSpot(
      name: 'Capitola',
      surf: '1-2 ft',
      tide: '3.8 ft',
      wind: '4 kts',
      coor: LatLng(36.972782, -121.948922),
    ),
    SurfSpot(
      name: 'Steamer Lane',
      surf: '2-3 ft+',
      tide: '3.6 ft',
      wind: '4 kts',
      coor: LatLng(36.951885, -122.026127),
    )
  ];

  RxList<Marker> markers_placePage = <Marker>[].obs;
  void updateMarkersByMarker(List<Marker> newMarkers) {
    markers_placePage(newMarkers);
  }
  Future<void> updateMarkers_placePage_BySurfSpots(List<SurfSpot> surfSpots) async {

    List<Marker> newMarkers = [];
    surfSpots.forEach((surfSpot) async {
      newMarkers.add(
        Marker(
          markerId: MarkerId(surfSpot.name),
          position: surfSpot.coor,
          onTap: () {
            Get.dialog(
              DialogSurfSpot(surfSpot: surfSpot,),
            );
          },
          icon: await getBitmapDescriptorFromAsset(
            path: "assets/images/surf_spot_icon.png",
            width: 125
          ),
        ),
      );
    });
    updateMarkersByMarker(newMarkers);
  }

  //////////////////////////////////////////////////////////////////////////////Date Select Page

  //////////////////////////////////////////////////////////////////////////////Board Select Page
  late GoogleMapController MapController_boardPage;
  void onMapCreated_boardPage(GoogleMapController controller) {
    MapController_boardPage = controller;
  }

  //////////////////////////////////////////////////////////////////////////////Results
  late SurfSpot selectedSurfSpot;
  void setSelectedSurfSpot(SurfSpot surfSpot) {
    selectedSurfSpot = surfSpot;
  }




}