import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import '../main.dart';
import '../models/message.dart';
import 'screens/time_picker_page.dart';
import 'utils/AppColor.dart';
import 'widgets/message_bubble_widget.dart';
import 'widgets/new_message_widget.dart';

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
  List<Message> messages = [
    Message(
      text: 'Soon we will be confirming your service.',
      date: DateTime.now().subtract(const Duration(minutes: 1)),
      isSentByMe: false,
    ),
    Message(
      text: 'Hello Caterina! Thanks for using TTUMBLE.',
      date: DateTime.now().subtract(const Duration(minutes: 2)),
      isSentByMe: false,
    ),
    Message(
      text: 'Day selected: 8/25/2022 at 10:30',
      date: DateTime.now().subtract(const Duration(minutes: 3)),
      isSentByMe: true,
    ),
    Message(
      text: 'Description of the service: Cleaning my kitchen',
      date: DateTime.now().subtract(const Duration(minutes: 4)),
      isSentByMe: true,
    ),
    Message(
      text: 'My location is: Prueba Street #5, NEW YORK 2323, United States',
      date: DateTime.now().subtract(const Duration(minutes: 5)),
      isSentByMe: true,
    ),
    Message(
      text: 'Hello TTUMBLE, I am requesting the delivery service',
      date: DateTime.now().subtract(const Duration(minutes: 6)),
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
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => /* DeliciousTodayPage */ TimePickerPage(),
              ));
            },
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => /* DeliciousTodayPage */ MainPage(),
                ));
              },
            ),
            // add more IconButton
          ],
          /* actions: [
            Icon(
              Icons.home_filled,
              color: Colors.white,
              size: 30,
            ),
          ], */
        ),
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
          ],
        ),
      );
}
