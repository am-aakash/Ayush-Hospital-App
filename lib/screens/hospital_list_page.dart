// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables, avoid_print, unnecessary_new,unused_local_variable
import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:sih22/components/colors.dart';
import 'package:sih22/components/size_config.dart';
import 'package:sih22/models/hospital.dart';
import 'package:sih22/models/hospital_data.dart';
import 'package:sih22/screens/drawer.dart';
import 'package:sih22/screens/hospital_details/hospital_details_page.dart';
import 'package:sih22/screens/notification_page.dart';
import 'package:sih22/screens/search_result.dart';
import 'package:sih22/screens/yoga/yoga_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class HospitalListPage extends StatefulWidget {
  const HospitalListPage({Key? key}) : super(key: key);

  @override
  State<HospitalListPage> createState() => _HospitalListPageState();
}

class _HospitalListPageState extends State<HospitalListPage> {
  int stateValue = 0, typeValue = 0, publicValue = 0;
  bool isHindi = false;
  String search = "";
  TextEditingController userInput = TextEditingController();
  String text = "";
  var public = [
    'Show All',
    'Public',
    'Private',
  ];
  var type = [
    'All Types',
    'Ayurveda',
    'Yoga',
    'Homeopathy',
    'Unani',
    'Siddha',
  ];
  var states = [
    'All States',
    'Andaman & Nicobar Island',
    'Andhra Pradesh',
    'Assam',
    'Bihar',
    'Chandigarh',
    'Dadra & Nagar Haveli ',
    'Delhi',
    'Goa, Daman & Diu ',
    'Gujarat',
    'Haryana',
    'Himachal Pradesh',
    'Jammu & Kashmir',
    'Kerala',
    'Lakshadweep',
    'Mizoram',
    'Madhya Pradesh',
    'Maharashtra',
    'Manipur',
    'Meghalaya',
    'Karnataka (Mysore)',
    'Nagaland',
    'Orissa',
    'Pondicherry',
    'Punjab',
    'Rajasthan',
    'Tamil Nadu',
    'Tripura',
    'Uttar Pradesh',
    'West Bengal',
    'Sikkim',
    'Mizoram'
  ];
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: SafeArea(
        child: Container(
          width: SizeConfig.screenWidth * 0.8,
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                Container(
                  height: SizeConfig.blockHeight * 12,
                  // width: SizeConfig.blockWidth * 30,
                  margin: EdgeInsets.only(
                    top: SizeConfig.blockHeight * 4,
                    left: SizeConfig.blockWidth * 15,
                    right: SizeConfig.blockWidth * 15,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      scale: 0.5,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/text.png'),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: SizeConfig.blockHeight * 1,
                    // left: SizeConfig.blockWidth * 5,
                  ),
                  height: SizeConfig.blockHeight * 5.2,
                  width: SizeConfig.blockWidth * 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: SizeConfig.blockWidth * 54,
                        // height: SizeConfig.blockHeight * 6,
                        child: TextFormField(
                          controller: userInput,
                          style: TextStyle(
                            color: Colors.black,
                            // fontFamily: 'Rubik',
                            fontSize: SizeConfig.blockWidth * 3.6,
                            fontWeight: FontWeight.w300,
                          ),
                          onChanged: (value) {
                            setState(() {
                              search = value;
                            });
                          },
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                  // color: COLORS.black,
                                  ),
                            ),
                            enabledBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                              borderSide: BorderSide(
                                  // color: COLORS.black,
                                  ),
                            ),
                            hintText: "Search by Symptoms",
                            hintStyle: TextStyle(
                              color: Colors.grey[400],
                              height: 0,
                              fontFamily: 'Rubik',
                              fontSize: SizeConfig.blockWidth * 3.6,
                              fontWeight: FontWeight.w400,
                            ),
                            contentPadding: EdgeInsets.only(
                              left: SizeConfig.blockWidth * 4,
                              top: SizeConfig.blockHeight * 1.8,
                              bottom: SizeConfig.blockHeight * 1.5,
                              right: SizeConfig.blockWidth * 2,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  SearchResults(search: search),
                            ),
                          );
                        },
                        child: Container(
                          height: SizeConfig.blockHeight * 5.2,
                          width: SizeConfig.blockHeight * 5.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            // border: Border.all(color: COLORS.black),
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.black12,
                                blurRadius: 3.0,
                              ),
                            ],
                          ),
                          child: Icon(Icons.search),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: SizeConfig.blockHeight * 58,
                  child: Column(
                    children: [
                      _listTile(
                        icon: Icons.dashboard,
                        title: 'Dashboard',
                        onPressed: () {},
                      ),
                      _listTile(
                        icon: Icons.notifications,
                        title: 'News and Articles',
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    NotificationPage()),
                          );
                        },
                      ),
                      _listTile(
                        icon: Icons.category_rounded,
                        title: 'Yoga',
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    YogaScreen()),
                          );
                        },
                      ),
                      _listTile(
                        icon: AntIcons.medicineBoxFilled,
                        title: 'Home Remedies',
                        onPressed: () {
                          // Navigator.pushNamed(context, '/SearchHistoryScreen');
                        },
                      ),

                      // _listTile(
                      //   icon: Icons.bed_sharp,
                      //   title: 'Bookings',
                      //   onPressed: () {},
                      // ),
                      // _listTile(
                      //   icon: Icons.school_rounded,
                      //   title: 'Education & Labs',
                      //   onPressed: () {},
                      // ),
                      // _listTile(
                      //   icon: Icons.reviews_rounded,
                      //   title: 'Reviews',
                      //   onPressed: () {},
                      // ),
                      // _listTile(
                      //   icon: Icons.add_call,
                      //   title: 'Ayush Telemedicinies',
                      //   onPressed: () {},
                      // ),
                      _listTile(
                        icon: Icons.question_answer_rounded,
                        title: 'FAQs',
                        onPressed: () {},
                      ),
                      _listTile(
                        icon: Icons.feedback,
                        title: 'Feedback',
                        onPressed: () {},
                      ),
                      _listTile(
                        icon: Icons.info_outline_rounded,
                        title: 'About us',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    margin: EdgeInsets.only(
                      top: SizeConfig.blockHeight * 6,
                      left: SizeConfig.blockWidth * 10,
                      right: SizeConfig.blockWidth * 10,
                    ),
                    height: SizeConfig.blockHeight * 5,
                    // width: SizeConfig.blockWidth * ,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      // border: Border.all(color: COLORS.primaryCol),
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.black12,
                          blurRadius: 3.0,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            // isHindi = !isHindi;
                          },
                          child: Container(
                            child: Text(
                              '   English',
                              style: TextStyle(
                                fontSize: SizeConfig.blockWidth * 3.6,
                                fontFamily: 'Poppins',
                                color: (!isHindi)
                                    ? Colors.amber[600]
                                    : Colors.black54,
                                fontWeight: (!isHindi)
                                    ? FontWeight.w600
                                    : FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: SizeConfig.blockHeight * 3,
                          width: 1.5,
                          color: Colors.black26,
                        ),
                        InkWell(
                          onTap: () {
                            isHindi = !isHindi;
                          },
                          child: Container(
                            child: Text(
                              '  हिन्दी     ',
                              style: TextStyle(
                                fontSize: SizeConfig.blockWidth * 3.6,
                                fontFamily: 'Poppins',
                                color: (isHindi)
                                    ? Colors.amber[600]
                                    : Colors.black54,
                                fontWeight: (isHindi)
                                    ? FontWeight.w600
                                    : FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          // color: Colors.red,
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(
                  top: SizeConfig.blockHeight * 19,
                  bottom: SizeConfig.blockHeight * 1,
                  left: SizeConfig.blockWidth * 4,
                  right: SizeConfig.blockWidth * 4,
                ),
                // color: Colors.red,
                child: ListView.builder(
                  itemCount: hospitals.length,
                  itemBuilder: (context, index) {
                    if ((stateValue == 0 ||
                            stateValue == hospitals[index].state) &&
                        (typeValue == 0 ||
                            typeValue == hospitals[index].type) &&
                        (publicValue == 0 ||
                            publicValue == hospitals[index].public)) {
                      return _hospitalBlock(
                          hospitals[index], index, hospitals.length, context);
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
              Positioned(
                bottom: 20,
                left: SizeConfig.blockWidth * 25,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/home_screen');
                  },
                  child: Container(
                    height: SizeConfig.blockHeight * 6,
                    width: SizeConfig.blockWidth * 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      // border: Border.all(color: COLORS.black),
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.black12,
                          blurRadius: 3.0,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'View on Map',
                        style: TextStyle(
                          fontSize: SizeConfig.blockWidth * 3.6,
                          fontFamily: 'Poppins',
                          color: COLORS.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: SizeConfig.blockHeight * 7,
                child: Container(
                  width: SizeConfig.blockWidth * 90,
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockWidth * 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          _scaffoldKey.currentState?.openDrawer();
                        },
                        child: Container(
                          height: SizeConfig.blockHeight * 5.2,
                          width: SizeConfig.blockHeight * 5.2,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            // border: Border.all(color: COLORS.black),
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.black12,
                                blurRadius: 3.0,
                              ),
                            ],
                          ),
                          child: Icon(AntIcons.menuOutlined),
                        ),
                      ),
                      Container(
                        height: SizeConfig.blockHeight * 4,
                        width: SizeConfig.blockWidth * 42,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          // border: Border.all(color: COLORS.black),
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.black12,
                              blurRadius: 3.0,
                            ),
                          ],
                        ),
                        child: Row(
                          children: <Widget>[
                            Text(
                              '    Perumbavoor, Kerala ',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: SizeConfig.blockWidth * 2.6,
                                color: Colors.amber[600],
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Icon(Icons.location_on),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: SizeConfig.blockHeight * 14,
                child: Container(
                  width: SizeConfig.blockWidth * 90,
                  margin: EdgeInsets.symmetric(
                      horizontal: SizeConfig.blockWidth * 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: SizeConfig.blockHeight * 5.2,
                        width: SizeConfig.blockWidth * 42,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          // border: Border.all(color: COLORS.black),
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.black12,
                              blurRadius: 3.0,
                            ),
                          ],
                        ),
                        child: Container(
                          margin: EdgeInsets.only(
                            // top: SizeConfig.blockHeight * 0.6,
                            // bottom: SizeConfig.blockHeight * 1,
                            left: SizeConfig.blockWidth * 2,
                            right: SizeConfig.blockWidth * 4,
                          ),
                          // decoration: BoxDecoration(
                          //   color: Colors.white,
                          //   borderRadius:
                          //       BorderRadius.all(Radius.circular(8)),
                          //   // border: Border.all(color: COLORS.black),
                          //   boxShadow: [
                          //     new BoxShadow(
                          //       color: Colors.black12,
                          //       blurRadius: 3.0,
                          //     ),
                          //   ],
                          // ),
                          child: DropdownButton(
                            // Initial Value
                            value: states[stateValue],
                            underline: Container(
                              height: 2,
                              color: Colors.white,
                            ),
                            // Down Arrow Icon
                            icon: Container(
                              margin: EdgeInsets.only(
                                top: SizeConfig.blockHeight * 0.7,
                                // bottom: SizeConfig.blockHeight * 1,
                                // left: SizeConfig.blockWidth * 9,
                                right: SizeConfig.blockWidth * 0,
                              ),
                              child: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 28,
                              ),
                            ),

                            // Array list of items
                            items: states.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Container(
                                  margin: EdgeInsets.only(
                                    top: SizeConfig.blockHeight * 0.7,
                                    // bottom: SizeConfig.blockHeight * 1,
                                    left: SizeConfig.blockWidth * 2,
                                    right: SizeConfig.blockWidth * 0,
                                  ),
                                  width: SizeConfig.blockWidth * 28,
                                  child: Text(
                                    items,
                                    // maxLines: 2,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: SizeConfig.blockWidth * 3.2,
                                      color: Colors.amber[600],
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              setState(() {
                                stateValue = states.indexOf(newValue!);
                              });
                            },
                          ),
                        ),
                      ),
                      Container(
                        height: SizeConfig.blockHeight * 5.2,
                        width: SizeConfig.blockWidth * 42,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          // border: Border.all(color: COLORS.black),
                          boxShadow: [
                            new BoxShadow(
                              color: Colors.black12,
                              blurRadius: 3.0,
                            ),
                          ],
                        ),
                        child: Container(
                          margin: EdgeInsets.only(
                            // top: SizeConfig.blockHeight * 0.6,
                            // bottom: SizeConfig.blockHeight * 1,
                            left: SizeConfig.blockWidth * 2,
                            right: SizeConfig.blockWidth * 4,
                          ),
                          // decoration: BoxDecoration(
                          //   color: Colors.white,
                          //   borderRadius:
                          //       BorderRadius.all(Radius.circular(8)),
                          //   // border: Border.all(color: COLORS.black),
                          //   boxShadow: [
                          //     new BoxShadow(
                          //       color: Colors.black12,
                          //       blurRadius: 3.0,
                          //     ),
                          //   ],
                          // ),
                          child: DropdownButton(
                            // Initial Value
                            value: type[typeValue],
                            underline: Container(
                              height: 2,
                              color: Colors.white,
                            ),
                            // Down Arrow Icon
                            icon: Container(
                              margin: EdgeInsets.only(
                                top: SizeConfig.blockHeight * 0.7,
                                // bottom: SizeConfig.blockHeight * 1,
                                // left: SizeConfig.blockWidth * 9,
                                right: SizeConfig.blockWidth * 0,
                              ),
                              child: const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 28,
                              ),
                            ),

                            // Array list of items
                            items: type.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Container(
                                  margin: EdgeInsets.only(
                                    top: SizeConfig.blockHeight * 0.7,
                                    // bottom: SizeConfig.blockHeight * 1,
                                    left: SizeConfig.blockWidth * 2,
                                    right: SizeConfig.blockWidth * 0,
                                  ),
                                  width: SizeConfig.blockWidth * 28,
                                  child: Text(
                                    items,
                                    // maxLines: 2,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: SizeConfig.blockWidth * 3.2,
                                      color: Colors.amber[600],
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              setState(() {
                                typeValue = type.indexOf(newValue!);
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _hospitalBlock(
    HospitalModel hospital, int index, int size, BuildContext context) {
  // BuildContext context;
  return Container(
    margin: EdgeInsets.only(
      right: SizeConfig.blockWidth * 1,
      left: SizeConfig.blockWidth * 1,
      // top: (index == 0) ? SizeConfig.blockHeight * 0 : 0,
      bottom: (index == size - 1)
          ? SizeConfig.blockHeight * 8
          : SizeConfig.blockHeight * 1.5,
    ),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(8)),
      // border: Border.all(color: COLORS.black),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 3.0,
        ),
      ],
    ),
    padding: EdgeInsets.only(
      left: SizeConfig.blockWidth * 3,
      right: SizeConfig.blockWidth * 3,
      top: SizeConfig.blockHeight * 1.5,
      bottom: SizeConfig.blockHeight * 1.2,
    ),
    child: Stack(
      children: <Widget>[
        if (hospital.phone != null)
          Positioned(
            bottom: 0,
            right: 0,
            child: InkWell(
              onTap: () async {
                // FlutterPhoneDirectCaller.callNumber(hospital.phone!);
                launch("tel:${hospital.phone}");
              },
              child: Container(
                height: SizeConfig.blockWidth * 8,
                width: SizeConfig.blockWidth * 8,
                decoration: BoxDecoration(
                  color: Colors.amber[600],
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  // border: Border.all(color: COLORS.black),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 3.0,
                    ),
                  ],
                ),
                child: Icon(
                  // Icons.call
                  CupertinoIcons.phone_fill,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        Expanded(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: SizeConfig.blockHeight * 18,
                width: SizeConfig.blockWidth * 86,
                margin: EdgeInsets.only(
                  // right: SizeConfig.blockWidth * 2,
                  // left: SizeConfig.blockWidth * 2,
                  bottom: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  // border: Border.all(color: COLORS.black),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.black12,
                  //     blurRadius: 3.0,
                  //   ),
                  // ],
                  image: DecorationImage(
                    image: NetworkImage(hospital.photos!.first),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (BuildContext context) => HospitalDetailsPage(
                      hospital: hospital,
                    ),
                  ));
                },
                child: Container(
                  // height: SizeConfig.blockHeight * 3.2,
                  child: Text(
                    "${hospital.name}",
                    maxLines: 2,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: SizeConfig.blockWidth * 4,
                      color: Colors.amber[600],
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 3, bottom: 6),
                // height: SizeConfig.blockHeight * 6.6,
                child: Text(
                  "${hospital.address}",
                  maxLines: 3,
                  style: TextStyle(
                    // fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: SizeConfig.blockWidth * 2.6,
                    color: Colors.grey[500],
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    "Hospital type: ",
                    style: TextStyle(
                      // fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.blockWidth * 2.4,
                      color: Colors.grey[800],
                    ),
                  ),
                  Text(
                    "${(hospital.type == 1) ? "Ayurveda" : (hospital.type == 2) ? "Yoga" : (hospital.type == 3) ? "Homeopathy" : (hospital.type == 4) ? "Unani" : "Siddha"}",
                    style: TextStyle(
                      // fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.blockWidth * 2.8,
                      color: Colors.amber[800],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "Hours: ",
                    style: TextStyle(
                      // fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.blockWidth * 2.4,
                      color: Colors.grey[800],
                    ),
                  ),
                  Text(
                    "${hospital.openHours}",
                    style: TextStyle(
                      // fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.blockWidth * 2.8,
                      color: Colors.amber[800],
                    ),
                  )
                ],
              ),
              if (hospital.phone != null)
                Row(
                  children: [
                    Text(
                      "Phone: ",
                      style: TextStyle(
                        // fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.blockWidth * 2.4,
                        color: Colors.grey[800],
                      ),
                    ),
                    Text(
                      "${hospital.phone}",
                      style: TextStyle(
                        // fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: SizeConfig.blockWidth * 2.8,
                        color: Colors.amber[800],
                      ),
                    )
                  ],
                ),
              Row(
                children: [
                  Text(
                    "Total Available beds: ",
                    style: TextStyle(
                      // fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.blockWidth * 2.4,
                      color: Colors.grey[800],
                    ),
                  ),
                  Text(
                    "${hospital.totalBeds}",
                    style: TextStyle(
                      // fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.blockWidth * 2.8,
                      color: Colors.amber[800],
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    "Current Available beds: ",
                    style: TextStyle(
                      // fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.blockWidth * 2.4,
                      color: Colors.grey[800],
                    ),
                  ),
                  Text(
                    "${hospital.currBeds}",
                    style: TextStyle(
                      // fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                      fontSize: SizeConfig.blockWidth * 2.8,
                      color: Colors.amber[800],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _listTile({IconData? icon, String? title, VoidCallback? onPressed}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      margin: EdgeInsets.symmetric(
        horizontal: SizeConfig.blockWidth * 5,
        vertical: SizeConfig.blockHeight * 1,
      ),
      child: Row(
        children: <Widget>[
          Container(
            height: SizeConfig.blockHeight * 3,
            width: SizeConfig.blockWidth * 6,
            child: Icon(icon),
          ),
          Text(
            '   $title',
            style: TextStyle(
              fontSize: SizeConfig.blockWidth * 4.2,
              fontFamily: 'Poppins',
              color: COLORS.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    ),
  );
}
