import 'package:flutter/material.dart';
import 'package:baro/constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WidgetMenuButton extends StatelessWidget {
  const WidgetMenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 21.w,
      bottom: 21.w,
      child: ElevatedButton(
        onPressed: () {
          // Scaffold.of(context).openDrawer();
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: colorPrimary,
          fixedSize: Size(50.w, 50.w),
          elevation: 10,
        ),
        child: Icon(
          Icons.menu,
          color: Colors.white,
          size: 26.w,
        ),
      ),
    );
  }
}
