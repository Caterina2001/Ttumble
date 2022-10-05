import 'dart:convert';

import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
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
  /*  List<Message> messages = [
    Message(
      text: 'Hello! Thanks for using TTUMBLE.',
      date: DateTime.now().subtract(const Duration(minutes: 2)),
      isSentByMe: false,
    ),
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
  ].reversed.toList(); */

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
        /* body: SingleChildScrollView(
        child: 
        
      ) */
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 5, right: 5, top: 24),
                child: Column(
                  children: List.generate(textt.length, (index) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          constraints: const BoxConstraints(
                              minHeight: 30, minWidth: 100),
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            semanticContainer: true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                            elevation: 0,
                            color: AppColor.primary,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(5),
                                ),
                                Text(
                                  textt[index].toString(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(
                                    5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      /* child: Center(
                        child: Card(
                          elevation: 0,
                          color: Colors.orange,
                          child: const SizedBox(
                              width: 300, height: 100, child: Text('yesyes')),
                        ),
                      ) */

                      /* child: 
                    ExpansionCard(
                      borderRadius: 20,
                      background: Image.asset(
                        "assets/images/orange.jpg",
                        fit: BoxFit.cover,
                      ),
                      title: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              textt[index].toString(),
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ), */
                    );
                  }),
                ),
              ),
              /*  Container(
              child: FooterView(
                footer: new Footer(child: Text('data')),
                children: [],
              ),
            ) */

              /* Container(
              child: SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('data')
                    //footer widgets,
                  ],
                ),
              ),
            ) */

              /*  Expanded(
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
            ), */
            ],
          ),
        ),
        persistentFooterButtons: const [
          TextField(
            autofocus: true,
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'Put your message'),
          ),
          Icon(Icons.send),
          SizedBox(width: 10),
        ],
      );
}
