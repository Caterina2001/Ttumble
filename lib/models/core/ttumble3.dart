// ignore_for_file: dead_code, unused_element

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ttumble/views/screens/home_page.dart';

Future<Album> createAlbum(String fullname, String email) async {
  final response = await http.post(
    Uri.parse(
        'http://en2gomas.com/api.tumble/controller/usuarioController.php?op=Register'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'fullname': fullname,
      'email': email,
    }),
  );
  /* var json = response.body;
  return AlbumToJson(jsonDecode(json)); */

  // ignore: non_constant_identifier_names

  //return Album.fromJson(jsonDecode(response.body));
  //HomePage();
  //return Album.fromJson(jsonDecode(response.body));
  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    //throw Exception('Failed to create album.');
    return Album.fromJson(jsonDecode(response.body));
    HomePage();
  }
}

List<Album> AlbumFromJson(String str) =>
    List<Album>.from(json.decode(str).map((x) => Album.fromJson(x)));

// ignore: non_constant_identifier_names
String AlbumToJson(List<Album> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Album {
  final String fullname;
  final String email;
  /* final String email;
  final String fullname;
  final String password; */

  const Album({
    required this.fullname,
    required this.email,
  });

  /* factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        /* id: json['id'], */
        fullname: json['fullname'],
        email: json['email']);
  } */

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        fullname: json["full_name"],
        email: json["e_mail"],
      );

  Map<String, dynamic> toJson() => {
        "full_name": fullname,
        "e_mail": email,
      };
}

void main() {
  runApp(const MyApppp());
}

class MyApppp extends StatefulWidget {
  const MyApppp({key});

  @override
  State<MyApppp> createState() {
    return _MyApppState();
  }
}

class _MyApppState extends State<MyApppp> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controllerr = TextEditingController();
  Future<Album>? _futureAlbum;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Create Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Create Data Example'),
        ),
        body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8.0),
          child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
        ),
      ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: _controller,
          decoration: const InputDecoration(hintText: 'Enter fullname'),
        ),
        TextField(
          controller: _controllerr,
          decoration: const InputDecoration(hintText: 'Enter email'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HomePage()));
            setState(() {
              // ignore: unnecessary_cast
              _futureAlbum = createAlbum(_controller.text, _controllerr.text);
            });
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }

  FutureBuilder<Album> buildFutureBuilder() {
    return FutureBuilder<Album>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.fullname);
          // ignore: dead_code
          Text(snapshot.data!.email);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
