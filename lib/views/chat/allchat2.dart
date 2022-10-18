import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ttumble/models/core/ttumble2.dart';
import 'package:ttumble/views/chat/chat_page.dart';
import 'package:ttumble/views/chat/chat_page_admin.dart';
import 'package:ttumble/views/utils/AppColor.dart';
import 'package:ttumble/views/widgets/modals/login_modal.dart';
import 'package:ttumble/views/widgets/modals/login_modalprueba.dart';
import 'package:ttumble/views/widgets/modals/register_modal.dart';

import '../utils/variables.dart';
import 'message.dart';

class Allchat2 extends StatelessWidget {
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
        print('aaaaaaaaaaaaaaaaaa');
        print(data[0]['ms_id']);
        print(data[0]['ch_id']);
        print('ver que pasa $userIdChat');

        print('klkpasaki all chat');
        textt = [];

        //data.forEach((element) => {print(element['ms_texto'])}); esto imprime todo por separado
        data.forEach((element) => {textt.add(element['ms_texto'])});

        /* data.forEach((element) => {
              Message(
                  text: (element['ms_texto']),
                  date: DateTime.now(),
                  isSentByMe: true)
            }); //// */

        print('este es el valor de text que envio ' + textt.toString());

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

  void message(String texto, usu_id, usu_nivel, ch_id) async {
    try {
      Response response = await post(
          Uri.parse(
              'http://tumble.growmediard.com/controller/messageController.php?op=Insert-message'),
          body: {
            'texto': texto,
            'usu_id': usu_id,
            'usu_nivel': usu_nivel,
            'ch_id': ch_id
          });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        print(data);

        print('a ver all chat 2');
        /*  String text = '$completeService';
        message(text, '$obtainedId', '$obtainedNivel', '$obtainedChatId'); */
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        children: [
          Padding(
              padding: EdgeInsets.only(top: 150),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: OutlinedButton(
                  child: Text('GO TO CHAT',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: AppColor.secondary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'inter')),
                  onPressed: () {
                    //print('one more time' + textt);

                    chatId('$obtainedChatId');

                    print('id chat $obtainedChatId');
                    /* message('$completeService', '$obtainedId', '$obtainedNivel',
                    '$obtainedChatId'); */
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChatPageAdmin(),
                    ));
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    side: BorderSide(
                        color: AppColor.secondary.withOpacity(0.5), width: 1),
                    primary: Colors.white,
                  ),
                ),
              ))
        ],
      ),
    ));
  }
}
