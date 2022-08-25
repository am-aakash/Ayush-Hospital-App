// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:clippy_flutter/triangle.dart';
import 'package:flutter/material.dart';
import 'package:sih22/components/size_config.dart';

Widget specializationCard({
  @required String? name,
  @required String? desc,
  @required String? prof,
  @required String? email,
  @required String? phone,
}) {
  return Container(
    height: SizeConfig.blockHeight * 14,
    width: SizeConfig.blockWidth * 60,
    margin: EdgeInsets.only(
      right: SizeConfig.blockWidth * 2,
      left: SizeConfig.blockWidth * 3,
      top: SizeConfig.blockHeight * 0.5,
      bottom: SizeConfig.blockHeight * 0.5,
    ),
    padding: EdgeInsets.all(SizeConfig.blockWidth * 2),
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
    child: Column(
      children: <Widget>[
        Text(
          "$name",
          maxLines: 1,
          style: TextStyle(
            // fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: SizeConfig.blockWidth * 3.5,
            color: Colors.amber[600],
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          height: SizeConfig.blockHeight * 4,
          margin: EdgeInsets.only(
            right: SizeConfig.blockWidth * 2,
            left: SizeConfig.blockWidth * 3,
            top: SizeConfig.blockHeight * 0.5,
            bottom: SizeConfig.blockHeight * 0.5,
          ),
          child: Text(
            "$desc",
            maxLines: 2,
            textAlign: TextAlign.center,
            style: TextStyle(
              // fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
              fontSize: SizeConfig.blockWidth * 2.5,
              color: Colors.grey[700],
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Text(
          "$prof",
          maxLines: 3,
          style: TextStyle(
            // fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: SizeConfig.blockWidth * 3,
            color: Colors.grey[900],
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          "$phone",
          maxLines: 3,
          style: TextStyle(
            // fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: SizeConfig.blockWidth * 3,
            color: Colors.grey[700],
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Text(
          "$email",
          maxLines: 3,
          style: TextStyle(
            // fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: SizeConfig.blockWidth * 3,
            color: Colors.grey[700],
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}
