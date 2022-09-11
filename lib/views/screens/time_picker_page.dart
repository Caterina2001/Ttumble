import 'package:ttumble/main.dart';
import 'package:ttumble/views/chat_page.dart';
import 'package:ttumble/views/screens/home_page.dart';

import '../utils/AppColor.dart';
import '../utils/utilss.dart';
import '../widgets/button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'date_picker_page.dart';

var flo = '';

class TimePickerPage extends StatefulWidget {
  @override
  _TimePickerPageState createState() => _TimePickerPageState();
}

class _TimePickerPageState extends State<TimePickerPage> {
  DateTime dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();

    dateTime = getDateTime();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          brightness: Brightness.dark,
          backgroundColor: AppColor.primary,
          elevation: 0,
          centerTitle: true,
          title: Text('TTumble',
              style: TextStyle(
                  fontFamily: 'Ang',
                  fontWeight: FontWeight.w700,
                  fontSize: 30)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => /* Chat */ DatePickerPage(),
              ));
            },
            /*  onPressed: () {
              Navigator.of(context).pop();
            }, */
          ),
        ),
        body: Center(
          child: Column(
            /* mainAxisAlignment: MainAxisAlignment.center, */
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: Image.asset(
                  'assets/images/clock-.gif',
                  height: 100,
                ),
              ),
              Center(
                child: Text(
                  "Set the hour of the service",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColor.primary),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                //apply margin and padding using Container Widget.
                padding: EdgeInsets.only(
                    top: 30), //You can use EdgeInsets like above
                margin: EdgeInsets.all(5),
                child: Text('$flo',
                    style: TextStyle(
                        fontFamily: 'Ang',
                        fontWeight: FontWeight.w700,
                        fontSize: 30)), /* Text("$flo" ) */
              ),
              /* buildTimePicker(), */
              const SizedBox(height: 24),
              ButtonWidget(
                onClicked: () => Utilss.showSheet(
                  context,
                  child: buildTimePicker(),
                  onClicked: () {
                    final value = DateFormat('HH:mm').format(dateTime);
                    Utilss.showSnackBar(context, 'Hour Selected $value');
                    flo = value;

                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Chat(),
                    ));
                  },
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildTimePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.time,
          minuteInterval: 10,
          //use24hFormat: true,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );

  DateTime getDateTime() {
    final now = DateTime.now();

    return DateTime(now.year, now.month, now.day, now.hour, 0);
  }
}
