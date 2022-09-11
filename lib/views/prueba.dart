import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ttumble/views/screens/location.dart';
import 'package:ttumble/views/utils/AppColor.dart';
import 'package:image_picker/image_picker.dart';

import '../main.dart';

void prueba() {
  runApp(MyPrueba());
}

class MyPrueba extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Prueba(),
    );
  }
}

class Prueba extends StatefulWidget {
  @override
  State<Prueba> createState() => _PruebaState();
}

class _PruebaState extends State<Prueba> {
  late File _image;
  final imagePicker = ImagePicker();

  Future getImage() async {
    final image = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
    });
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
                fontFamily: 'Ang', fontWeight: FontWeight.w700, fontSize: 30)),
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
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => /* DeliciousTodayPage */ MainPage(),
              ));
            },
          ),
          // add more IconButton
        ],
      ),
      body: Center(
        child: _image == null ? Text("Not image selected") : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        backgroundColor: AppColor.primary,
        child: Icon(Icons.camera_alt_sharp),
      ),
    );
  }
}
