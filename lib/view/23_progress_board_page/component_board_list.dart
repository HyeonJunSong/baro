import 'package:baro/model/surf_board_spot.dart';
import 'package:baro/viewController/progress_page_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

GestureDetector componentBoardList({required SurfBoardSpot surfBoardSpot}){
  return GestureDetector(
    onTap: (){
      Get.find<ProgressPageViewController>().setSelectedSurfBoardSpot(surfBoardSpot);
      Get.find<ProgressPageViewController>().toggleIfBoardSelected();
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
          _image(surfBoardSpot.surfBoard.image),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _title(surfBoardSpot.surfBoard.model),
              _educatorBadge(surfBoardSpot.user.educator != null),
            ],
          ),
          _description(surfBoardSpot.surfBoard.description),
          _price(surfBoardSpot.surfBoard.price),
        ]
      ),
    ),
  );
}

_image(String image){
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.r),
        child: Image.network(image, fit: BoxFit.cover,),
      ),
    ),
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