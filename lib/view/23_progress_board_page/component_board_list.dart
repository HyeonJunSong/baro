import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Container componentBoardList(){
  return Container(
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
        _image(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _title(),
            _educatorBadge(),
          ],
        ),
        _description(),
        _price(),
      ]
    ),
  );
}

_image(){
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        image: const DecorationImage(
          image: AssetImage("assets/images/board_temporary_image.png"),
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

Text _title(){
  return Text(
    "MASHUP 6'4",
    style: TextStyle(
      fontSize: 10.sp,
      fontWeight: FontWeight.bold,
    ),
  );
}

Container _educatorBadge(){
  return Container(
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
  );
}

Text _description(){
  return Text(
    "bought it last year",
    style: TextStyle(
      fontSize: 12.sp,
      fontWeight: FontWeight.bold,
    ),
  );
}

Text _price(){
  return Text(
    "\$25 / day",
    style: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
    ),
  );
}