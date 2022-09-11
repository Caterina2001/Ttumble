import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ttumble/views/widgets/tabbar_widget.dart';

import 'custom_picker_page.dart';
import 'date_picker_page.dart';
import 'datetime_picker_page.dart';
import 'time_picker_page.dart';
import 'timer_picker_page.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyDate());
}

class MyDate extends StatelessWidget {
  static final String title = 'Cupertino Date Picker';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.red),
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => TabBarWidget(
        title: 'Cupertino Picker',
        tabs: [
          Tab(icon: Icon(Icons.date_range), text: 'Date'),
          Tab(icon: Icon(Icons.access_time), text: 'Time'),
          Tab(icon: Icon(Icons.timer), text: 'Timer'),
          Tab(icon: Icon(Icons.update_outlined), text: 'DateTime'),
          Tab(icon: Icon(Icons.more_horiz_outlined), text: 'Custom'),
        ],
        children: [
          DatePickerPage(),
          TimePickerPage(),
          TimerPickerPage(),
          DatetimePickerPage(),
          CustomPickerPage(),
        ],
      );
}
