
import 'package:baro/viewController/progress_page_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressStepper extends StatelessWidget {
  const ProgressStepper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Stepper(
      type: StepperType.horizontal,
      currentStep: Get.find<ProgressPageViewController>().progressPageIndex.value,
      // onStepTapped: (int index) {
      //   setState(() {
      //     _index = index;
      //   });
      // },
      controlsBuilder: (BuildContext context, ControlsDetails details) {
        return Container();
      },

      steps: [
        Step(
          title: Get.find<ProgressPageViewController>().progressPageIndex.value == 0 ? Text("surf spots") : Text(""),
          content: Container(),
          isActive: Get.find<ProgressPageViewController>().progressPageIndex.value > 0 ? true : false,
        ),
        Step(
          title: Get.find<ProgressPageViewController>().progressPageIndex.value == 1 ? Text("select date") : Text(""),
          content: Container(),
          isActive: Get.find<ProgressPageViewController>().progressPageIndex.value > 1 ? true : false,
        ),
        Step(
          title: Get.find<ProgressPageViewController>().progressPageIndex.value == 2 ? Text("surf board") : Text(""),
          content: Container(),
          isActive: Get.find<ProgressPageViewController>().progressPageIndex.value > 2 ? true : false,
        ),
        Step(
          title: Get.find<ProgressPageViewController>().progressPageIndex.value == 3 ? Text("educator") : Text(""),
          content: Container(),
          isActive: Get.find<ProgressPageViewController>().progressPageIndex.value > 3 ? true : false,
        ),
        Step(
          title: Get.find<ProgressPageViewController>().progressPageIndex.value == 4 ? Text("payments") : Text(""),
          content: Container(),
          isActive: Get.find<ProgressPageViewController>().progressPageIndex.value > 4 ? true : false,
        ),
      ],
    ));
  }
}
