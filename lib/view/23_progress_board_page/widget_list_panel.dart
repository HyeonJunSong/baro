import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'component_board_list.dart';

class WidgetListPanel extends StatelessWidget {
  ScrollController scrollController;
  WidgetListPanel ({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _knob(),
          _list(scrollController),
        ],
      ),
    );
  }

  Container _knob() => Container(
    margin: EdgeInsets.only(top: 7.h),
    width: 36.w,
    height: 5.h,
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.circular(4.r),
    ),
  );

  _list(ScrollController scrollController) => Container(
    height: 588.h,
    child: GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 146.w / 260.h,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
      ),
      controller: scrollController,
      children: [
        componentBoardList(),
        componentBoardList(),
        componentBoardList(),
        componentBoardList(),
        componentBoardList(),
        componentBoardList(),
        componentBoardList(),
        componentBoardList(),
      ],
    ),
  );
}
