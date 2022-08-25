// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:sih22/components/size_config.dart';

Widget yogaCategoryBox({
  @required String? category,
  @required List<String>? asanas,
  @required List<String>? desc,
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
      left: SizeConfig.blockWidth * 5,
      right: SizeConfig.blockWidth * 3,
      top: SizeConfig.blockHeight * 1.5,
      bottom: SizeConfig.blockHeight * 1.2,
    ),
    child: ExpandablePanel(
      header: Text(
        "$category",
        style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          fontSize: SizeConfig.blockWidth * 3.5,
          color: Colors.amber[600],
          overflow: TextOverflow.ellipsis,
        ),
      ),
      collapsed: Container(),
      expanded: Container(
        height: SizeConfig.blockHeight * 20,
        child: Row(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  itemCount: asanas!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          asanas[index],
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockWidth * 3.2,
                            color: Colors.grey[800],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          desc![index],
                          maxLines: 2,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: SizeConfig.blockWidth * 2.8,
                            color: Colors.grey[600],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 5),
                      ],
                    );
                  }),
            )
          ],
        ),
      ),
    ),
  );
}
