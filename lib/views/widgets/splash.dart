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
late String finalNumero;
late String finalToken;

late String finalNivel;
late String finalId;

/* late var obtainedName;
 */

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
    obtainedName = sharedPreferences.getString('usu_nombre');
    obtainerNumero = sharedPreferences.getString('usu_numero');
    obtainedToken = sharedPreferences.getString('token');
    obtainedNivel = sharedPreferences.getString('usu_nivel');
    obtainedId = sharedPreferences.getString('usu_id');

    setState(() {
      finalEmail = obtainedEmail;
      finalName = obtainedName;
      finalNumero = obtainerNumero;
      finalToken = obtainedToken;
      finalNivel = obtainedNivel;
      finalId = obtainedId;
    });
    print('ahpra esot');
    print(obtainedEmail);
    print(obtainedName);
    print(obtainerNumero);
    print(obtainedToken);
    print(obtainedNivel);
    print(obtainedId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/back_.png'),
                    fit: BoxFit.cover)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: CircularProgressIndicator(
                            strokeWidth: 6.0,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                AppColor.primary)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
/* Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          child: Center(
            child: Text(
              'SPLASH SCREEN WITH LOGO TTUMBLE HERE',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ));
  } */
