import 'package:baro/constants/colors.dart';
import 'package:baro/model/surf_board_spot.dart';
import 'package:baro/viewController/progress_page_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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

          Get.find<ProgressPageViewController>().ifBoardSelected.value
            ? _details(scrollController, Get.find<ProgressPageViewController>().selectedSurfBoardSpot)
            : _list(scrollController),
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
      children: Get.find<ProgressPageViewController>().surfBoardSpots.map((surfBoardSpot) => componentBoardList(surfBoardSpot: surfBoardSpot,)).toList(),
    ),
  );

  _details(ScrollController controller, SurfBoardSpot surfBoardSpot) => Container(
    padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
    height: 746.h,
    child: SingleChildScrollView(
      controller: controller,
      child: Column(
        children: [
          Row(
            children: [
              Image.network(surfBoardSpot.user.thumbnail, width: 30.w),
              SizedBox(width: 11.w,),
              Text(surfBoardSpot.user.name, style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              )),
            ],
          ),

          SizedBox(height: 20.h,),

          Image.network(surfBoardSpot.surfBoard.image, width: 345.w),

          SizedBox(height: 20.h,),

          Text(surfBoardSpot.surfBoard.description, style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),),

          SizedBox(height: 20.h,),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${surfBoardSpot.surfBoard.price}\$/per day", style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),),
                    Text("${surfBoardSpot.surfBoard.deposit}\$/deposit", style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
                Container(
                  width: 77.w,
                  height: 31.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xFFF4E029),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  child: Text("educator", style: TextStyle(
                    color: Colors.white),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 20.h,),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 50.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("brand", style: _indexTextStyle()),
                    Text("model", style: _indexTextStyle()),
                    Text("length", style: _indexTextStyle()),
                    Text("boardWidth", style: _indexTextStyle()),
                    Text("thickness", style: _indexTextStyle()),
                    Text("finSetup", style: _indexTextStyle()),
                    Text("tailShape", style: _indexTextStyle()),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${surfBoardSpot.surfBoard.brand}", style: _contentTextStyle()),
                    Text("${surfBoardSpot.surfBoard.model}", style: _contentTextStyle()),
                    Text("${surfBoardSpot.surfBoard.length}", style: _contentTextStyle()),
                    Text("${surfBoardSpot.surfBoard.boardWidth}", style: _contentTextStyle()),
                    Text("${surfBoardSpot.surfBoard.thickness}", style: _contentTextStyle()),
                    Text("${surfBoardSpot.surfBoard.finSetup}", style: _contentTextStyle()),
                    Text("${surfBoardSpot.surfBoard.tailShape}", style: _contentTextStyle()),
                  ],
                )
              ],
            ),
          ),

          SizedBox(height: 20.h,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: (){
                  Get.find<ProgressPageViewController>().toggleIfBoardSelected();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: colorPrimary),
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  elevation: 3,
                  minimumSize: Size(160.w, 48.h),
                  maximumSize: Size(160.w, 48.h),
                ),
                child: Text("Back To List", style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: colorPrimary,
                ),),
              ),
              ElevatedButton(
                onPressed: (){
                  Get.find<ProgressPageViewController>().increaseProgressPageIndex();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  elevation: 3,
                  minimumSize: Size(160.w, 48.h),
                  maximumSize: Size(160.w, 48.h),
                ),
                child: Text("Confirm", style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
              ),
            ],
          ),

          SizedBox(height: 40.h,),
        ],
      ),
    ),
  );
}

_indexTextStyle() => TextStyle(
  fontSize: 15.sp,
  fontWeight: FontWeight.bold,
  color: Color(0xFFA0A0A0),
);
_contentTextStyle() => TextStyle(
  fontSize: 15.sp,
  fontWeight: FontWeight.bold,
  color: Color(0xFF000000),
);