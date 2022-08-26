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
import 'package:url_launcher/url_launcher.dart';

class HospitalListPage extends StatefulWidget {
  const HospitalListPage({Key? key}) : super(key: key);

  @override
  State<HospitalListPage> createState() => _HospitalListPageState();
}

class _HospitalListPageState extends State<HospitalListPage> {
  int stateValue = 0, typeValue = 0, publicValue = 0;
  var public = [
    'Show All',
    'Public',
    'Private',
  ];
  var type = [
    'All Hospital Types',
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
      drawer: drawerHelper(context),
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
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: SizeConfig.blockHeight * 5.2,
                          width: SizeConfig.blockWidth * 74,
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
                                    width: SizeConfig.blockWidth * 60.1,
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
                        width: SizeConfig.blockWidth * 28,
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
                            value: public[publicValue],
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
                                size: 20,
                              ),
                            ),

                            // Array list of items
                            items: public.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Container(
                                  margin: EdgeInsets.only(
                                    top: SizeConfig.blockHeight * 0.7,
                                    // bottom: SizeConfig.blockHeight * 1,
                                    left: SizeConfig.blockWidth * 2,
                                    right: SizeConfig.blockWidth * 0,
                                  ),
                                  width: SizeConfig.blockWidth * 16,
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
                                publicValue = public.indexOf(newValue!);
                              });
                            },
                          ),
                        ),
                      ),
                      Container(
                        height: SizeConfig.blockHeight * 5.2,
                        width: SizeConfig.blockWidth * 60,
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
                                  width: SizeConfig.blockWidth * 46,
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
