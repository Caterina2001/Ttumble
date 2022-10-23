import 'dart:convert';

import 'package:expansion_card/expansion_card.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:ttumble/blocs/covid_bloc/services_bloc.dart';
import 'package:ttumble/blocs/covid_bloc/ticket_event.dart';
import 'package:ttumble/models/ticket_model.dart';
import 'package:ttumble/views/utils/variables.dart';
import '../../main.dart';
import '../utils/AppColor.dart';
import '../widgets/splash.dart';

List text = [1, 2, 3, 4, 5, 6, 7, 8, 9];
final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();
final TicketBloc tickBloc = TicketBloc();

class CardsPageAdmin extends StatefulWidget {
  const CardsPageAdmin({Key? key}) : super(key: key);

  @override
  State<CardsPageAdmin> createState() => _CardsPageAdmin();
}

class _CardsPageAdmin extends State<CardsPageAdmin> /* StatelessWidget */ {
  void initState() {
    tickBloc.add(GetTicketList());
    super.initState();
  }

  String idd = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          brightness: Brightness.dark,
          backgroundColor: AppColor.primary,
          elevation: 0,
          centerTitle: true,
          title: Text('TTumble ADMIN',
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
            physics:
                AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
            child: Column(
              children: [
                ListTicket(),
              ],
            )));
  }
}

Widget ListTicket() {
  return Container(
    margin: EdgeInsets.all(8.0),
    child: BlocProvider(
      create: (_) => tickBloc,
      child: BlocListener<TicketBloc, TicketState>(
        listener: (context, state) {
          if (state is TicketError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message!),
              ),
            );
          }
        },
        child: BlocBuilder<TicketBloc, TicketState>(
          builder: (context, state) {
            if (state is TicketInitial) {
              return _buildLoading();
            } else if (state is TicketLoading) {
              return _buildLoading();
            } else if (state is TicketLoaded) {
              return Ticket(context, state.ticketModel);
            } else if (state is ServiceError) {
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

Widget Ticket(BuildContext context, TicektModel modell) {
  print('estamos en el widget de ticket');
  void estadoTicket(String tk_id) async {
    try {
      Response response = await post(
          Uri.parse(
              'http://tumble.growmediard.com/controller/ticketController.php?op=update-ticket'),
          body: {
            'tk_id': tk_id,
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

  return SingleChildScrollView(
    child: Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 24),
      child: Column(
        children: List.generate(modell.tickett!.length, (index) {
          if (('${modell.tickett![index].tkState.toString()}') == 'Completed') {
            return Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: ExpansionTileCard(
                  leading: CircleAvatar(
                    child: Text('SC', style: TextStyle(color: Colors.white)),
                    backgroundColor: Colors.green,
                  ),
                  title: Text(
                      ('${modell.tickett![index].tkServcieName.toString()}')),
                  subtitle: Text('Service Completed '),
                  children: <Widget>[
                    Divider(
                      thickness: 1.0,
                      height: 1.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Text(
                          ('${modell.tickett![index].tkDescription.toString()}'),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Text(
                          ('${modell.tickett![index].tkLocation.toString()}'),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Text(
                          ('${modell.tickett![index].tkId.toString()}'),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceAround,
                      buttonHeight: 52.0,
                      buttonMinWidth: 90.0,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            cardB.currentState?.toggleExpansion();
                            idTicketUnico =
                                ("${modell.tickett![index].tkId}".toString());
                            estadoTicket(idTicketUnico);
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.turned_in_not,
                                color: AppColor.primary,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Text(
                                'Delete service',
                                style: TextStyle(color: AppColor.primary),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ));
          } else {
            return Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: ExpansionTileCard(
                  leading: CircleAvatar(
                    child: Text('P', style: TextStyle(color: Colors.white)),
                    backgroundColor: AppColor.primary,
                  ),
                  title: Text(
                      ('${modell.tickett![index].tkServcieName.toString()}')),
                  subtitle: Text('In process to confirm'),
                  children: <Widget>[
                    Divider(
                      thickness: 1.0,
                      height: 1.0,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Text(
                          ('${modell.tickett![index].tkDescription.toString()}'),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Text(
                          ('${modell.tickett![index].tkLocation.toString()}'),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 8.0,
                        ),
                        child: Text(
                          ('Service created in date ${modell.tickett![index].tkCreated.toString()}'),
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(fontSize: 16),
                        ),
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.spaceAround,
                      buttonHeight: 52.0,
                      buttonMinWidth: 90.0,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            cardB.currentState?.toggleExpansion();
                            idTicketUnico =
                                ("${modell.tickett![index].tkId}".toString());
                            estadoTicket(idTicketUnico);
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.turned_in_not,
                                color: AppColor.primary,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Text(
                                'Confirm Service as Completed',
                                style: TextStyle(color: AppColor.primary),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ));
          }
        }),
      ),
    ),
  );
}

Widget _buildLoading() => Center(child: CircularProgressIndicator());
