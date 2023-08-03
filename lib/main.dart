import 'package:baro/constants/colors.dart';
import 'package:baro/view/20_progress_body/progress_page.dart';
import 'package:baro/view/26_progress_result_page/progress_result_page.dart';
import 'package:baro/viewController/progress_page_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'view/10_home_page/home_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        // SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
        return GetMaterialApp(
          title: "Baro",
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          initialBinding: BindingsBuilder(() {
            // Bindings
          }),
          getPages: [
            GetPage(
              name: '/',
              page: () => const HomePage(),
            ),

            GetPage(
              name: '/Progress',
              page: () => const ProgressPage(),
              binding: BindingsBuilder(() {
                Get.put(ProgressPageViewController());
              }),
            ),
            GetPage(
              name: "/Progress/Result",
              page: () => const ProgressResultPage()
            ),

          ],

          theme: ThemeData(
            colorScheme: baroColorScheme,
          ),
        );
      }
    );
  }
}