import 'package:baro/viewController/progress_page_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'widget_list_panel.dart';
import 'widget_map.dart';

class ProgressEducatorPage extends StatelessWidget {
  const ProgressEducatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => SlidingUpPanel(
      minHeight: 15.h,
      maxHeight: !Get.find<ProgressPageViewController>().ifEducatorSelected.value ? 600.h : 800.h,
      controller: Get.find<ProgressPageViewController>().panelController_educatorPage,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(18.0),
        topRight: Radius.circular(18.0)
      ),
      body: WidgetMap(),
      panelBuilder: (controller){
        return WidgetListPanel(scrollController: controller,);
      },
    ));
  }
}
