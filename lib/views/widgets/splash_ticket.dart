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
import 'package:ttumble/views/screens/cards_page_admin.dart';
import 'package:ttumble/views/utils/AppColor.dart';
import 'package:ttumble/views/utils/variables.dart';
import 'package:ttumble/views/widgets/splash_ticket2.dart';

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
var items = {'tk_service_name': []};
var listTickett = {'tk_service_name': []};

class _SplashState extends State<SplashTicket> {
  @override
  void initState() {
    listTicket = [];
    descriptionTicket = [];
    getValidationData().whenComplete(() async {
      Timer(Duration(milliseconds: 1000),
          () => Get.to(obtainedId == null ? LoginPage() : SplashTicket2()));
    });

    super.initState();
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    obtainedId = sharedPreferences.getString('usu_id');
    //

    ticket(obtainedId);

    setState(() {
      listTickett = {'tk_service_name': []};
      finalId = obtainedId;
    });
    print('ahpra esto id ticket');

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

void ticket(String userId) async {
  //listTicket = List.empty();
  try {
    Response response = await post(
        Uri.parse(
            'http://tumble.growmediard.com/controller/ticketController.php?op=userTicket'),
        body: {'userId': userId});

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print(data);
      print(data);
      data.forEach((element) => {print(element['tk_service_name'])});
      print('aa');

      data.forEach((element) => {listTicket.add(element['tk_service_name'])});

      /* data.forEach((element) =>
          {listTickett['tk_service_name']?.addAll(element['tk_service_name'])}); */

      data.forEach(
          (elementt) => {descriptionTicket.add(elementt['tk_description'])});
      data.forEach((elementt) => {statusTicket.add(elementt['tk_state'])});
      data.forEach((elementt) => {locationTicket.add(elementt['tk_location'])});
      data.forEach((elementt) => {idTicket.add(elementt['tk_id'])});

      print('eeeEEEE');
      print(descriptionTicket);
      print(listTicket);
      print('b');

      print(data[0]['usu_id']); //

    } else {
      print('failed');
    }
  } catch (e) {
    print(e.toString());
  }
}
