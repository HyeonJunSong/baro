import 'package:baro/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProgressResultPage extends StatelessWidget {
  const ProgressResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80.w,
              height: 80.w,
              decoration: BoxDecoration(
                color: colorPrimary,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.check, color: Colors.white, size: 40.w,)
            ),

            SizedBox(height: 16.h,),

            Text("Payment successfully", style: TextStyle(
              fontSize: 24.sp,
            ),),
            Text("completed", style: TextStyle(
              fontSize: 24.sp,
            ),),

            SizedBox(height: 32.h,),

            TextButton(
              onPressed: (){
                Get.offAndToNamed("/");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back),
                  SizedBox(width: 8.w,),
                  Text("Go back to home", style: TextStyle(
                    fontSize: 15.sp,
                  ),),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}
