import 'package:baro/constants/colors.dart';
import 'package:baro/viewController/progress_page_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogSurfSpot extends StatelessWidget {
  final surfSpot;

  const DialogSurfSpot({
    Key? key,
    required this.surfSpot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: 308.w,
        height: 400.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _image(),
            _name(),
            _information(),
            _button(),
          ],
        ),
      ),
    );
  }

  Container _image() => Container(
    width: 308.w,
    height: 164.h,
    child: ClipRRect(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(30.r), topRight: Radius.circular(30.r)),
      child: Image.asset(
        "assets/images/surfSpot_temporary_image.png",
        fit: BoxFit.cover,
      ),
    ),
  );

  Container _name() => Container(
    padding: EdgeInsets.symmetric(horizontal: 23.w),
    alignment: Alignment.centerLeft,
    child: Text(
      "${surfSpot.name}",
      style: TextStyle(
        fontSize: 20.sp,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  Container _information() => Container(
    padding: EdgeInsets.symmetric(horizontal: 23.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "SURF (FT)",
              style: TextStyle(
                fontSize: 15.sp,
                color: Color(0xFFDFDFDF),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${surfSpot.surf}",
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "TIDE (FT)",
              style: TextStyle(
                fontSize: 15.sp,
                color: Color(0xFFDFDFDF),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${surfSpot.tide}",
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "WIND(KTS)",
              style: TextStyle(
                fontSize: 15.sp,
                color: Color(0xFFDFDFDF),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${surfSpot.wind}",
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    ),
  );

  Container _button() => Container(
    padding: EdgeInsets.only(right: 23.w),
    alignment: Alignment.centerRight,
    child: ElevatedButton(
      onPressed: () {
        Get.find<ProgressPageViewController>().setSelectedSurfSpot(surfSpot);
        Get.find<ProgressPageViewController>().increaseProgressPageIndex();
        Get.back();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: colorPrimary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        minimumSize: Size(55.w, 24.h),
      ),
      child: Text(
        "Select",
        style: TextStyle(
          fontSize: 15.sp,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
