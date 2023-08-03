import 'package:baro/constants/colors.dart';
import 'package:baro/model/educator.dart';
import 'package:baro/viewController/progress_page_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'component_educator_list.dart';

class WidgetListPanel extends StatelessWidget {
  final ScrollController scrollController;
  const WidgetListPanel ({
    Key? key,
    required this.scrollController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _knob(),

          Get.find<ProgressPageViewController>().ifEducatorSelected.value
            ? _details(scrollController, Get.find<ProgressPageViewController>().selectedEducator)
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
      children: Get.find<ProgressPageViewController>().educatorList.map((educator) => componentEducatorList(educator: educator,)).toList(),
    ),
  );

  _details(ScrollController controller, Educator educator) => Container(
    padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 10.h),
    height: 746.h,
    child: SingleChildScrollView(
      controller: controller,
      child: Column(
        children: [

          Container(
            width: 300.w,
            height: 300.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              image: DecorationImage(
                image: NetworkImage(educator.image),
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(height: 20.h,),

          Text(educator.name, style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),),

          Text(educator.description, style: TextStyle(
            fontSize: 15.sp,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),),

          SizedBox(height: 20.h,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 100.w,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  children : [
                    Text("edcated", style: _indexTextStyle()),
                    Text("${educator.educatorCount}", style: _contentTextStyle())
                  ],
                ),
              ),
              Container(
                width: 100.w,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  children : [
                    Text("career", style: _indexTextStyle()),
                    Text("${educator.careerYear} years", style: _contentTextStyle())
                  ],
                ),
              ),
              Container(
                width: 100.w,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  children : [
                    Text("rating", style: _indexTextStyle()),
                    Text("${educator.rating}", style: _contentTextStyle())
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 20.h,),

          Text("${educator.price}\$ / per day", style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),),

          SizedBox(height: 20.h,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: (){
                  Get.find<ProgressPageViewController>().toggleIfEducatorSelected();
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
  fontSize: 13.sp,
  fontWeight: FontWeight.bold,
  color: Color(0xFFA0A0A0),
);
_contentTextStyle() => TextStyle(
  fontSize: 15.sp,
  fontWeight: FontWeight.bold,
  color: Color(0xFF000000),
);