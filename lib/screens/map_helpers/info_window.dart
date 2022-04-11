import 'package:clippy_flutter/triangle.dart';
import 'package:flutter/material.dart';
import 'package:sih22/components/size_config.dart';

Widget infoWindowHelper({
  @required String? name,
  @required String? address,
  @required String? type,
  @required String? phone,
  @required String? hours,
  @required String? beds,
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
              Container(
                height: SizeConfig.blockHeight * 3.2,
                child: Text(
                  "$name",
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
              Container(
                margin: EdgeInsets.only(top: 4, bottom: 0),
                height: SizeConfig.blockHeight * 5.8,
                child: Text(
                  "$address",
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
                    "$type",
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
                    "$hours",
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
                    "$phone",
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
                    "$beds",
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
