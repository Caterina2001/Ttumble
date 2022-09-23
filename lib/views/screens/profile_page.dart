// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ttumble/main.dart';
import 'package:ttumble/views/screens/auth/login_page.dart';
import 'package:ttumble/views/screens/home_page.dart';
import '../utils/AppColor.dart';
import '../widgets/user_info_tile.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        brightness: Brightness.dark,
        backgroundColor: AppColor.primary,
        elevation: 0,
        title: Image.asset(
          'assets/images/barapp.png',
        ),
        /*  leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ), */
        /* actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Edit',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600),
            ),
            style: TextButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100))),
          ),
        ], */
      ),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          // Section 1 - Profile Picture Wrapper
          Container(
            color: AppColor.primary,
            padding: EdgeInsets.symmetric(vertical: 24),
            child: GestureDetector(
              onTap: () {
                print('Code to open file manager');
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 130,
                    height: 130,
                    margin: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(100),
                      // Profile Picture
                      image: DecorationImage(
                          image: AssetImage('assets/images/diana.jpg'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Change Profile Picture',
                          style: TextStyle(
                              fontFamily: 'inter',
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                      SizedBox(width: 8),
                      SvgPicture.asset('assets/icons/camera.svg',
                          color: Colors.white),
                    ],
                  )
                ],
              ),
            ),
          ),
          // Section 2 - User Info Wrapper
          Container(
            margin: EdgeInsets.only(top: 24),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UserInfoTile(
                  margin: EdgeInsets.only(bottom: 16),
                  label: 'Email',
                  value: 'caterinagiannecchini@gmail.com',
                ),
                UserInfoTile(
                  margin: EdgeInsets.only(bottom: 16),
                  label: 'Full Name',
                  value: 'Caterina Giannecchini',
                ),
                MaterialButton(
                  onPressed: () async {
                    final SharedPreferences sharedPreferences =
                        await SharedPreferences.getInstance();
                    //sharedPreferences.remove('user');
                    sharedPreferences.remove('usu_correo');
                    Get.to(MainPage());
                  },
                  child: const Text('Log Out',
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'inter')),
                  /* style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    primary: AppColor.primary,
                  ), */
                ),

                /* UserInfoTile(
                  margin: EdgeInsets.only(bottom: 16),
                  label: 'Subscription Time',
                  value: 'Until 16 Jul 2022',
                ), */
              ],
            ),
          )
        ],
      ),
    );
  }
}
