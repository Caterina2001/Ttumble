import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:ttumble/models/core/ttumble2.dart';

import '../../../models/INFO.dart';
import '../../../models/RegisterService.dart';
import '../../../services/signup_service.dart';
import '../../../services/signupservice.dart';
import '../../screens/home_page.dart';
import '../../screens/location.dart';
import '../../utils/AppColor.dart';
import '../custom_text_field.dart';
import 'login_modal.dart';

void main() {
  runApp(const RegisterModall());
}

class RegisterModall extends StatefulWidget {
  const RegisterModall({key});

  @override
  State<RegisterModall> createState() {
    return MyRegisterModall();
  }
}

// ignore: must_be_immutable
class MyRegisterModall extends State<RegisterModall> {
  final TextEditingController numberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confpasswordController = TextEditingController();
  Future<SignUp /* RegisterServices */ >? _futureSignUp;
  final formKey = GlobalKey<FormState>();
  String usu = "";

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
                    'Sign In',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'inter'),
                  ),
                ),
                // Form
                (_futureSignUp == null) ? buildColumn() : buildFutureBuilder(),

                // Login textbutton
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.black,
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
          ),
        )
      ],
    );
  }

  String _password = '';
  String _repeatPassword = '';

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextFormField(
          controller: numberController,
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
              isDense: true,
              hintText: 'Enter Number',
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
          controller: fullnameController,
          decoration: InputDecoration(
              isDense: true,
              hintText: 'Enter Full Name',
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
          controller: emailController,
          validator: (email) => email != null && !EmailValidator.validate(email)
              ? 'Enter a valid email'
              : null,
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
          obscureText: true,
          controller: passwordController,
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
          validator: (value) {
            if (value != null && value.length < 7) {
              return 'Enter min 7 caracter';
            } else {
              return null;
            }
          },
        ),
        Padding(padding: EdgeInsets.only(bottom: 20)),
        TextFormField(
          // ignore: non_constant_identifier_names
          validator: (PassCurrentValue) {
            RegExp regex = RegExp(
                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
            var passNonNullValue = PassCurrentValue ?? "";
            if (passNonNullValue.isEmpty) {
              return ("Password is required");
            } else if (passNonNullValue.length < 6) {
              return ("Password Must be more than 5 characters");
            }
            if (passNonNullValue != passwordController.text) {
              return ("Password not match");
            }

            return null;
          },
          obscureText: true,
          controller: confpasswordController,
          decoration: InputDecoration(
              hintText: 'Repeat Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              fillColor: Colors.grey[200],
              filled: true),
        ),
        Container(
          margin: EdgeInsets.only(top: 32, bottom: 6),
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: ElevatedButton(
            onPressed: () {
              final isValidForm = formKey.currentState!.validate();
              if (isValidForm) {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginModal()));
                setState(() {
                  usu = fullnameController.text;
                  // ignore: unnecessary_cast
                  _futureSignUp = createSignUp /* postServices */ (
                      numberController.text,
                      fullnameController.text,
                      emailController.text,
                      passwordController.text);
                });
              }
              /* Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomePage()));
              setState(() {
                // ignore: unnecessary_cast
                _futureSignUp = createSignUp(fullnameController.text,
                    emailController.text, passwordController.text);
              }); */
            },
            child: const Text('Sign In Now',
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
        )
      ],
    );
  }

  FutureBuilder<SignUp /* RegisterServices */ > buildFutureBuilder() {
    return FutureBuilder<SignUp /* RegisterServices */ >(
      future: _futureSignUp,
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
