import 'package:baro/constants/colors.dart';
import 'package:baro/viewController/progress_page_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'widget_box.dart';

class BoxPaymentMethod extends StatelessWidget {
  const BoxPaymentMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => WidgetBox(
      title: "Payment Method",
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color(0x99979797),
            width: 1.h,
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          children: [
            _radioListTile(1, Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Credit Card", style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.black,
                ),),
                SizedBox(height: 10.h,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5.r),
                      child: Image.asset("assets/images/visa.png", width: 40.w,)
                    ),
                    SizedBox(width: 10.w,),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(5.r),
                        child: Image.asset("assets/images/mastercard.png", width: 40.w,)
                    ),
                    SizedBox(width: 10.w,),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(5.r),
                        child: Image.asset("assets/images/american-express.png", width: 40.w,)
                    ),
                    SizedBox(width: 10.w,),
                    Text("and more...", style: TextStyle(
                      fontSize: 16.sp,
                      height: 1.0,
                      color: Color(0xFF979797),
                    ),),
                  ],
                )
              ],
            )),
            Divider(height: 1.h, color: Color(0x99979797),),
            _radioListTile(2,
              Container(
                alignment: Alignment.centerLeft,
                child: Image.asset("assets/images/paypal.png", height: 40.h,)
              ),
            )
          ],
        ),
      ),
    ));
  }

  _radioListTile(int index, Widget child) => GestureDetector(
    onTap: () {
      Get.find<ProgressPageViewController>().setRadioPaymentMethod(index);
    },
    child: ListTile(
      title: child,
      leading: Radio(
        value: index,
        groupValue: Get.find<ProgressPageViewController>().radioPaymentMethod.value,
        activeColor: colorPrimary,
        onChanged: (value){},
      ),
    ),
  );
}