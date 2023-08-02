import 'package:flutter/material.dart';
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
    maxDate: DateTime.now(),
    onSubmit: (Object? value) {
      //null if not selected
      print(value);
    },
    onCancel: () {
      print('cancel');
    },
  );
}

