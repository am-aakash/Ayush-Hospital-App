// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:sih22/components/size_config.dart';

Widget facilitesCard({
  @required String? name,
  @required String? desc,
  @required String? uri,
}) {
  return Container(
    height: SizeConfig.blockHeight * 22,
    width: SizeConfig.blockWidth * 70,
    margin: EdgeInsets.only(
      right: SizeConfig.blockWidth * 2,
      left: SizeConfig.blockWidth * 3,
      top: SizeConfig.blockHeight * 0.5,
      bottom: SizeConfig.blockHeight * 0.5,
    ),
    padding: EdgeInsets.only(top: SizeConfig.blockHeight * 1),
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
        Container(
          height: SizeConfig.blockHeight * 13,
          width: SizeConfig.blockWidth * 70,
          margin: EdgeInsets.only(
            right: SizeConfig.blockWidth * 2,
            left: SizeConfig.blockWidth * 2,
            bottom: 6,
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
            image: DecorationImage(
              image: NetworkImage("$uri"),
              fit: BoxFit.cover,
            ),
          ),
        ),
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
          // height: SizeConfig.blockHeight * 3,
          margin: EdgeInsets.only(
            right: SizeConfig.blockWidth * 2,
            left: SizeConfig.blockWidth * 3,
            top: SizeConfig.blockHeight * 0.5,
            bottom: SizeConfig.blockHeight * 0.5,
          ),
          child: Text(
            "$desc ",
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
      ],
    ),
  );
}
