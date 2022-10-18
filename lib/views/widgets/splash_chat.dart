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
import 'package:ttumble/views/chat/allchat.dart';
import 'package:ttumble/views/chat/chat_page.dart';
import 'package:ttumble/views/screens/auth/login_page.dart';
import 'package:ttumble/views/screens/home_page.dart';
import 'package:ttumble/views/screens/location_page.dart';
import 'package:ttumble/views/utils/AppColor.dart';
import 'package:ttumble/views/utils/variables.dart';
import 'package:ttumble/views/widgets/splash_chat2.dart';

import '../screens/location.dart';
import '../screens/time_picker_page.dart';

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

class _SplashChatState extends State<SplashChat> {
  @override
  void initState() {
    //textt = [];
/*     chatNivel = [];
 */
    getValidationData().whenComplete(() async {
      Timer(
          // ignore: unnecessary_null_comparison
          Duration(milliseconds: 2500),
          () => Get.to(obtainedEmail == null ? LoginPage() : SplashChat2()));
    });
    super.initState();
    //navigate();
    //getValidationData();
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    userIdChatt = sharedPreferences.getString('ch_id')!;
    obtainedEmail = sharedPreferences.getString('usu_correo');
    obtainedName = sharedPreferences.getString('usu_nombre');
    obtainerNumero = sharedPreferences.getString('usu_numero');
    obtainedToken = sharedPreferences.getString('token');
    obtainedNivel = sharedPreferences.getString('usu_nivel');
    obtainedId = sharedPreferences.getString('usu_id');

    chatId(/* '$obtainedChatId' */ '$userIdChatt');

    setState(() {
      finalChatId = /* obtainedChatId */ userIdChatt;
      finalEmail = obtainedEmail;
      finalName = obtainedName;
      finalNumero = obtainerNumero;
      finalToken = obtainedToken;
      finalNivel = obtainedNivel;
      finalId = obtainedId;
    });
    print('email:' + obtainedEmail);
    print('id guardado' + /* '$userIdChat' */ /* obtainedChatId */ userIdChatt);

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

void chatId(String ch_id) async {
  //textt = [];
  try {
    /////mequedeaui
    Response response = await post(
        Uri.parse(
            'http://tumble.growmediard.com/controller/messageController.php?op=message-chat-id'),
        body: {'ch_id': ch_id});

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());

      print(data);
      print(data[0]['ch_id']);
      print('ver que pasa $userIdChat');

      print('klkpasaki splash chat');
      textt = [];
      chatNivel = [];

      data.forEach((element) => {textt.add(element['ms_texto'])});
      data.forEach((element) => {chatNivel.add(element['usu_nivel'])});

      print('este es el valor de text que envio ' + textt.toString());
      print('aaaaaaaaaaa' + chatNivel.toString());

      /* data.forEach((element) => {
              Message(
                text: element['ms_texto'],
                date: DateTime.now().subtract(const Duration(minutes: 2)),
                isSentByMe: true,
              )
            }); */

      //textt = (data[0]['ms_texto']);

      //print(data[0]['ms_texto']);
    } else {
      print('failed');
    }
  } catch (e) {
    print(e.toString());
  }
}
