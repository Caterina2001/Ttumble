import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/utilss.dart';
import '../widgets/button_widget.dart';

class DatetimePickerPage extends StatefulWidget {
  @override
  _DatetimePickerPageState createState() => _DatetimePickerPageState();
}

class _DatetimePickerPageState extends State<DatetimePickerPage> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildDateTimePicker(),
              const SizedBox(height: 24),
              ButtonWidget(
                onClicked: () => Utilss.showSheet(
                  context,
                  child: buildDateTimePicker(),
                  onClicked: () {
                    final value =
                        DateFormat('MM/dd/yyyy HH:mm').format(dateTime);
                    Utilss.showSnackBar(context, 'Selected "$value"');

                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildDateTimePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          initialDateTime: dateTime,
          maximumYear: 2023,
          mode: CupertinoDatePickerMode.dateAndTime,
          minimumDate: DateTime(DateTime.now().year, 2, 1),
          maximumDate: DateTime(2023, 3, 25, 9, 0, 0),
          use24hFormat: true,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );
}
