import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttumble/views/utils/variables.dart';
import '../../main.dart';
import 'first_message.dart';
import 'message.dart';
import '../screens/time_picker_page.dart';
import '../utils/AppColor.dart';
import 'message_bubble_widget.dart';
import 'new_message_widget.dart';

class Chat extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme(
            brightness: Brightness.light,
            primary: AppColor.primary,
            onPrimary: Colors.white,
            secondary: Colors.black87,
            onSecondary: Colors.black38,
            background: Colors.blue,
            onBackground: Colors.white70,
            onError: Colors.red.shade400,
            error: Colors.red.shade700,
            surface: Colors.orange.shade200,
            onSurface: Colors.orange.shade600,
          ),
        ),
        home: ChatPage(),
      );
}

class ChatPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<ChatPage> {
  /* void chatId(String ch_id) async {
    try {
      Response response = await post(
          Uri.parse(
              'https://en2gomas.com/api.tumble/controller/messageController.php?op=message-chat-id'),
          body: {'ch_id': ch_id});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        print(data);

        print(userIdChat);

        data.forEach((element) => {textt = element['ms_texto']});
        data.forEach((element) => {print(element['ms_texto'])});
        print('este es el valor de text que envio ' + textt.toString());

        List<Message> messages = [];

        data.forEach((element) => {
              Message(
                text: element['ms_texto'],
                date: DateTime.now().subtract(const Duration(minutes: 2)),
                isSentByMe: true,
              )
            });

        //textt = (data[0]['ms_texto']);

        //print(data[0]['ms_texto']);
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  } */

  List<Message> messages = [
    Message(
      text: 'Hello! Thanks for using TTUMBLE.',
      date: DateTime.now().subtract(const Duration(minutes: 2)),
      isSentByMe: false,
    ),
    //esta burbuja de message deberia repetirse por cada
    //elemento en ese textt
    Message(
      text: '$completeService',
      date: DateTime.now().subtract(const Duration(minutes: 3)),
      isSentByMe: true,
    ),
    Message(
      text: '$textt',
      date: DateTime.now().subtract(const Duration(minutes: 5)),
      isSentByMe: true,
    ),
  ].reversed.toList();

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
              Navigator.of(context).pop();
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () async {
                final SharedPreferences sharedPreferences =
                    await SharedPreferences.getInstance();
                sharedPreferences.setString('ch_id', '$userIdChat'.toString());
                print(['$textt']);

                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => /* DeliciousTodayPage */ MainPage(),
                ));
              },
            ),
          ],
        ),
        /*  body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(left: 10, right: 10, top: 24),
          child: Column(
            children: List.generate(messages.length, (index) {
              return Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: GroupedListView<Message, DateTime>(
                    padding: const EdgeInsets.all(8),
                    reverse: true,
                    order: GroupedListOrder.DESC,
                    useStickyGroupSeparators: true,
                    floatingHeader: true,
                    elements: messages,
                    groupBy: (message) => DateTime(
                      message.date.year,
                      message.date.month,
                      message.date.day,
                    ),
                    groupHeaderBuilder: (Message message) => SizedBox(
                      height: 40,
                      child: Center(
                        child: Card(
                          color: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              DateFormat.yMMMd().format(message.date),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    itemBuilder: (context, Message message) =>
                        MessageBubble(message: message),
                  ));
            }),
          ), */

        body: Column(
          children: [
            Expanded(
              child: GroupedListView<Message, DateTime>(
                padding: const EdgeInsets.all(8),
                reverse: true,
                order: GroupedListOrder.DESC,
                useStickyGroupSeparators: true,
                floatingHeader: true,
                elements: messages,
                groupBy: (message) => DateTime(
                  message.date.year,
                  message.date.month,
                  message.date.day,
                ),
                groupHeaderBuilder: (Message message) => SizedBox(
                  height: 40,
                  child: Center(
                    child: Card(
                      color: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          DateFormat.yMMMd().format(message.date),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                itemBuilder: (context, Message message) =>
                    MessageBubble(message: message),
              ),
            ),
            NewMessageWidget(
              onSubmitted: (text) {
                final message = Message(
                  text: text,
                  date: DateTime.now(),
                  isSentByMe: true,
                );

                setState(() => messages.add(message));
              },
            ),

            ///
            ///
            /* FirstMessage(
              onSubmitted: (text) {
                final message = Message(
                  text: text,
                  date: DateTime.now(),
                  isSentByMe: true,
                );

                setState(() => messages.add(message));
              },
            ), */
          ],
        ),
      );
}
