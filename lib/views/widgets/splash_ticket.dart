import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttumble/main.dart';
import 'package:ttumble/views/screens/auth/login_page.dart';
import 'package:ttumble/views/screens/home_page.dart';
import 'package:ttumble/views/screens/location_page.dart';
import 'package:ttumble/views/utils/AppColor.dart';
import 'package:ttumble/views/utils/variables.dart';

import '../screens/cards_page.dart';
import '../screens/description_page.dart';
import '../screens/location.dart';

class SplashTicket extends StatefulWidget {
  const SplashTicket({Key? key}) : super(key: key);

  @override
  State<SplashTicket> createState() => _SplashState();
}

late String finalEmail;
late String finalName;
late String finalNumero;
late String finalToken;

late String finalNivel;
late String finalId;

/* late var obtainedName;
 */

class _SplashState extends State<SplashTicket> {
  @override
  void initState() {
    getValidationData().whenComplete(() async {
      Timer(
          // ignore: unnecessary_null_comparison
          Duration(milliseconds: 2500),
          () => Get.to(obtainedEmail == null /* && finalName == null */
              ? LoginPage()
              : CardsPage()));
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

    obtainedId = sharedPreferences.getString('usu_id');
    ticket(obtainedId);

    setState(() {
      finalId = obtainedId;
    });
    print('ahpra esto id ticket');

    print(obtainedId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primary,
        body: Container(
          child: Center(
            child: Text(
              'SPLASH tickettt WITH LOGO TTUMBLE HERE',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ));
  }
}

void ticket(String userId) async {
  try {
    Response response = await post(
        Uri.parse(
            'https://en2gomas.com/api.tumble/controller/ticketController.php?op=userTicket'),
        body: {'userId': userId});

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print(data);
      print(data);
      data.forEach((element) => {print(element['tk_service_name'])});
      print('aa');
      data.forEach((element) => {listTicket.add(element['tk_service_name'])});
      data.forEach(
          (elementt) => {descriptionTicket.add(elementt['tk_description'])});
      print('eeeEEEE');
      print(descriptionTicket);
      print(listTicket);
      print('b');
      /*  print('$yes');
      listTicket.forEach((value) {
        print(value);
      }); */

      //print(data[0]['tk_service_name']);

      print(data[0]['usu_id']); //
      /* if (data == 'No encontrado') {
        print('Usuario no encontrado, intente de nuevo');
      } else {
        print(data[0]['usu_id']);
        //okok = (data[0]['usu_id']);
        userId = (data[0]['usu_id']);
        print('ticket id es>>>>>');
        print(userId);

        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();

        sharedPreferences.setString('usu_id', '$userId'.toString());
        /*  Get.to(MainPage()); */
        print(data);
      } */
    } else {
      print('failed');
    }
  } catch (e) {
    print(e.toString());
  }
}
