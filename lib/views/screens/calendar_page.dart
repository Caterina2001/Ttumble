/* import 'package:flutter/material.dart';

import '../utils/AppColor.dart';
import 'event_editing_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext contxt) => MaterialApp(
        debugShowCheckedModeBanner: false,
      );
}

class Calendar extends StatelessWidget {
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primary,
          title: Center(
            child: Text(
              'TTumble',
              style: TextStyle(
                  fontFamily: 'Ang', fontWeight: FontWeight.w700, fontSize: 30),
            ),
          ),
        ),
        //body: CalendarWidget(),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          backgroundColor: Colors.orange,
          onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => EventEditingPage())),
        ),
      );
}
 */