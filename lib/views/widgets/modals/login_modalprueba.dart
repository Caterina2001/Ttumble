import 'dart:convert';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttumble/main.dart';
import 'package:ttumble/views/screens/home_page.dart';
import 'package:ttumble/views/screens/location_page.dart';
import 'package:ttumble/views/utils/variables.dart';
import 'package:ttumble/views/widgets/splash.dart';
import '../../../services/login_service.dart';
import '../../screens/location.dart';
import '../../utils/AppColor.dart';
import '../custom_text_field.dart';

void main() {
  runApp(const LoginModall());
}

class LoginModall extends StatefulWidget {
  const LoginModall({key});

  @override
  State<LoginModall> createState() {
    return LoginModal();
  }
}

class LoginModal extends State<LoginModall> {
  /* late LogIn logIn;

  @override
  void initState() {
    super.initState();
    logIn = new LogIn(pass: '', user: '');
  } */
  //static String okok = '';
  late String okokok;
  var dat;
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  void login(String user, pass) async {
    try {
      Response response = await post(
          Uri.parse(
              'https://en2gomas.com/api.tumble/controller/usuarioController.php?op=login'),
          body: {'user': user, 'pass': pass});

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        /* print(data);

        print(data[0]['usu_id']);  */ //
        if (data == 'No encontrado') {
          print('Usuario no encontrado, intente de nuevo');
          _showMyDialog();
        } else {
          print(data);

          print(data[0]['usu_id']);
          //okok = (data[0]['usu_id']);
          userId = (data[0]['usu_id']);
          userName = (data[0]['usu_nombre']);
          print(userName);
          dat = userName.toString();
          // ignore: unused_local_variable

          /*  Navigator.push(context,
              MaterialPageRoute(builder: (context) => Location_Page())); */
        }
        //print('Login successfully');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<LogIn>? _futureLogIn;
  final formKey = GlobalKey<FormState>();

  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 85 / 100,
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 32, top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              physics: BouncingScrollPhysics(),
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: MediaQuery.of(context).size.width * 35 / 100,
                    margin: EdgeInsets.only(bottom: 20),
                    height: 6,
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                // header
                Container(
                  margin: EdgeInsets.only(bottom: 24),
                  child: Text(
                    'Log In',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'inter'),
                  ),
                ),
                (_futureLogIn == null) ? buildColumn() : buildFutureBuilder(),

                // Log in Button

                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                  ),
                  child: RichText(
                    text: TextSpan(
                      text: 'Do you forget your password? ',
                      style: TextStyle(color: Colors.grey),
                      children: [
                        TextSpan(
                            style: TextStyle(
                              color: AppColor.primary,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'inter',
                            ),
                            text: 'Push here')
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextFormField(
          controller: userController,
          decoration: InputDecoration(
              hintText: 'Enter email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),

              /* InputBorder.none, */
              fillColor: Colors.grey[200],
              filled: true),
        ),
        Padding(padding: EdgeInsets.only(bottom: 20)),
        TextFormField(
          //onSaved: (input) => logIn.pass = input!,
          obscureText: true,
          controller: passController,
          decoration: InputDecoration(
              hintText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),

              /* InputBorder.none, */
              fillColor: Colors.grey[200],
              filled: true),
        ),
        Padding(padding: EdgeInsets.only(bottom: 20)),
        Container(
          margin: EdgeInsets.only(top: 32, bottom: 6),
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: ElevatedButton(
            onPressed: () async {
              //le agregue el async aqui, ver si login bien igual
              login(userController.text.toString(),
                  passController.text.toString());

              final SharedPreferences sharedPreferences =
                  await SharedPreferences.getInstance();
              sharedPreferences.setString('usu_correo', userController.text);
              //sharedPreferences.setString('usu_nombre', dat.toString());
              //sharedPreferences.setString('usu_id', userId);

              Get.to(MainPage());
            },
            child: const Text('Log In Now',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'inter')),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              primary: AppColor.primary,
            ),
          ),
        ),
        Text('data')
      ],
    );
  }

  FutureBuilder<LogIn> buildFutureBuilder() {
    return FutureBuilder<LogIn>(
      future: _futureLogIn,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.user);
          // ignore: dead_code
          Text(snapshot.data!.pass);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }

  bool validateAndSave() {
    final wrap = globalFormKey.currentState;
    if (wrap!.validate()) {
      wrap.save();
      return true;
    }
    return false;
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Please Try Again'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Email or Password incorrect'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text(
                'Approve',
                style: TextStyle(color: Colors.orange),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
