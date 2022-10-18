import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttumble/main.dart';
import 'package:ttumble/views/chat/chat_page.dart';
import 'package:ttumble/views/chat/message.dart';
import 'package:ttumble/views/screens/home_page.dart';
import 'package:ttumble/views/utils/variables.dart';
import 'package:ttumble/views/widgets/splash_chat.dart';

import '../chat/new_message_widget.dart';
import '../utils/AppColor.dart';
import '../utils/utilss.dart';
import '../widgets/button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'date_picker_page.dart';

class TimePickerPage extends StatefulWidget {
  @override
  _TimePickerPageState createState() => _TimePickerPageState();
}

String userIdChatt = "";

class _TimePickerPageState extends State<TimePickerPage> {
  void ticket(String userId, service, location, description, date) async {
    try {
      Response response = await post(
          Uri.parse(
              'http://tumble.growmediard.com/controller/ticketController.php?op=Insert'),
          body: {
            'userId': userId,
            'service': service,
            'location': location,
            'description': description,
            'date': date
          });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        print(data);
      } else {
        print('failed4');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  /////
  /* void chat(String userId, fullname, service) async */ Future<void> chat(
      String userId, fullname, service) async {
    debugPrint('first method called');
    sleep(const Duration(seconds: 3));
    try {
      Response response = await post(
          Uri.parse(
              'http://tumble.growmediard.com/controller/chatController.php?op=Insert'),
          body: {
            'userId': userId,
            'fullname': fullname,
            'service': service,
          });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        print(await data);
        print(await data[0]['ch_id']);
        print('vamos a ver el id del chat desde time picker');
        userIdChatt = await (data[0]['ch_id']);
        print('aqui ahora este es el correcto' + userIdChatt);
        //print('aqui ahora obtained viejo' + obtainedChatId);
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString('ch_id', '$userIdChatt'.toString());
        print('no se guarda el id' +
            userIdChatt +
            'enviana antes' +
            '$userIdChatt');
      } else {
        print('failed3');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void chatId(String ch_id) async {
    try {
      Response response = await post(
          Uri.parse(
              'http://tumble.growmediard.com/controller/messageController.php?op=message-chat-id'),
          body: {'ch_id': ch_id});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString('ch_id', '$userIdChat'.toString());

        print(data);
        print('estoestoesto');
      } else {
        print('failed2');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void metodo() {
    if ('$userIdChatt' != "") {
      print('estamos en mensaje');
      message(completeService, '$obtainedId', '$obtainedNivel', userIdChatt);
      print('terminoooooo mensaje');
    } else {
      print('esta vacio');
    }
    /* if (userIdChatt != "") {
      print('estamos en mensaje');
      message(completeService, '$obtainedId', '$obtainedNivel', '$userIdChatt');
      print('termin mensaje');
    } */
  }

  Future<void> metodo1() async {
    Duration(seconds: 6);
    print('metodo metodo en chat');
    chat('$obtainedId', '$obtainedName', userService);
    print('termino chat');
  }

  metodo2() {
    print('metodo metodo en mess');
    message(completeService, '$obtainedId', '$obtainedNivel', userIdChatt);
    print('termino metodo en mess');
  }

  void message(String texto, usu_id, usu_nivel, ch_id) async {
    debugPrint('second method called');
    sleep(const Duration(seconds: 3));
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

        print(await data);
        print(await data[0]['ch_id']);
        print('esta en metodo message');

        /* final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString('ch_id', '$userIdChat'.toString());  coemtado a las 1.45 p.m. 18 de oct*/
        print('esta en metodo message 2');
      } else {
        print('failed1');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  DateTime dateTime = DateTime.now();

  @override
  void initState() {
    super.initState();

    dateTime = getDateTime();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          brightness: Brightness.dark,
          backgroundColor: AppColor.primary,
          elevation: 0,
          centerTitle: true,
          title: Text('TTumble',
              style: TextStyle(
                  fontFamily: 'Ang',
                  fontWeight: FontWeight.w700,
                  fontSize: 30)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => /* Chat */ DatePickerPage(),
              ));
            },
            /*  onPressed: () {
              Navigator.of(context).pop();
            }, */
          ),
        ),
        body: Center(
          child: Column(
            /* mainAxisAlignment: MainAxisAlignment.center, */
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                child: Image.asset(
                  'assets/images/clock-.gif',
                  height: 100,
                ),
              ),
              Center(
                child: Text(
                  "Set the hour of the service",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColor.primary),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                //apply margin and padding using Container Widget.
                padding: EdgeInsets.only(
                    top: 30), //You can use EdgeInsets like above
                margin: EdgeInsets.all(5),
                child: Text('$userDate',
                    style: TextStyle(
                        fontFamily: 'Ang',
                        fontWeight: FontWeight.w700,
                        fontSize: 30)), /* Text("$flo" ) */
              ),
              /* buildTimePicker(), */
              const SizedBox(height: 24),
              ButtonWidget(
                onClicked: () => Utilss.showSheet(
                  context,
                  child: buildTimePicker(),
                  onClicked: () async {
                    final value = DateFormat('HH:mm').format(dateTime);
                    Utilss.showSnackBar(context, 'Hour Selected $value');
                    userHour = value;
                    print(userHour);
                    print('okook');
                    dateFull = (userDate + ", " + userHour);
                    ticket('$obtainedId', '$userService', locationFull,
                        userDescription, dateFull);

                    //chat('$obtainedId', '$obtainedName', userService); esto si crea los chat pero despues de los mensajes
                    /* final SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    sharedPreferences.setString(
                        'ch_id', '$userIdChat'.toString()); esto ya esta en el metodo chat*/

                    //SplashChat();

                    //chatId('$userIdChat/* obtainedChatId */');

                    completeService = ("Hello Ttumble I need a " +
                        userService +
                        " service, My location is " +
                        locationFull +
                        ", Description: " +
                        userDescription +
                        " ,In date: " +
                        dateFull);
                    /* print('vamos a ver el id obtain  y ahora el useridchat' +
                        '$userIdChat'); */
                    /* while(userIdChat.isEmpty){

                        } */
                    print('veamos el valor del user id chat' +
                        '$userIdChat' +
                        'ecco');
                    await chat('$obtainedId', '$obtainedName', userService)
                        .then((value) => message(completeService, '$obtainedId',
                            '$obtainedNivel', userIdChatt));
                    /* print('metodo metodo en chat');
                    chat('$obtainedId', '$obtainedName', userService);
                    print('termino chat'); */
                    //metodo();

                    /* if (userIdChatt.isEmpty) {
                      chat('$obtainedId', '$obtainedName', userService);
                      message(completeService, '$obtainedId', '$obtainedNivel',
                          '$userIdChatt');
                      Navigator.pop(context);
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => /* ChatPage */ SplashChat(),
                      ));
                    } */
                    /* message(completeService, '$obtainedId', '$obtainedNivel',
                        '$userIdChatt'); funciona pero se ejecuta antes de chat method */ /* '$userIdChat' */

                    /* if (userIdChat.isNotEmpty) {
                      message(completeService, '$obtainedId', '$obtainedNivel',
                          userIdChat);
                      print('non capisco');
                    } else {
                      print('vuoto qui');
                    } */

                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => /* ChatPage */ SplashChat(),
                    ));
                  },
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildTimePicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          initialDateTime: dateTime,
          mode: CupertinoDatePickerMode.time,
          minuteInterval: 10,
          //use24hFormat: true,
          onDateTimeChanged: (dateTime) =>
              setState(() => this.dateTime = dateTime),
        ),
      );

  DateTime getDateTime() {
    final now = DateTime.now();

    return DateTime(now.year, now.month, now.day, now.hour, 0);
  }
}
