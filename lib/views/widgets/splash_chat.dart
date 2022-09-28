import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttumble/main.dart';
import 'package:ttumble/views/chat/allchat.dart';
import 'package:ttumble/views/chat/chat_page.dart';
import 'package:ttumble/views/screens/auth/login_page.dart';
import 'package:ttumble/views/screens/home_page.dart';
import 'package:ttumble/views/screens/location_page.dart';
import 'package:ttumble/views/utils/AppColor.dart';
import 'package:ttumble/views/utils/variables.dart';

import '../screens/location.dart';

class SplashChat extends StatefulWidget {
  const SplashChat({Key? key}) : super(key: key);

  @override
  State<SplashChat> createState() => _SplashChatState();
}

/* late String finalEmail;
late String finalName;
late String finalNumero;
late String finalToken;

late String finalNivel; */

late String finalChatId;
late String finalEmail;
late String finalName;
late String finalNumero;
late String finalToken;

late String finalNivel;
late String finalId;

/* late var obtainedName;
 */

class _SplashChatState extends State<SplashChat> {
  @override
  void initState() {
    getValidationData().whenComplete(() async {
      Timer(
          // ignore: unnecessary_null_comparison
          Duration(milliseconds: 2500),
          () => Get.to(obtainedChatId == null /* && finalName == null */
              ? LoginPage()
              : Allchat()));
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
    obtainedChatId = sharedPreferences.getString('ch_id');
    obtainedEmail = sharedPreferences.getString('usu_correo');
    obtainedName = sharedPreferences.getString('usu_nombre');
    obtainerNumero = sharedPreferences.getString('usu_numero');
    obtainedToken = sharedPreferences.getString('token');
    obtainedNivel = sharedPreferences.getString('usu_nivel');
    obtainedId = sharedPreferences.getString('usu_id');
    /* obtainedName = sharedPreferences.getString('usu_nombre');
    obtainerNumero = sharedPreferences.getString('usu_numero');
    obtainedToken = sharedPreferences.getString('token');
    obtainedNivel = sharedPreferences.getString('usu_nivel'); */

    setState(() {
      finalChatId = obtainedChatId;
      finalEmail = obtainedEmail;
      finalName = obtainedName;
      finalNumero = obtainerNumero;
      finalToken = obtainedToken;
      finalNivel = obtainedNivel;
      finalId = obtainedId;
      /* finalName = obtainedName;
      finalNumero = obtainerNumero;
      finalToken = obtainedToken;
      finalNivel = obtainedNivel; */
    });
    print('el id del chat aqui');
    print(obtainedChatId);

    print(obtainedEmail);
    print(obtainedName);
    print(obtainerNumero);
    print(obtainedToken);
    print(obtainedNivel);
    print(obtainedId);
    /* print(obtainedName);
    print(obtainerNumero);
    print(obtainedToken);
    print(obtainedNivel); */
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.primary,
        body: Container(
          child: Center(
            child: Text(
              'SPLASH CHATTT WITH LOGO TTUMBLE HERE',
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
