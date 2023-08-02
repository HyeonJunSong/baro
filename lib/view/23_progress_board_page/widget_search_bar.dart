import 'package:baro/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidgetSearchBar extends StatelessWidget {
  const WidgetSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 53.w,
      child: Container(
        width: 338.w,
        height: 38.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),

        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            hintText: "search",
            contentPadding: EdgeInsets.symmetric(horizontal: 15.w),
            suffixIcon: IconButton(
              style: ButtonStyle(
                alignment: Alignment.center,
              ),
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.black,
                size: 15.w,
              ),
            ),
          ),
          cursorColor: colorPrimary,
        ),
      ),
    );
  }
}
