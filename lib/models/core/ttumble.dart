// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../../services/remote_service.dart';
import '../../views/screens/auth/login_page.dart';
import '../Services.dart';
import '../SpecialServices.dart';

class MyPruebaa extends StatefulWidget {
  const MyPruebaa({Key? key}) : super(key: key);

  @override
  State<MyPruebaa> createState() => _MyPruebaaState();
}

class _MyPruebaaState extends State<MyPruebaa> {
  List<Services>? services;

  List<SpecialServices>? specialservices;

  var isLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    getData2();
  }

  getData() async {
    services = await RemoteService().getServices();
    if (services != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  getData2() async {
    specialservices = await RemoteSpecialService().getSpecialServices();
    if (specialservices != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('prueba de api')),
      body: Visibility(
        visible: isLoaded,
        child: Center(
          child: Column(
            children: [
              GridView.builder(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                shrinkWrap: true,
                itemCount: services?.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 0,
                  crossAxisSpacing: 10,
                ),
                //itemCount: services?.length,
                itemBuilder: (context, index) {
                  return Container(
                      child: Column(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                          },
                          child: Column(
                            children: [
                              Image.network(services![index].seImagen),
                              Text(
                                services![index].seNombre,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                    ],
                  ));
                  // ignore: dead_code
                },

                ////////////
              ),
              Text('okk'),
              GridView.builder(
                padding: const EdgeInsets.only(left: 8, right: 8),
                shrinkWrap: true,
                itemCount: 2,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 10,
                    childAspectRatio: (4 / 2.5)),
                //itemCount: services?.length,
                itemBuilder: (context, index) {
                  return Container(
                      child: Column(
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                          },
                          child: Column(
                            children: [
                              Image.network(specialservices![index].seImagen),
                              Text(
                                specialservices![index].seNombre,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                            ],
                          )),
                    ],
                  ));
                  // ignore: dead_code
                },
              ),
              Text('okkkk oh')
            ],
          ),
        ),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

/* import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> fetchAlbum() async {
  final response = await http.get(Uri.parse(
      'http://en2gomas.com/api.tumble/controller/serviceController.php?op=AllService'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  final int seId;
  final String seNombre;
  final String seDesp;
  final String seImagen;

  const Album({
    required this.seId,
    required this.seNombre,
    required this.seDesp,
    required this.seImagen,
  });


  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      seId: json['se_id'],
      seNombre: json['se_nombre'],
      seDesp: json['se_desp'],
      seImagen: json['se_imagen'],
    );
  }
}

void main() => runApp(const MyPrueba());

class MyPrueba extends StatefulWidget {
  const MyPrueba({key});

  @override
  State<MyPrueba> createState() => _MyPruebaState();
}

class _MyPruebaState extends State<MyPrueba> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return (Text('${snapshot.data!.seNombre}'));
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
 */
