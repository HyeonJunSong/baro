import 'package:baro/model/educator.dart';
import 'package:baro/model/surf_board_spot.dart';
import 'package:baro/viewController/progress_page_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

GestureDetector componentEducatorList({required Educator educator}){
  return GestureDetector(
    onTap: (){
      Get.find<ProgressPageViewController>().setSelectedEducator(educator);
      Get.find<ProgressPageViewController>().toggleIfEducatorSelected();
    },
    child: Container(
      height: 260.h,
      margin: EdgeInsets.all(10.w),
      padding: EdgeInsets.all(5.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[
          _image(educator.image),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _title(educator.name),
              // _educatorBadge(surfBoardSpot.user.educator != null),
            ],
          ),
          _description(educator.description),
          _price(educator.price),
        ]
      ),
    ),
  );
}

_image(String image){
  return Container(
    width: 146.w,
    height: 146.w,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20.r),
      image: DecorationImage(
        image: NetworkImage(image),
        fit: BoxFit.cover,
      ),
    ),
    // child: ClipRRect(
    //   borderRadius: BorderRadius.circular(20.r),
    //   child: Image.network(image, fit: BoxFit.cover,),
    // ),
  );
}

Text _title(String model){
  return Text(
    model,
    style: TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.bold,
    ),
  );
}

Container _educatorBadge(bool ifEducator){
  return ifEducator ? Container(
    width: 58.w,
    height: 21.h,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      border: Border.all(
        color: Color(0xffF4E029),
        width: 1.w,
      ),
      borderRadius: BorderRadius.circular(15.r),
    ),
    child: Text(
      "educator",
      style: TextStyle(
        fontSize: 10.sp,
        fontWeight: FontWeight.bold,
        color: Color(0xffF4E029),
      ),
    ),
  ) : Container(
    width: 58.w,
    height: 21.h,
  );
}

Text _description(String description){
  return Text(
    description,
    style: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.bold,
    ),
  );
}

Text _price(int price){
  return Text(
    "\$${price} / day",
    style: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
    ),
  );
}