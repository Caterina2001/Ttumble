import 'package:expansion_card/expansion_card.dart';
import 'package:flutter/material.dart';
import '../utils/AppColor.dart';

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
                fontFamily: 'Ang', fontWeight: FontWeight.w700, fontSize: 30)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 24),
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
                      "Delivery Service",
                      style: TextStyle(
                          fontSize: 30, color: Colors.white, fontFamily: 'Ang'),
                    ),
                    Text(
                      "In process to be confirm",
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
                      child: Text(
                          "I need a delivery to move a piece of furniture to the Bronx",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          )),
                    ))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 24),
            child: ExpansionCard(
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
                      "Shopping Service",
                      style: TextStyle(
                          fontSize: 30, color: Colors.white, fontFamily: 'Ang'),
                    ),
                    Text(
                      "Task completed on 4/20/2022",
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
                      child: Text("Shopping in Zara Store",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          )),
                    ))
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 24),
            child: ExpansionCard(
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
                      "Mounting Service",
                      style: TextStyle(
                          fontSize: 30, color: Colors.white, fontFamily: 'Ang'),
                    ),
                    Text(
                      "Task completed on 1/5/2022",
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
                      child: Text("I have to mounting a door in the house",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          )),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
