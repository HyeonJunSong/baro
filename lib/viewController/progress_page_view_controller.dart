import 'package:baro/model/educator.dart';
import 'package:baro/model/surf_board.dart';
import 'package:baro/model/surf_board_spot.dart';
import 'package:baro/model/surf_spot.dart';
import 'package:baro/model/user.dart';
import 'package:baro/services/get_BitmapDescriptor_from_asset.dart';
import 'package:baro/view/21_progress_place_page/dialog_surfSpot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

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
    tabBarController.value!.index = progressPageIndex.value;
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

  RxSet<Marker> markers_placePage = <Marker>{}.obs;
  void updateMarkersByMarker(Set<Marker> newMarkers) {
    markers_placePage(newMarkers);
    markers_placePage.refresh();
  }
  Future<void> updateMarkers_placePage_BySurfSpots(List<SurfSpot> surfSpots) async {

    Set<Marker> newMarkers = {};
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
    updateMarkers_boardPage_BySurfBoardSpots(surfBoardSpots);
  }

  PanelController panelController_boardPage = PanelController();

  RxBool ifBoardSelected = false.obs;
  void toggleIfBoardSelected() {
    panelController_boardPage.close();
    Future.delayed(Duration(milliseconds: 100), () {
      ifBoardSelected.value = !ifBoardSelected.value;
    });
    Future.delayed(Duration(milliseconds: 300), () {
      panelController_boardPage.open();
    });
  }

  List<SurfBoardSpot> surfBoardSpots = [
    SurfBoardSpot(
      surfBoard: SurfBoard(
        brand: "11th Street",
        model: "Puffin 5'4",
        length: "5'4\"",
        boardWidth: "19 1/3\"",
        thickness: "2 1/4\"",
        finSetup: "Tri-Fin FCS II",
        tailShape: "Swallow",
        description: "Used for 3 years",
        image: "https://www.surfstationstore.com/cdn/shop/files/Skylar_800x.jpg?v=1690923095",
        deposit: 100,
        price: 10,
      ),
      user: User(
          name: "John Doe",
          email: "doe@gmail.com",
          thumbnail: "https://www.surfstationstore.com/cdn/shop/files/Skylar_800x.jpg?v=1690923095"
      ),
      coor: LatLng(36.952895, -122.027137),
    ),
    SurfBoardSpot(
      surfBoard: SurfBoard(
        brand: "Aloha",
        model: "Aloha 6’8",
        length: "6’8\"",
        boardWidth: "19 3/4\"",
        thickness: "2 5/8\"",
        finSetup: "Tri-Fin FCS II",
        tailShape: "Squash",
        description: "Used for 5 years",
        image: "https://www.surfstationstore.com/cdn/shop/files/Aloha_e4ac06da-656d-45cd-80e1-37d5db67fa65_800x.jpg?v=1690835378",
        deposit: 150,
        price: 10,
      ),
      user: User(
          name: "Jay",
          email: "jay@gmail.com",
          thumbnail: "https://www.surfstationstore.com/cdn/shop/files/Aloha_e4ac06da-656d-45cd-80e1-37d5db67fa65_800x.jpg?v=1690835378"
      ),
      coor: LatLng(36.953875, -122.026137),
    )
  ];

  RxList<Marker> markers_boardPage = <Marker>[].obs;

  void updateMarkersByMarker_boardPage(List<Marker> newMarkers) {
    markers_boardPage(newMarkers);
  }

  Future<void> updateMarkers_boardPage_BySurfBoardSpots(List<SurfBoardSpot> surfBoardSpots) async {

    List<Marker> newMarkers = [];
    surfBoardSpots.forEach((surfBoardSpot) async {
      newMarkers.add(
        Marker(
          markerId: MarkerId(surfBoardSpot.surfBoard.brand),
          position: surfBoardSpot.coor,
          icon: await getBitmapDescriptorFromAsset(
              path: "assets/images/surf_spot_icon.png",
              width: 125
          ),
          onTap: () {
            MapController_boardPage.animateCamera(CameraUpdate.newLatLng(surfBoardSpot.coor));
            setSelectedSurfBoardSpot(surfBoardSpot);
            toggleIfBoardSelected();
          },
        ),
      );
    });
    updateMarkersByMarker_boardPage(newMarkers);
  }

  //////////////////////////////////////////////////////////////////////////////Educator Select Page
  late GoogleMapController MapController_educatorPage;
  void onMapCreated_educatorPage(GoogleMapController controller) {
    MapController_educatorPage = controller;
    updateMarkers_educatorPage_ByEducator(educatorList);
  }

  PanelController panelController_educatorPage = PanelController();

  RxBool ifEducatorSelected = false.obs;
  void toggleIfEducatorSelected() {
    panelController_educatorPage.close();
    Future.delayed(Duration(milliseconds: 100), () {
      ifEducatorSelected.value = !ifEducatorSelected.value;
    });
    Future.delayed(Duration(milliseconds: 300), () {
      panelController_educatorPage.open();
    });
  }

  List<Educator> educatorList = [
    Educator(
      startDate: DateTime(2023, 7, 20),
      endDate: DateTime(2023, 8, 3),
      price: 100,
      image: "https://cdn.topstarnews.net/news/photo/202104/869240_604006_560.jpg",
      name: "Jisoo",
      educatorCount: 132,
      careerYear: 3,
      rating: 4.8,
      coor: LatLng(36.951985, -122.026227),
      description: "I am Jisoo",
    ),

    Educator(
      startDate: DateTime(2023, 6, 10),
      endDate: DateTime(2023, 9, 3),
      price: 120,
      image: "https://wiki.d-addicts.com/images/4/4c/IU.jpg",
      name: "IU",
      educatorCount: 230,
      careerYear: 10,
      rating: 4.9,
      coor: LatLng(36.951885, -122.026127),
      description: "I like surfing!",
    ),

    Educator(
      startDate: DateTime(2023, 10, 11),
      endDate: DateTime(2023, 11, 5),
      price: 95,
      image: "https://i.namu.wiki/i/E5Vl9sxb-JEindvpzxHGMb8HyhEps6XtCrE1YN1s9YT-pPk1RdiqO3R_ZuDGG7lrg8i0UhQAiejs_gGaISRVeA.webp",
      name: "Kyusun Cho",
      educatorCount: 70,
      careerYear: 2,
      rating: 3.7,
      coor: LatLng(36.951285, -122.026527),
      description: "I like music and taco!",
    ),

    Educator(
      startDate: DateTime(2023, 11, 23),
      endDate: DateTime(2023, 11, 31),
      price: 150,
      image: "https://thinkyou.co.kr/upload/editordata/02%EB%82%B4%EC%A7%80%ED%91%9C%EC%A7%80.jpg",
      name: "Yechan Shin",
      educatorCount: 23,
      careerYear: 5,
      rating: 4.2,
      coor: LatLng(36.951185, -122.026027),
      description: "I'm like violin!",
    ),
  ];

  RxList<Marker> markers_educatorPage = <Marker>[].obs;

  void updateMarkersByMarker_educatorPage(List<Marker> newMarkers) {
    markers_educatorPage(newMarkers);
  }

Future<void> updateMarkers_educatorPage_ByEducator(List<Educator> educators) async {

    List<Marker> newMarkers = [];
    educators.forEach((educator) async {
      newMarkers.add(
        Marker(
          markerId: MarkerId(educator.name),
          position: educator.coor,
          icon: await getBitmapDescriptorFromAsset(
              path: "assets/images/surf_spot_icon.png",
              width: 125
          ),
          onTap: () {
            MapController_educatorPage.animateCamera(CameraUpdate.newLatLng(educator.coor));
            setSelectedEducator(educator);
            toggleIfEducatorSelected();
          }
        ),
      );
    });
    updateMarkersByMarker_educatorPage(newMarkers);
  }

  //////////////////////////////////////////////////////////////////////////////Payment Page
  RxInt radioPaymentMethod = 0.obs;
  void setRadioPaymentMethod(int value) {
    radioPaymentMethod.value = value;
  }

  //////////////////////////////////////////////////////////////////////////////Results
  late SurfSpot selectedSurfSpot;
  void setSelectedSurfSpot(SurfSpot surfSpot) {
    selectedSurfSpot = surfSpot;
  }
  late DateTime selectedStartDate;
  late DateTime selectedEndDate;

  void setSelectedDate(DateTime startDate, DateTime endDate) {
    selectedStartDate = startDate;
    selectedEndDate = endDate;
  }

  late SurfBoardSpot selectedSurfBoardSpot;
  void setSelectedSurfBoardSpot(SurfBoardSpot surfBoardSpot) {
    selectedSurfBoardSpot = surfBoardSpot;
  }

  late Educator selectedEducator;
  void setSelectedEducator(Educator educator) {
    selectedEducator = educator;
  }




}