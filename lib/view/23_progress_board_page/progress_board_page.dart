import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'widget_list_panel.dart';
import 'widget_map.dart';

class ProgressBoardPage extends StatelessWidget {
  const ProgressBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      minHeight: 104.h,
      maxHeight: 600.h,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(18.0),
          topRight: Radius.circular(18.0)
      ),
      body: WidgetMap(),
      panelBuilder: (controller){
        return WidgetListPanel(scrollController: controller,);
      },
    );
  }
}
