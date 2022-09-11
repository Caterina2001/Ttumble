import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ttumble/views/prueba.dart';

import '../../models/Services.dart';
import '../../models/SpecialServices.dart';
import '../../models/core/ttumble.dart';
import '../../models/helper/recipe_helper.dart';
import '../../services/remote_service.dart';
import '../utils/AppColor.dart';
import '../widgets/modals/search_filter_modal.dart';
import 'auth/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  TextEditingController searchInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.home, size: 30),
      Icon(Icons.search, size: 30),
      Icon(Icons.person, size: 30),
    ];

    final number = '+13338978667';
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (20) / 2;
    final double itemWidth = 20 / 2;
    final double itemHeight2 = 10;
    final double itemWidth2 = 10;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        //brightness: Brightness.dark,
        backgroundColor: AppColor.primary,
        elevation: 0,
        centerTitle: true,
        title: Image.asset(
          'assets/images/barapp.png',
          fit: BoxFit.cover,
        ),

        //title:
        /* Text('TTumble',
            style: TextStyle(
                fontFamily: 'Ang', fontWeight: FontWeight.w700, fontSize: 30)),
        leading: IconButton(
          icon: Icon(Icons.star, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ), */
      ),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 120,
            color: AppColor.primary,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Bar
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 7,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Search TextField
                      Expanded(
                        child: Container(
                          height: 50,
                          margin: EdgeInsets.only(right: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.primarySoft),
                          child: TextField(
                            controller: searchInputController,
                            onChanged: (value) {
                              print(searchInputController.text);
                            },
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                            maxLines: 1,
                            textInputAction: TextInputAction.search,
                            decoration: InputDecoration(
                              hintText: 'What do you want to do?',
                              hintStyle: TextStyle(
                                  color: Colors.white.withOpacity(0.2)),
                              prefixIconConstraints:
                                  BoxConstraints(maxHeight: 20),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 17),
                              focusedBorder: InputBorder.none,
                              border: InputBorder.none,
                              prefixIcon: Visibility(
                                visible: (searchInputController.text.isEmpty)
                                    ? true
                                    : false,
                                child: Container(
                                  margin: EdgeInsets.only(left: 10, right: 12),
                                  child: SvgPicture.asset(
                                    'assets/icons/search.svg',
                                    width: 20,
                                    height: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Filter Button
                      GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20))),
                              builder: (context) {
                                return SearchFilterModal();
                              });
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.secondary,
                          ),
                          child: SvgPicture.asset('assets/icons/filter.svg'),
                        ),
                      )
                    ],
                  ),
                ),
                // Search Keyword Recommendation
                Container(
                  height: 40,
                  margin: EdgeInsets.only(top: 0),
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    itemCount: popularRecipeKeyword.length,
                    separatorBuilder: (context, index) {
                      return SizedBox(width: 8);
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        alignment: Alignment.topCenter,
                        child: TextButton(
                          onPressed: () {
                            searchInputController.text =
                                popularRecipeKeyword[index];
                          },
                          child: Text(
                            popularRecipeKeyword[index],
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.7),
                                fontWeight: FontWeight.w400),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                                color: Colors.white.withOpacity(0.15),
                                width: 1),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          Column(
            children: [
              GridView.builder(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                shrinkWrap: true,

                itemCount: services?.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
              GridView.builder(
                padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
                shrinkWrap: true,
                itemCount: specialservices?.length,
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
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),

          ///its ok heree
          ///
          ///

          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(255)),
                      padding:
                          const EdgeInsets.only(left: 10, top: 10, bottom: 30),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColor.primary),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                              side: BorderSide(color: AppColor.primary),
                            ))),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ));
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text('Request today',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 20)),
                            SizedBox(
                              width: 5,
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(255)),
                      padding:
                          const EdgeInsets.only(right: 10, top: 10, bottom: 30),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColor.primary),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18),
                              side: BorderSide(color: AppColor.primary),
                            ))),
                        onPressed: () async {
                          await FlutterPhoneDirectCaller.callNumber(number);
                          /* launch('tel://$number'); */
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(' Give a call',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 20)),

                            // <-- Text
                            SizedBox(
                              width: 5,
                              height: 50,
                            ),
                            Icon(
                              // <-- Icon
                              Icons.call,
                              size: 24.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      /* bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          iconTheme: IconThemeData(color: Colors.white),
        ),
        child: CurvedNavigationBar(
          key: navigationKey,
          color: Colors.blue,
          buttonBackgroundColor: Colors.red,
          backgroundColor: Colors.transparent,
          height: 60,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 1000),
          index: index,
          items: items,
          //onTap: (index) => setState(() => this.index = index),
        ),
      ), */
    );
  }
}
