// ignore_for_file: prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables, avoid_print, unnecessary_new,unused_local_variable
import 'package:antdesign_icons/antdesign_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sih22/components/colors.dart';
import 'package:sih22/components/size_config.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:custom_info_window/custom_info_window.dart';
import 'package:clippy_flutter/triangle.dart';
import 'package:sih22/screens/map_helpers/info_window.dart';

Widget drawerHelper(BuildContext context) {
  bool isHindi = false;
  return SafeArea(
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
                      style: TextStyle(
                        color: Colors.black,
                        // fontFamily: 'Rubik',
                        fontSize: SizeConfig.blockWidth * 3.6,
                        fontWeight: FontWeight.w300,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(
                              // color: COLORS.black,
                              ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
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
                  Container(
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
                ],
              ),
            ),
            _listTile(
              icon: Icons.dashboard,
              title: 'Dashboard',
              onPressed: () {},
            ),
            _listTile(
              icon: Icons.person,
              title: 'My Profile',
              onPressed: () {},
            ),
            _listTile(
              icon: Icons.notifications,
              title: 'News and Articles',
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute<void>(
                //     builder: (BuildContext context) =>
                //   ),
                // );
              },
            ),
            _listTile(
              icon: AntIcons.medicineBoxFilled,
              title: 'Treatment',
              onPressed: () {
                // Navigator.pushNamed(context, '/SearchHistoryScreen');
              },
            ),
            _listTile(
              icon: Icons.bed_sharp,
              title: 'Bookings',
              onPressed: () {},
            ),
            _listTile(
              icon: Icons.school_rounded,
              title: 'Education & Labs',
              onPressed: () {},
            ),
            _listTile(
              icon: Icons.reviews_rounded,
              title: 'Reviews',
              onPressed: () {},
            ),
            _listTile(
              icon: Icons.add_call,
              title: 'Ayush Telemedicinies',
              onPressed: () {},
            ),
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
            Container(
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
                      isHindi = (!isHindi) ? false : true;
                    },
                    child: Container(
                      child: Text(
                        '   English',
                        style: TextStyle(
                          fontSize: SizeConfig.blockWidth * 3.6,
                          fontFamily: 'Poppins',
                          color:
                              (!isHindi) ? Colors.amber[600] : Colors.black54,
                          fontWeight:
                              (!isHindi) ? FontWeight.w600 : FontWeight.w500,
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
                      isHindi = (isHindi) ? false : true;
                    },
                    child: Container(
                      child: Text(
                        '  हिन्दी     ',
                        style: TextStyle(
                          fontSize: SizeConfig.blockWidth * 3.6,
                          fontFamily: 'Poppins',
                          color: (isHindi) ? Colors.amber[600] : Colors.black54,
                          fontWeight:
                              (isHindi) ? FontWeight.w600 : FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
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
