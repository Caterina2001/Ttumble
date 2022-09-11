import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:ttumble/views/screens/home_page.dart';
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

  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();
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
                // Form
                /* CustomTextField(
                title: 'E-Mail',
                hint: 'yourmail@mail.com',
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.all(10.0),
              ),
              CustomTextField(
                title: 'Password',
                hint: '**********',
                obsecureText: true,
                margin: EdgeInsets.only(top: 16),
                padding: EdgeInsets.all(10.0),
              ), */
                // Log in Button

                Container(
                  margin: EdgeInsets.only(top: 32, bottom: 6),
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => Location()));
                    },
                    child: Text('Log In Now',
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
          //onSaved: (input) => logIn.user = input!,
          /* validator: (email) => email != null && !EmailValidator.validate(email)
              ? 'Enter a valid email'
              : null, */
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
          /* validator: (value) {
            if (value != null) {
              return 'Password is required';
            } else {
              return null;
            }
          }, */
        ),
        Padding(padding: EdgeInsets.only(bottom: 20)),
        Container(
          margin: EdgeInsets.only(top: 32, bottom: 6),
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: ElevatedButton(
            onPressed: () {
              /*  final wrap = globalFormKey.currentState;
              if (wrap!.validate()) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage()));
                wrap.save();
                return print(logIn.toJson());
              } */

              /* return false;
              if (validateAndSave()) {
                print(logIn.toJson());
              } */
              final isValidForm = formKey.currentState!.validate();
              if (isValidForm) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => HomePage()));
                setState(() {
                  //usu = fullnameController.text;
                  // ignore: unnecessary_cast
                  _futureLogIn = createLogIn(
                    userController.text,
                    passController.text,
                  );
                });
              }
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
}
