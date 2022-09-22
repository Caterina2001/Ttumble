import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ttumble/views/screens/calendar_page.dart';
import 'package:ttumble/views/screens/date_page.dart';
import 'package:ttumble/views/utils/variables.dart';
import '../chat_page.dart';
import '../utils/AppColor.dart';
import 'date_picker_page.dart';

class Description extends StatelessWidget {
  final TextEditingController description = TextEditingController();

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
          /* Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            color: AppColor.primary,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'TTumble',
                style: TextStyle(
                  fontFamily: 'inter',
                  fontWeight: FontWeight.w700,
                  fontSize: 30,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ), */
          Material(
            color: Colors.white,
            child: Container(
              color: Colors.transparent,
              child: Column(
                children: <Widget>[
                  Image.asset(
                    'assets/images/desc.gif',
                    height: 130,
                  ),
                  Center(
                    child: Text(
                      "Service Description",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColor.primary),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.primary /* .withOpacity(0.40) */,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Form(
                            /* key: _formKey, */
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                  height: 3.7,
                                ),
                                Container(
                                  child: TextField(
                                    controller: description,
                                    minLines: 3,
                                    maxLines: 5,
                                    cursorColor: Colors.red,
                                    keyboardType: TextInputType.multiline,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.white, width: 2.0),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      hintText: 'Work description here...',
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 24, right: 24),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            padding: const EdgeInsets.only(top: 40),
            child: TextButton(
              onPressed: () {
                userDescription = description.text.toString();
                //loc(userId, locationFull, description.text.toString());

                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => /* Chat */ DatePickerPage(),
                ));
              },
              child: Text('NEXT'),
              style: TextButton.styleFrom(
                  backgroundColor: AppColor.primary,
                  primary: Colors.white,
                  textStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 30,
                      fontFamily: 'Ang')),
            ),
          ),
        ],
      ),
    );
  }
}
