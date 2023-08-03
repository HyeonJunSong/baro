import 'package:baro/constants/colors.dart';
import 'package:baro/view/25_progress_payment_page/box_payment_method.dart';
import 'package:baro/viewController/progress_page_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'widget_box.dart';

class ProgressPaymentPage extends StatelessWidget {
  const ProgressPaymentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: colorPrimary,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _info(),
            _payment(),
            BoxPaymentMethod(),
            _confirmButton(),
          ],
        ),
      ),
    );
  }

  _info() => WidgetBox(
    title: "User Information",
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Name", style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
              ),),
              Text("Jerry Kim", style: TextStyle(
                fontSize: 16.sp,
                color: Color(0xFF979797),
              ),),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Email", style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
              ),),
              Text("jjery@gmail.com", style: TextStyle(
                fontSize: 16.sp,
                color: Color(0xFF979797),
              ),),
            ],
          ),
        ),
      ]
    ),
  );
  _payment() => WidgetBox(
    title: "Total Payment",
    child: Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 10.w,
                    height: 10.w,
                    decoration: BoxDecoration(
                      color: colorPrimary,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  SizedBox(width: 10.w,),
                  Text(
                    "Surf Board",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Container(
                child: Text(
                  "\$${Get.find<ProgressPageViewController>().selectedSurfBoardSpot.surfBoard.price} * "
                  "${Get.find<ProgressPageViewController>().selectedEndDate.difference(Get.find<ProgressPageViewController>().selectedStartDate).inDays} days"
                  " = \$${Get.find<ProgressPageViewController>().selectedSurfBoardSpot.surfBoard.price * Get.find<ProgressPageViewController>().selectedEndDate.difference(Get.find<ProgressPageViewController>().selectedStartDate).inDays}",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 10.w,
                    height: 10.w,
                    decoration: BoxDecoration(
                      color: colorPrimary,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  SizedBox(width: 10.w,),
                  Text(
                    "Educator",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Container(
                child: Text(
                  "\$${Get.find<ProgressPageViewController>().selectedEducator.price} * "
                  "${Get.find<ProgressPageViewController>().selectedEndDate.difference(Get.find<ProgressPageViewController>().selectedStartDate).inDays} days"
                  " = \$${Get.find<ProgressPageViewController>().selectedEducator.price * Get.find<ProgressPageViewController>().selectedEndDate.difference(Get.find<ProgressPageViewController>().selectedStartDate).inDays}",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 10.w,
                    height: 10.w,
                    decoration: BoxDecoration(
                      color: colorPrimary,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  SizedBox(width: 10.w,),
                  Text(
                    "Total Amount",
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Container(
                child: Text(
                  "\$ ${Get.find<ProgressPageViewController>().selectedSurfBoardSpot.surfBoard.price * Get.find<ProgressPageViewController>().selectedEndDate.difference(Get.find<ProgressPageViewController>().selectedStartDate).inDays
                  + Get.find<ProgressPageViewController>().selectedEducator.price * Get.find<ProgressPageViewController>().selectedEndDate.difference(Get.find<ProgressPageViewController>().selectedStartDate).inDays}",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),

        ],
      ),
    ),
  );
  _confirmButton() => Container(
    margin: EdgeInsets.symmetric(vertical: 20.h),
    width: 335.w,
    height: 50.h,
    child: ElevatedButton(
      onPressed: () {
        Get.offAndToNamed("/Progress/Result");
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: Text(
        "Confirm",
        style: TextStyle(
          fontSize: 16.sp,
          color: colorPrimary,
        ),
      ),
    ),
  );

}