// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables, avoid_print, unnecessary_new,unused_local_variable
import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import 'package:sih22/components/colors.dart';
import 'package:sih22/components/size_config.dart';
import 'package:sih22/models/hospital.dart';
import 'package:sih22/models/hospital_data.dart';
import 'package:sih22/screens/drawer.dart';
import 'package:sih22/screens/hospital_details/hospital_details_page.dart';

class HospitalListPage extends StatefulWidget {
  const HospitalListPage({Key? key}) : super(key: key);

  @override
  State<HospitalListPage> createState() => _HospitalListPageState();
}

class _HospitalListPageState extends State<HospitalListPage> {
  String dropdownValue = 'Kerala';
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
                  top: SizeConfig.blockHeight * 5,
                  bottom: SizeConfig.blockHeight * 1,
                  left: SizeConfig.blockWidth * 4,
                  right: SizeConfig.blockWidth * 4,
                ),
                // color: Colors.red,
                child: ListView.builder(
                  itemCount: hospitals.length,
                  itemBuilder: (context, index) {
                    return _hospitalBlock(
                        hospitals[index], index, hospitals.length);
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: <Widget>[

                    //   ],
                    // );
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
                          child: DropdownButton<String>(
                            value: dropdownValue,
                            icon: Container(
                              margin: EdgeInsets.only(
                                top: SizeConfig.blockHeight * 0.6,
                                // bottom: SizeConfig.blockHeight * 1,
                                // left: SizeConfig.blockWidth * 4,
                                right: SizeConfig.blockWidth * 0,
                              ),
                              child:
                                  const Icon(Icons.keyboard_arrow_down_rounded),
                            ),
                            elevation: 10,
                            style: const TextStyle(color: Colors.deepPurple),
                            underline: Container(
                              height: 2,
                              color: Colors.white,
                            ),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownValue = newValue!;
                              });
                            },
                            items: <String>[
                              'Kerala',
                              'Madhya Pradesh',
                              'Maharashtra',
                              'Delhi',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Container(
                                  margin: EdgeInsets.only(
                                    top: SizeConfig.blockHeight * 0.6,
                                    // bottom: SizeConfig.blockHeight * 1,
                                    left: SizeConfig.blockWidth * 4,
                                    right: SizeConfig.blockWidth * 0,
                                  ),
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      fontSize: SizeConfig.blockWidth * 4,
                                      color: Colors.amber[600],
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
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

Widget _hospitalBlock(HospitalModel hospital, int index, int size) {
  return Container(
    margin: EdgeInsets.only(
      right: SizeConfig.blockWidth * 1,
      left: SizeConfig.blockWidth * 1,
      top: (index == 0) ? SizeConfig.blockHeight * 5.5 : 0,
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
        // Positioned(
        //   bottom: 0,
        //   right: 0,
        //   child: Container(
        //     height: SizeConfig.blockHeight * 10,
        //     width: SizeConfig.blockWidth * 36,
        //     // margin: EdgeInsets.only(
        //     //   right: SizeConfig.blockWidth * 2,
        //     //   left: SizeConfig.blockWidth * 2,
        //     //   bottom: 6,
        //     // ),
        //     decoration: BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.all(Radius.circular(4)),
        //       // border: Border.all(color: COLORS.black),
        //       // boxShadow: [
        //       //   BoxShadow(
        //       //     color: Colors.black12,
        //       //     blurRadius: 3.0,
        //       //   ),
        //       // ],
        //       image: DecorationImage(
        //         image: NetworkImage("${hospital.photos!.first}"),
        //         fit: BoxFit.cover,
        //       ),
        //     ),
        //   ),
        // ),
        Expanded(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: SizeConfig.blockHeight * 18,
                width: SizeConfig.blockWidth * 86,
                // margin: EdgeInsets.only(
                //   right: SizeConfig.blockWidth * 2,
                //   left: SizeConfig.blockWidth * 2,
                //   bottom: 6,
                // ),
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
                  // Navigator.of(context).push(MaterialPageRoute<void>(
                  //   builder: (BuildContext context) => HospitalDetailsPage(
                  //     name: name,
                  //     address: address,
                  //     type: type,
                  //     phone: phone,
                  //     hours: hours,
                  //     beds: beds,
                  //     loc: loc,
                  //   ),
                  // ));
                },
                child: Container(
                  height: SizeConfig.blockHeight * 3.2,
                  child: Text(
                    "${hospital.name}",
                    maxLines: 1,
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
                margin: EdgeInsets.only(top: 4, bottom: 0),
                height: SizeConfig.blockHeight * 6.6,
                child: Text(
                  "${hospital.address}",
                  maxLines: 3,
                  style: TextStyle(
                    // fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    fontSize: SizeConfig.blockWidth * 2.5,
                    color: Colors.grey[600],
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
                    "${(hospital.type == 1) ? "Ayurveda" : "Homeopathy"}",
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
                    "+91 6732768432",
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
                    "Number of beds: ",
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
            ],
          ),
        ),
      ],
    ),
  );
}
