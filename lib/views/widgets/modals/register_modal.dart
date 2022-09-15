import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ttumble/views/prueba.dart';

import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ttumble/views/screens/cards_page.dart';

import '../../../models/INFO.dart';
import '../../../models/core/ttumble2.dart';
import '../../../services/data_signup.dart';
import '../../../services/signup_service.dart';
import '../../../services/signupservice.dart';
import '../../screens/location.dart';
import '../../utils/AppColor.dart';
import '../custom_text_field.dart';
import 'login_modal.dart';

void main() {
  runApp(const RegisterModal());
}

class RegisterModal extends StatefulWidget {
  const RegisterModal({key});

  @override
  State<RegisterModal> createState() {
    return MyRegisterModal();
  }
}

// ignore: must_be_immutable
class MyRegisterModal extends State<RegisterModal> {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<SignUp>? _futureAlbum;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Wrap(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 85 / 100,
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 32, top: 16),
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          //child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
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
                      color: Colors.blue[300],
                      borderRadius: BorderRadius.circular(20)),
                ),
              ),
              // header
              Container(
                margin: EdgeInsets.only(bottom: 24),
                child: Text(
                  'Sign In',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'inter'),
                ),
              ),
              // Form
              (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),

              // Login textbutton
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    isScrollControlled: true,
                    builder: (context) {
                      return LoginModal();
                    },
                  );
                },
                style: TextButton.styleFrom(
                  primary: Colors.white,
                ),
                child: RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                          style: TextStyle(
                            color: AppColor.primary,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'inter',
                          ),
                          text: 'Log In')
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    ));
    /*  Future<void> _registration() async {
      String number = numberController.text.trim();
      String email = emailController.text.trim();
      String fullname = fullnameController.text.trim();
      String password = passwordController.text.trim();
      SignUp signUp = SignUp(
          number: number, email: email, fullname: fullname, password: password);

      var provider = Provider.of<DataClass>(context, listen: false);
      await provider.postData(signUp);
      if (provider.isBack) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Location()),
        );
      }
    } */

    /*  return Wrap(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 85 / 100,
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 32, top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20))),
          child: (_futureAlbum == null) ? buildColumn() : buildFutureBuilder(),
          /* child: ListView(
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
                  'Sign In',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'inter'),
                ),
              ),
              // Form
              IntlPhoneField(
                decoration: InputDecoration(
                  hoverColor: AppColor.primary,
                  iconColor: AppColor.primary,
                  focusColor: AppColor.primary,
                  fillColor: AppColor.primary,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'US',
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),
              CustomTextField(
                  controller: emailController,
                  title: 'E-Mail',
                  hint: 'yourmail@mail.com',
                  margin: EdgeInsets.only(top: 16),
                  padding: EdgeInsets.all(10.0)),
              CustomTextField(
                  controller: fullnameController,
                  title: 'Full Name',
                  hint: 'Your full name',
                  margin: EdgeInsets.only(top: 16),
                  padding: EdgeInsets.all(10.0)),
              CustomTextField(
                  controller: passwordController,
                  title: 'Password',
                  hint: '**********',
                  margin: EdgeInsets.only(top: 16),
                  padding: EdgeInsets.all(10.0)),
              CustomTextField(
                  controller: passwordController,
                  title: 'Repeat your Password',
                  hint: '**********',
                  obsecureText: true,
                  margin: EdgeInsets.only(top: 16),
                  padding: EdgeInsets.all(10.0)),

              // Register Button
              /* Builder(
                builder: (BuildContext newContext) {
                  return RaisedButton(
                      child: Text('test1'),
                      onPressed: () {
                        // ignore: unnecessary_statements
                        newContext.read<DataClass>().postData;
                      });
                },
              ),

              Builder(
                builder: (BuildContext newContext) {
                  return RaisedButton(
                      child: Text('test2'),
                      onPressed: () {
                        // ignore: unnecessary_statements
                        _registration();
                      });
                },
              ), */
              Container(
                margin: EdgeInsets.only(top: 32, bottom: 6),
                width: MediaQuery.of(context).size.width,
                height: 60,
                /* child: GestureDetector(onTap: _registration), */
                /* child: GestureDetector(
                    onTap: () {
                      _registration();
                    },
                  ) */

                child: ElevatedButton(
                  onPressed: () {
                    /* _registration(); */
                    /* Navigator.of(context).pop();
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => /* PageSwitcher */ Location())) */
                  },
                  child: Text('Sign In Now',
                      style: TextStyle(
                          color: AppColor.secondary,
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
              // Login textbutton
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    isScrollControlled: true,
                    builder: (context) {
                      return LoginModal();
                    },
                  );
                },
                style: TextButton.styleFrom(
                  primary: Colors.white,
                ),
                child: RichText(
                  text: TextSpan(
                    text: 'Already have an account? ',
                    style: TextStyle(color: Colors.grey),
                    children: [
                      TextSpan(
                          style: TextStyle(
                            color: AppColor.primary,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'inter',
                          ),
                          text: 'Log In')
                    ],
                  ),
                ),
              ),
            ],
          ), */
        )
      ],
    ); */
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        /*  TextField(
          controller: fullnameController,
          decoration: const InputDecoration(hintText: 'Enter Title'),
        ), */
        CustomTextField(
            controller: emailController,
            title: 'E-Mail',
            hint: 'yourmail@mail.com',
            margin: EdgeInsets.only(top: 16),
            padding: EdgeInsets.all(10.0)),
        CustomTextField(
            controller: fullnameController,
            title: 'Full Name',
            hint: 'Your full name',
            margin: EdgeInsets.only(top: 16),
            padding: EdgeInsets.all(10.0)),
        CustomTextField(
            controller: passwordController,
            title: 'Password',
            hint: '**********',
            margin: EdgeInsets.only(top: 16),
            padding: EdgeInsets.all(10.0)),
        CustomTextField(
            controller: passwordController,
            title: 'Repeat your Password',
            hint: '**********',
            obsecureText: true,
            margin: EdgeInsets.only(top: 16),
            padding: EdgeInsets.all(10.0)),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _futureAlbum = createSignUp(
                  fullnameController.text,
                  emailController.text,
                  emailController.text,
                  numberController.text);
            });
          },
          child: const Text('Create Data'),
        ),
      ],
    );
  }

  FutureBuilder<SignUp> buildFutureBuilder() {
    return FutureBuilder<SignUp>(
      future: _futureAlbum,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          //return Text(snapshot.data!.fullname);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
