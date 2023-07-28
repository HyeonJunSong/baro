import 'package:baro/view/20_progress_body/widget_progress_stepper.dart';
import 'package:baro/view/21_progress_place_page/progress_place_page.dart';
import 'package:baro/viewController/progress_page_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProgressPage extends StatefulWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> with SingleTickerProviderStateMixin{
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    Get.find<ProgressPageViewController>().initTabController(tabController);
  }

  // void _onNavigationTap(){
  //   Get.find<ProgressPageViewController>().setProgressPageIndex(Get.find<ProgressPageViewController>().tabBarViewController.value!.index);
  // }

  @override
  Widget build(BuildContext context) {

    return Obx(() => Scaffold(
      appBar: AppBar(
        flexibleSpace: ProgressStepper(),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: TabBarView(
              controller: Get.find<ProgressPageViewController>().tabBarController.value ?? tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                ProgressPlacePage(),
                Container(
                  child: Center(
                    child: Text('2'),
                  ),
                ),
                Container(),
                Container(),
                Container(),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}