import 'dart:async';
import 'dart:convert';

import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:footer/footer_view.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttumble/views/chat/allchat.dart';
import 'package:ttumble/views/utils/variables.dart';
import '../../main.dart';
import 'first_message.dart';
import 'message.dart';
import '../screens/time_picker_page.dart';
import '../utils/AppColor.dart';
import 'message_bubble_widget.dart';
import 'new_message_widget.dart';

//Timer timer;

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

String frasee = "folleto";

class _MainPageState extends State<ChatPage> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    setState(() {
      _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {
          _createFloating();
          /* print('first');
          Allchat(); */
        });
      });
    });
    /*  timer =
        Timer.periodic(Duration(seconds: 1), (Timer t) => _createFloating()); */
  }

  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          toolbarHeight: 80,
          brightness: Brightness.dark,
          backgroundColor: AppColor.primary,
          elevation: 0,
          centerTitle: true,
          title: Text('TTUMBLE',
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
        body: _createFloating(),
      );
}

Widget _createFloating() {
  return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            Text('TUTMBLE DOK'),
            Container(
              margin: EdgeInsets.only(left: 5, right: 5, top: 24),
              child: Column(
                children: List.generate(
                  textt.length,
                  (index) {
                    if (chatNivel[index].toString() == 'Cliente') {
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
                      );
                    } else {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 10.0),
                        child: Align(
                          alignment: Alignment.topLeft,
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
                      );
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildCommentBox());
}

Widget _buildCommentBox() {
  return BottomAppBar(
/*   width: screenWidth(context),
 */
    color: Colors.white,
    child: Container(
      child: BottomAppBar(
        child: NewMessageWidget(
          onSubmitted: (text) {
            final message = Message(
              text: text,
              date: DateTime.now(),
              isSentByMe: true,
            );

            //setState(() => messages.add(message));
          },
        ),
      ),
    ),
  );
}
