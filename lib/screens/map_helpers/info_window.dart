// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:clippy_flutter/triangle.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sih22/components/size_config.dart';
import 'package:sih22/models/hospital.dart';
import 'package:sih22/screens/hospital_details/hospital_details_page.dart';

Widget infoWindowHelper({
  @required HospitalModel? hospital,
  @required context,
}) {
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            new BoxShadow(
              color: Colors.black12,
              blurRadius: 0.6,
            ),
          ],
        ),
        width: SizeConfig.blockWidth * 60,
        height: SizeConfig.blockHeight * 18.5,
        padding: EdgeInsets.all(10),
        child: Expanded(
          child: Column(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (BuildContext context) => HospitalDetailsPage(
                      hospital: hospital,
                    ),
                  ));
                },
                child: Container(
                  height: SizeConfig.blockHeight * 3.2,
                  child: Text(
                    "${hospital!.name}",
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
                height: SizeConfig.blockHeight * 5.8,
                child: Text(
                  "${hospital.address}",
                  maxLines: 3,
                  textAlign: TextAlign.left,
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
      ),
      Triangle.isosceles(
        edge: Edge.BOTTOM,
        child: Container(
          // color: Colors.blue,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          width: 25.0,
          height: 10.0,
        ),
      ),
    ],
  );
}
