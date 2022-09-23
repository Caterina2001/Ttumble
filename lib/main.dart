// @dart=2.9
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:ttumble/models/core/ttumble.dart';
import 'package:ttumble/models/core/ttumble2.dart';
import 'package:ttumble/views/screens/auth/login_page.dart';
import 'package:ttumble/views/widgets/modals/register_modal.dart';

import 'views/chat_page.dart';
import 'views/screens/cards_page.dart';
import 'views/screens/home_page.dart';
import 'views/screens/profile_page.dart';
import 'views/utils/AppColor.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'inter',
        scaffoldBackgroundColor: Colors.white,
      ),
      home: /* LoginPage */ /* MyPruebaa */ MainPage /* MyAppp */ /* LoginPage */ (),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  int index = 0;

  final screens = [
    HomePage(),
    Chat(),
    CardsPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      /* Icon(
        DBIcons.ttumblelogo,
        size: 30,
      ), */
      /* Icon(
        DBIconss.logoisotipo3,
        size: 30,
        color: Colors.white,
      ), */
/*       SvgPicture.asset('assets/icons/user.svg'),
 */
      Image.asset('assets/images/logogrande2.png'),
      Icon(Icons.chat, size: 30),
      Icon(Icons.calendar_month, size: 30),
      Icon(Icons.person, size: 30),
    ];

    /// For iOS platform: SafeArea and ClipRect needed
    return Container(
      color: Colors.red,
      child: SafeArea(
        top: false,
        child: ClipRect(
          child: Scaffold(
            extendBody: true,
            backgroundColor: Colors.white,
            body: screens[index],
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                iconTheme: IconThemeData(color: Colors.white),
              ),
              child: CurvedNavigationBar(
                key: navigationKey,
                color: AppColor.primary,
                buttonBackgroundColor: AppColor.primary,
                backgroundColor: Colors.transparent,
                height: 60,
                animationCurve: Curves.easeInOut,
                animationDuration: Duration(milliseconds: 1000),
                index: index,
                items: items,
                onTap: (index) => setState(() => this.index = index),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
