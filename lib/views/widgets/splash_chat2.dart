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
import 'package:ttumble/views/chat/allchat2.dart';
import 'package:ttumble/views/chat/chat_page.dart';
import 'package:ttumble/views/screens/auth/login_page.dart';
import 'package:ttumble/views/screens/home_page.dart';
import 'package:ttumble/views/screens/location_page.dart';
import 'package:ttumble/views/utils/AppColor.dart';
import 'package:ttumble/views/utils/variables.dart';

import '../screens/location.dart';

class SplashChat2 extends StatefulWidget {
  const SplashChat2({Key? key}) : super(key: key);

  @override
  State<SplashChat2> createState() => _SplashChatState2();
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

class _SplashChatState2 extends State<SplashChat2> {
  @override
  void initState() {
/*     chatNivel = [];
 */
    //textt = [];
    serviceChat = [];
    getValidationData().whenComplete(() async {
      Timer(
          // ignore: unnecessary_null_comparison
          Duration(milliseconds: 2500),
          () =>
              Get.to(obtainedNivel == 'Cliente' ? Allchat() : AllchatAdmin()));
    });
    super.initState();
    //navigate();
    //getValidationData();
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
/*     obtainedChatId = sharedPreferences.getString('ch_id');
 */
    obtainedEmail = sharedPreferences.getString('usu_correo');
    obtainedName = sharedPreferences.getString('usu_nombre');
    obtainerNumero = sharedPreferences.getString('usu_numero');
    obtainedToken = sharedPreferences.getString('token');
    obtainedNivel = sharedPreferences.getString('usu_nivel');
    obtainedId = sharedPreferences.getString('usu_id');

    chUser(obtainedId);

    //chatId('$obtainedChatId'); /*  comentado a las6.42 */

    setState(() {
/*       finalChatId = obtainedChatId;
 */
      finalEmail = obtainedEmail;
      finalName = obtainedName;
      finalNumero = obtainerNumero;
      finalToken = obtainedToken;
      finalNivel = obtainedNivel;
      finalId = obtainedId;
    });
    print('email:' + obtainedEmail);
/*     print('id guardado' + obtainedChatId); /* userIdChat */
 */
    print(obtainedEmail);
    print(obtainedName);
    print(obtainerNumero);
    print(obtainedToken);
    print(obtainedNivel);
    print(obtainedId);
/*     print(obtainedChatId);
 */
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

void chUser(String userId) async {
  //listTicket = List.empty();
  try {
    Response response = await post(
        Uri.parse(
            'http://tumble.growmediard.com/controller/chatController.php?op=Get-chat-user'),
        body: {'userId': userId});

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print(data);
      print('aa');

      data.forEach(
          (elementt) => {serviceChat.add(elementt['ch_service_name'])});
      data.forEach((elementt) => {idChat.add(elementt['ch_id'])});

      print('eeeEEEE');
      print(serviceChat);
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

      //data.forEach((element) => {print(element['ms_texto'])}); esto imprime todo por separado
/*       data.forEach((element) => {textt.add(element['ms_texto'])});
 */
      /* data.forEach((element) => {
              Message(
                  text: (element['ms_texto']),
                  date: DateTime.now(),
                  isSentByMe: true)
            }); //// */

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
