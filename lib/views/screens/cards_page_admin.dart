import 'package:expansion_card/expansion_card.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:flutter/material.dart';
import 'package:ttumble/views/utils/variables.dart';
import '../../main.dart';
import '../utils/AppColor.dart';

List text = [1, 2, 3, 4, 5, 6, 7, 8, 9];
final GlobalKey<ExpansionTileCardState> cardA = new GlobalKey();
final GlobalKey<ExpansionTileCardState> cardB = new GlobalKey();

class CardsPageAdmin extends StatelessWidget {
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
            child: Column(
          children: List.generate(descriptionTicket.length, (index) {
            if (statusTicket[index].toString() == 'Pending') {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: ExpansionTileCard(
                  leading: CircleAvatar(
                    child: Text('P', style: TextStyle(color: Colors.white)),
                    backgroundColor: AppColor.primary,
                  ),
                  title: Text(listTicket[index].toString()),
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
                          descriptionTicket[index].toString(),
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
                          locationTicket[index].toString(),
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
                        /* TextButton(
                          onPressed: () {
                            cardB.currentState?.expand();
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.arrow_downward),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Text('Open'),
                            ],
                          ),
                        ), */
                        /* TextButton(
                          onPressed: () {
                            cardB.currentState?.collapse();
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.arrow_upward),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Text('Close'),
                            ],
                          ),
                        ), */
                        TextButton(
                          onPressed: () {
                            cardB.currentState?.toggleExpansion();
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
                                'Confirm Service Completed',
                                style: TextStyle(color: AppColor.primary),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: ExpansionTileCard(
                  leading: CircleAvatar(
                    child: Text(
                      'SC',
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Colors.green[800],
                  ),
                  title: Text(listTicket[index].toString()),
                  subtitle: Text('Service Completed!'),
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
                          descriptionTicket[index].toString(),
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
                          locationTicket[index].toString(),
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
                            cardB.currentState?.expand();
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.arrow_downward),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Text('Open'),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            cardB.currentState?.collapse();
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.arrow_upward),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Text('Close'),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            cardB.currentState?.toggleExpansion();
                          },
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.swap_vert),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2.0),
                              ),
                              Text('Toggle'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
          }),
        )));
  }
}
