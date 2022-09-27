import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:ttumble/views/screens/calendar_page.dart';
import 'package:ttumble/views/screens/description_page.dart';
import 'package:ttumble/views/utils/AppColor.dart';
import 'package:ttumble/views/utils/variables.dart';
import 'package:ttumble/views/widgets/custom_text_field.dart';

Future location_page() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyPrueba());
}

class MyPrueba extends StatelessWidget {
  static final String title = 'Dropdown Menu';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
/*         theme: ThemeData(primarySwatch: AppColor.primary),
 */
        home: Location_Page(),
      );
}

class Location_Page extends StatefulWidget {
  @override
  _Location createState() => _Location();
}

class _Location extends State<Location_Page> {
  final TextEditingController userLocation = TextEditingController();
  final TextEditingController okokok = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController zipcode = TextEditingController();
  final TextEditingController street = TextEditingController();
  final TextEditingController apartment = TextEditingController();
  //String locationFull = '';
  void loc(String userId, location) async {
    try {
      Response response = await post(
          Uri.parse(
              'https://en2gomas.com/api.tumble/controller/ticketController.php?op=Insert'),
          body: {'userId': userId, 'location': location});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());

        print(data);
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  final items = ['New York', 'Connecticut'];
  String? value;

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
        ),
        body: ListView(children: [
          Material(
            color: Colors.white,
            child: Column(
              children: <Widget>[
                Image.asset(
                  'assets/images/loc.png',
                  height: 110,
                ),
                Center(
                  child: Text(
                    "Hi " +
                        '$obtainedName' +
                        "! now set the location of the service",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColor.primary),
                    textAlign: TextAlign.center,
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.0, vertical: 20.0),
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
                                height: 0,
                              ),
                              SizedBox(
                                height: 3.7,
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 20),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 1),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border:
                                      Border.all(color: Colors.white, width: 4),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    hint: Container(
                                      width: 150, //and here

                                      child: Text(
                                        "Select State",
                                        style: TextStyle(
                                            color: Colors.grey[700],
                                            fontSize: 16),
                                      ),
                                    ),
                                    value: value,
                                    iconSize: 36,
                                    icon: Icon(Icons.arrow_drop_down,
                                        color: Colors.black),
                                    isExpanded: true,
                                    items: items.map(buildMenuItem).toList(),
                                    onChanged: (value) =>
                                        setState(() => this.value = value!),
                                  ),
                                ),
                              ),
                              /*  SizedBox(
                                height: 0,
                              ),
                                SizedBox(
                                height: 0,
                              ),
                              SizedBox(
                                height: 3.7,
                              ),
                              Container(
                                child: CustomTextField(
                                  controller: Street,
                                    title: '', hint: 'Street Adress'),
                              ), */
                              SizedBox(
                                height: 0,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                    children: [
                                      SizedBox(
                                        height: 3.7,
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(top: 16),
                                          padding: EdgeInsets.all(1.0),
                                          child: TextField(
                                            controller: street,
                                            cursorColor: AppColor.primary,
                                            decoration: InputDecoration(
                                                hintText: 'Street Adress',
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                    width: 0,
                                                    style: BorderStyle.none,
                                                  ),
                                                ),
                                                fillColor: Colors.white,
                                                filled: true),
                                          )),
                                    ],
                                  )),
                                  VerticalDivider(),
                                  Expanded(
                                      child: Column(
                                    children: [
                                      SizedBox(
                                        height: 3.7,
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(top: 16),
                                          padding: EdgeInsets.all(1.0),
                                          child: TextField(
                                            controller: apartment,
                                            cursorColor: AppColor.primary,
                                            decoration: InputDecoration(
                                                hintText: 'Apartment #',
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                    width: 0,
                                                    style: BorderStyle.none,
                                                  ),
                                                ),
                                                fillColor: Colors.white,
                                                filled: true),
                                          )),
                                    ],
                                  ))
                                ],
                              ),
                              SizedBox(
                                height: 0,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                    children: [
                                      SizedBox(
                                        height: 3.7,
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(top: 16),
                                          padding: EdgeInsets.all(1.0),
                                          child: TextField(
                                            controller: city,
                                            cursorColor: AppColor.primary,
                                            decoration: InputDecoration(
                                                hintText: 'City',
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  borderSide: BorderSide(
                                                    width: 0,
                                                    style: BorderStyle.none,
                                                  ),
                                                ),
                                                fillColor: Colors.white,
                                                filled: true),
                                          )),
                                    ],
                                  )),
                                  VerticalDivider(),
                                  Expanded(
                                      child: Column(
                                    children: [
                                      SizedBox(
                                        height: 3.7,
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 16),
                                        padding: EdgeInsets.all(1.0),
                                        child: TextField(
                                          controller: zipcode,
                                          cursorColor: AppColor.primary,
                                          decoration: InputDecoration(
                                              hintText: 'ZipCode',
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                borderSide: BorderSide(
                                                  width: 0,
                                                  style: BorderStyle.none,
                                                ),
                                              ),
                                              fillColor: Colors.white,
                                              filled: true),
                                        ),
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              SizedBox(
                                height: 16,
                              ),
                              SizedBox(
                                height: 0,
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
          Container(
            margin: EdgeInsets.only(left: 24, right: 24),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            padding: const EdgeInsets.only(top: 40),
            child: TextButton(
              onPressed: () {
                locationFull = zipcode.text.toString() +
                    " " +
                    value.toString() +
                    ", " +
                    (city.text.toString() +
                        " " +
                        street.text.toString() +
                        " " +
                        apartment.text.toString());
                print(locationFull);

                //loc('$userId', locationFull);
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Description(),
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
        ]),
      );

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
      );
}
