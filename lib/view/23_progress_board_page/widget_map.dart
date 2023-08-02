import 'package:baro/viewController/progress_page_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

class WidgetMap extends StatelessWidget {
  const WidgetMap({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: Get.find<ProgressPageViewController>().onMapCreated_placePage,
      initialCameraPosition: CameraPosition(
        target: Get.find<ProgressPageViewController>().selectedSurfSpot.coor,
        zoom: 16,
      ),
      zoomControlsEnabled: false,
      markers: Set<Marker>.of(Get.find<ProgressPageViewController>().markers_placePage),
    );
  }
}
