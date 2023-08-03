import 'package:baro/constants/colors.dart';
import 'package:baro/viewController/progress_page_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class ProgressDatePage extends StatelessWidget {
  const ProgressDatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _datePicker(),
    );
  }
}

_datePicker(){
  return SfDateRangePicker(
    showTodayButton: true,
    selectionMode: DateRangePickerSelectionMode.range,
    enableMultiView: true,
    navigationDirection: DateRangePickerNavigationDirection.vertical,
    viewSpacing: 0,
    showActionButtons: true,
    minDate: DateTime.now(),
    onSubmit: (Object? object) {
      if(object is PickerDateRange) {
        Get.find<ProgressPageViewController>().setSelectedDate(object.startDate!, object.endDate!);
        Get.find<ProgressPageViewController>().increaseProgressPageIndex();
      }
      else {
        Get.snackbar("Error", "Please select a date");
      }
    },
    onCancel: () {
      Get.find<ProgressPageViewController>().decreaseProgressPageIndex();
    },
    todayHighlightColor: colorPrimary,
  );
}

