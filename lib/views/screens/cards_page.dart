import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import 'package:ttumble/views/utils/variables.dart';
import '../utils/AppColor.dart';

List text = [1, 2, 3, 4, 5, 6, 7, 8, 9];

class CardsPage extends StatelessWidget {
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
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 24),
            child: Column(
              children: List.generate(descriptionTicket.length, (index) {
                if (statusTicket[index].toString() == 'Pending') {
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
                              listTicket[index].toString(),
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontFamily: 'Ang'),
                            ),
                            Text(
                              "In process to Confirm",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(
                              left: 10,
                              right: 10,
                              top: 24,
                            ),
                            child: Center(
                              child: Text(descriptionTicket[index].toString(),
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  )),
                            ))
                      ],
                    ),
                  );
                } else {
                  return ExpansionCard(
                    borderRadius: 20,
                    background: Image.asset(
                      "assets/images/green.jpg",
                      fit: BoxFit.cover,
                    ),
                    title: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            listTicket[index].toString(),
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontFamily: 'Ang'),
                          ),
                          Text(
                            "Service completed",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 24,
                          ),
                          child: Center(
                            child: Text(descriptionTicket[index].toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                )),
                          ))
                    ],
                  );
                }
              }),
            ),
          ),
        ));
  }
}
