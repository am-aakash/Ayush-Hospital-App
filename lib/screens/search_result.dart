// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables, avoid_print, unnecessary_new,unused_local_variable
import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:clippy_flutter/label.dart';
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
import 'package:sih22/screens/yoga/yoga_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchResults extends StatefulWidget {
  const SearchResults({Key? key, this.search}) : super(key: key);
  final String? search;
  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  @override
  Widget build(BuildContext context) {
    String search2 = widget.search!;
    search2 = search2.toUpperCase();
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              SizedBox(height: SizeConfig.blockHeight * 3.4),
              Container(
                margin: EdgeInsets.only(
                  top: 40,
                ),
                child: Text(
                  "Search Result",
                  // maxLines: 4,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                    fontSize: SizeConfig.blockWidth * 5,
                    color: Colors.amber[600],
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: SizeConfig.blockWidth * 5,
                  right: SizeConfig.blockWidth * 5,
                  top: 20,
                ),
                height: SizeConfig.blockHeight * 0.1,
                width: SizeConfig.blockWidth * 90,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  // borderRadius: BorderRadius.all(Radius.circular(8)),
                  // border: Border.all(color: COLORS.black),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.black12,
                  //     blurRadius: 3.0,
                  //   ),
                  // ],
                ),
              ),
              Container(
                // color: Colors.red,
                height: SizeConfig.blockHeight * 86,
                child: ListView.builder(
                  itemCount: hospitals.length,
                  itemBuilder: (context, index) {
                    if (search2 == "FEVER" ||
                        search2 == "COUGH" ||
                        search2 == "HEAD ACHE" ||
                        search2 == "INDIGESTION" ||
                        search2 == "STOMACH ACHE" ||
                        search2 == "ACIDITY" ||
                        search2 == "DIARRHOEA" ||
                        search2 == "JOINT-PAIN") {
                      return _hospitalBlock(hospitals[index], search2, index,
                          hospitals.length, context);
                    } else if (search2 == "DIABETIES") {
                      if (index % 2 == 0) {
                        return _hospitalBlock(hospitals[index], search2, index,
                            hospitals.length, context);
                      }
                    } else if (search2 == "MALARIA") {
                      if (index % 3 == 0) {
                        return _hospitalBlock(hospitals[index], search2, index,
                            hospitals.length, context);
                      }
                    } else if (search2 == "PILES") {
                      if (index % 4 == 0) {
                        return _hospitalBlock(hospitals[index], search2, index,
                            hospitals.length, context);
                      }
                    } else if (search2 == "CANCER") {
                      if (index == 7) {
                        return _hospitalBlock(hospitals[index], search2, index,
                            hospitals.length, context);
                      }
                    } else if (search2 == "MALARIA") {
                      if (index % 3 == 0) {
                        return _hospitalBlock(hospitals[index], search2, index,
                            hospitals.length, context);
                      }
                    } else if (index % 9 == 0) {
                      return Center(
                        child: Container(
                          margin: EdgeInsets.only(top: 300),
                          child: Text(
                            "NO RESULTS FOUND",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: SizeConfig.blockWidth * 5,
                              color: Colors.amber[600],
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              )
            ],
          ),
          Positioned(
            top: SizeConfig.blockHeight * 7,
            left: SizeConfig.blockWidth * 5,
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: SizeConfig.blockHeight * 5.2,
                width: SizeConfig.blockHeight * 5.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  // border: Border.all(color: COLORS.black),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 3.0,
                    ),
                  ],
                ),
                child: Icon(Icons.arrow_back),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _hospitalBlock(HospitalModel hospital, String search, int index,
    int size, BuildContext context) {
  // BuildContext context;
  return Container(
    margin: EdgeInsets.only(
      right: SizeConfig.blockWidth * 5,
      left: SizeConfig.blockWidth * 5,
      // top: (index == 0) ? SizeConfig.blockHeight * 0 : 0,
      bottom: SizeConfig.blockHeight * 1.5,
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
                margin: EdgeInsets.only(top: 1, bottom: 5),
                // height: SizeConfig.blockHeight * 6.6,
                child: Text(
                  "$search REMEDIES AVAILABLE HERE",
                  style: TextStyle(
                    // fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: SizeConfig.blockWidth * 2.8,
                    color: Colors.amber[600],
                  ),
                ),
              ),
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
