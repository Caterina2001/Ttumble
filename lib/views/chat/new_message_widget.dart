import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ttumble/views/chat/chat_page.dart';
import 'package:ttumble/views/prueba.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:ttumble/views/utils/AppColor.dart';
import 'package:ttumble/views/utils/variables.dart';

class NewMessageWidget extends StatefulWidget {
  final ValueChanged<String> onSubmitted;

  const NewMessageWidget({
    key,
    required this.onSubmitted,
  }) : super(key: key);

  @override
  State<NewMessageWidget> createState() => _NewMessageWidgetState();
}

class _NewMessageWidgetState extends State<NewMessageWidget> {
  void initState() {
    super.initState();

    setState(() {
      /* _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          _createFloating();
          print('first');
          Allchat();
       
        });
      }); */
    });
    /*  timer =
        Timer.periodic(Duration(seconds: 1), (Timer t) => _createFloating()); */
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
        print('klkpasaki');
        textt = [];

        data.forEach((element) => {print(element['ms_texto'])});
        print(['esto por separado']);
        data.forEach((element) => {textt.add(element['ms_texto'])});

        /* data.forEach((element) => {
              Message(
                  text: (element['ms_texto']),
                  date: DateTime.now(),ciao
                  isSentByMe: true)
            }); //// */

        //print('este es el valor de text que envio otro ' + textt.toString());

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

  final messagecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.only(
          bottom: 10,
          left: 10,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Material(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
                elevation: 5,
                child: TextField(
                  controller: messagecontroller,
                  onSubmitted: widget.onSubmitted,
                  decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                    hintText: 'Put your message here...',
                    hintStyle: TextStyle(fontSize: 14),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            MaterialButton(
              shape: const CircleBorder(),
              color: AppColor.primary,
              onPressed: () {
                if (messagecontroller.text.trim().isEmpty) return;

                widget.onSubmitted(messagecontroller.text);

                ///
                String text = messagecontroller.text;
                message(
                    text, '$obtainedId', '$obtainedNivel', '$obtainedChatId');

                ///
                ///

                messagecontroller.clear();
                chatId('$obtainedChatId');
                /* Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Chat(),
                )); */
              },
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(Icons.send, color: Colors.white),
              ),
            ),
            MaterialButton(
              shape: const CircleBorder(),
              color: AppColor.primary,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Prueba(),
                ));
              },
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(Icons.camera_alt_sharp, color: Colors.white),
              ),
            ),
          ],
        ),
      );
}
