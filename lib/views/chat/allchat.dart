import 'dart:convert';

import 'package:expansion_card/expansion_card.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:ttumble/models/core/ttumble2.dart';
import 'package:ttumble/views/chat/chat_page.dart';
import 'package:ttumble/views/utils/AppColor.dart';
import 'package:ttumble/views/widgets/modals/login_modal.dart';
import 'package:ttumble/views/widgets/modals/login_modalprueba.dart';
import 'package:ttumble/views/widgets/modals/register_modal.dart';

import '../../blocs/covid_bloc/services_bloc.dart';
import '../../main.dart';
import '../../models/chatu_model.dart';
import '../utils/variables.dart';
import 'message.dart';

final ChatUBloc chBloc = ChatUBloc();
final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();

class Allchat extends StatefulWidget {
  const Allchat({Key? key}) : super(key: key);

  @override
  State<Allchat> createState() => _Allchat();
}

class _Allchat extends State<Allchat> {
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
        print('ver el nivel' +
            data[0][
                'usu_nivel']); //SOLAMENTE AQUI TOMA EL NIVEL LOS OTROS SE PUEDEN IR
        print('ver que pasa $userIdChat');

        print('klkpasaki all chat');
        textt = [];

        //data.forEach((element) => {print(element['ms_texto'])}); esto imprime todo por separado
        data.forEach((element) => {textt.add(element['ms_texto'])});
        data.forEach((element) => {chatNivel.add(element['usu_nivel'])});

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
        print('a vcer');
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
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => MainPage(),
                ));
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 24),
            child: Column(
              children: List.generate(serviceChat.length, (index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: ExpansionCard(
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
                            serviceChat[index].toString(),
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontFamily: 'Ang'),
                          ),
                          /* Text(
                            "In process to Confirm",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ), */
                        ],
                      ),
                    ),
                    children: <Widget>[
                      /* Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 24,
                          ),
                          child: Center(
                            child: Text(serviceChat[index].toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                )),
                          )), */
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceAround,
                        buttonHeight: 10.0,
                        buttonMinWidth: 10.0,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {
                              cardB.currentState?.toggleExpansion();
                              idChatUnico = (idChat[index].toString());
                              chatId(idChatUnico);
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ChatPage(),
                              ));
                            },
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.mark_chat_read_outlined,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2.0),
                                ),
                                Text(
                                  'Chat Now!',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ) /* SingleChildScrollView(
            physics:
                AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
            child: Column(
              children: [
                ListChat(),
              ],
            )) */
        );
  }
}

Widget ListChat() {
  return Container(
    margin: EdgeInsets.all(8.0),
    child: BlocProvider(
      create: (_) => chBloc,
      child: BlocListener<ChatUBloc, ChatUState>(
        listener: (context, state) {
          if (state is ChatUError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message!),
              ),
            );
          }
        },
        child: BlocBuilder<ChatUBloc, ChatUState>(
          builder: (context, state) {
            if (state is ChatUInitial) {
              return _buildLoading();
            } else if (state is ChatULoading) {
              return _buildLoading();
            } else if (state is ChatULoaded) {
              return Chat(context, state.chatUModel);
            } else if (state is ChatUError) {
              return Container();
            } else {
              return Container();
            }
          },
        ),
      ),
    ),
  );
}

Widget Chat(BuildContext context, ChatUModel modell) {
  return Theme(
      data: ThemeData.from(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.orange)),
      child: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.only(left: 10, right: 10, top: 24),
        child: Column(
          children: List.generate(
            /* modell.chatt!.length */ 8,
            (index) {
              return Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: ExpansionTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.chat, color: Colors.white),
                      backgroundColor: AppColor.primary,
                    ),
                    title: Text(
                        ('${modell.chatt![index].chServiceName.toString()}')),
                    subtitle: Text(
                      ('${modell.chatt![index].usuFullname.toString()}'),
                    ),
                    children: <Widget>[
                      Divider(
                        thickness: 1.0,
                        height: 1.0,
                      ),
                      ButtonBar(
                        alignment: MainAxisAlignment.spaceAround,
                        buttonHeight: 52.0,
                        buttonMinWidth: 90.0,
                        children: <Widget>[
                          TextButton(
                            onPressed: () {
                              cardB.currentState?.toggleExpansion();
                              idChatUnico =
                                  ("${modell.chatt![index].chId}".toString());
                              print(idChatUnico);
                              chatId(idChatUnico);
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ChatPage(),
                              ));
                            },
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.mark_chat_read_outlined,
                                  color: AppColor.primary,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 2.0),
                                ),
                                Text(
                                  'Go to Chat',
                                  style: TextStyle(color: AppColor.primary),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ));
            },
          ),
        ),
      )));
}

Widget _buildLoading() => Center(child: CircularProgressIndicator());

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
      print('aaaaaaaaaaaaaaaaaa33333');
      print(data[0]['ms_id']);
      print(data[0]['ch_id']);
      print('este es el nivel' + data[0]['usu_nivel']);
      print('ver que pasa $userIdChat');

      print('klkpasaki all chat');
      textt = [];

      //data.forEach((element) => {print(element['ms_texto'])}); esto imprime todo por separado
      data.forEach((element) => {textt.add(element['ms_texto'])});
      data.forEach((element) => {chatNivel.add(element['usu_nivel'])});

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
