import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttumble/main.dart';
import 'package:ttumble/views/screens/auth/login_page.dart';
import 'package:ttumble/views/screens/home_page.dart';
import 'package:ttumble/views/screens/location_page.dart';
import 'package:ttumble/views/utils/AppColor.dart';
import 'package:ttumble/views/utils/variables.dart';

import '../screens/location.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

late String finalEmail;
late String finalName;
late var obtainedEmail;

class _SplashState extends State<Splash> {
  @override
  void initState() {
    getValidationData().whenComplete(() async {
      Timer(
          // ignore: unnecessary_null_comparison
          Duration(milliseconds: 2500),
          () => Get.to(obtainedEmail == null /* && finalName == null */
              ? LoginPage()
              : Location_Page()));
    });
    super.initState();
    //navigate();
    //getValidationData();
  }

  /* navigate() async {
    await Future.delayed(Duration(milliseconds: 1500), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Location()));
  } */

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    obtainedEmail = sharedPreferences.getString('usu_correo');
    //var obtainedName = sharedPreferences.getString('usu_nombre');

    setState(() {
      finalEmail = obtainedEmail!;
      //finalName = obtainedName!;
    });
    print(obtainedEmail);
    //print(finalName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primary,
        body: Container(
          child: Center(
            child: Text(
              'SPLASH SCREEN WITH LOGO TTUMBLE HERE',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ));
  }
}

/* Future<void> splash() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var obtainedEmail = sharedPreferences.getString('usu_correo');
  runApp(MaterialApp(
    home: obtainedEmail == null ? LoginPage() : Location(),
  )); */
/* var obtainedName = sharedPreferences.getString('usu_nombre');

  setState(() {
    finalEmail = obtainedEmail!;
    finalName = obtainedName!;
  });  */
/* print(obtainedEmail);
  print(finalName);
}*/
