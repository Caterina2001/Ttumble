import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ttumble/views/screens/description_page.dart';
import 'package:intl/intl.dart';

import '../utils/AppColor.dart';
import '../utils/utilss.dart';
import '../widgets/button_widget.dart';
import 'time_picker_page.dart';

var flo = '';

class DatePickerPage extends StatefulWidget {
  @override
  _DatePickerPageState createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  DateTime dateTime = DateTime.now();

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
                builder: (context) => /* Chat */ Description(),
              ));
            },
            /* onPressed: () {
              Navigator.of(context).pop();
            }, */
          ),
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: Image.asset(
                  'assets/images/calendar.gif',
                  height: 90,
                ),
              ),
              Center(
                child: Text(
                  "Set the date of the service",
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

              /* buildDatePicker(), */
              const SizedBox(height: 24),
              Container(
                  child: ButtonWidget(
                onClicked: () => Utilss.showSheet(
                  context,
                  child: buildDatePicker(),
                  onClicked: () {
                    final value = DateFormat('yyyy/MM/dd').format(dateTime);
                    Utilss.showSnackBar(context, 'Date Selected $value');
                    flo = value;

                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => TimePickerPage(),
                    ));
                  },
                ),
              ))
            ],
          ),
        ),
      );

  Widget buildDatePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          minimumYear: 2022,
          maximumYear: 2022,
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );
}
