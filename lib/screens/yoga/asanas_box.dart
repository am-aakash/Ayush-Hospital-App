// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:sih22/components/size_config.dart';

Widget asanaBox({
  @required String? name,
  @required Widget? yt,
  @required String? desc,
}) {
  return Container(
    margin: EdgeInsets.only(
      right: SizeConfig.blockWidth * 5,
      left: SizeConfig.blockWidth * 5,
      top: SizeConfig.blockHeight * 1.5,
      bottom: SizeConfig.blockHeight * 0,
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
    child: ExpandablePanel(
      header: Text(
        "$name",
        style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          fontSize: SizeConfig.blockWidth * 3.8,
          color: Colors.amber[600],
          overflow: TextOverflow.ellipsis,
        ),
      ),
      collapsed: Container(),
      expanded: Container(
          height: SizeConfig.blockHeight * 40,
          child: ListView(
            children: [
              SizedBox(height: 5),
              yt!,
              // SizedBox(height: 6),
              // Text(
              //   "Benefits:",
              //   // maxLines: 2,
              //   style: TextStyle(
              //     fontFamily: 'Poppins',
              //     fontWeight: FontWeight.w600,
              //     fontSize: SizeConfig.blockWidth * 3,
              //     color: Colors.grey[800],
              //     overflow: TextOverflow.ellipsis,
              //   ),
              // ),
              SizedBox(height: 4),
              Text(
                desc!,
                maxLines: 8,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: SizeConfig.blockWidth * 2.8,
                  color: Colors.grey[600],
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          )),
    ),
  );
}
