/* import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ttumble/views/prueba.dart';

import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:ttumble/views/utils/variables.dart';

class FirstMessage extends StatefulWidget {
  final ValueChanged<String> onSubmitted;

  const FirstMessage({
    key,
    required this.onSubmitted,
  }) : super(key: key);

  @override
  State<FirstMessage> createState() => _NewMessageWidgetState();
}

class _NewMessageWidgetState extends State<FirstMessage> {
  void message(String texto, usu_id, usu_nivel, ch_id) async {
    try {
      Response response = await post(
          Uri.parse(
              'https://en2gomas.com/api.tumble/controller/messageController.php?op=Insert-message'),
          body: {
            'texto': texto,
            'usu_id': usu_id,
            'usu_nivel': usu_nivel,
            'ch_id': ch_id
          });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        print(data);
        String text = '$completeService';
        message(text, '$obtainedId', '$obtainedNivel', '$obtainedChatId');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  dynamic noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}
 */