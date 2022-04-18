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
import 'package:sih22/screens/drawer.dart';
import 'package:sih22/screens/map_helpers/info_window.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: COLORS.white,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: SizeConfig.blockHeight * 97,
        child: ListView(
          children: <Widget>[
            Container(
              width: SizeConfig.blockWidth * 100,
              height: SizeConfig.blockHeight * 8,
              margin: EdgeInsets.only(bottom: SizeConfig.blockHeight * 1),
              child: Stack(
                alignment: AlignmentDirectional.centerStart,
                children: <Widget>[
                  Positioned(
                    left: SizeConfig.blockWidth * 4,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: SizeConfig.blockHeight * 4,
                        width: SizeConfig.blockWidth * 6,
                        child: Icon(
                          Icons.arrow_back,
                          size: SizeConfig.blockWidth * 6,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'News and Articles',
                      style: TextStyle(
                        fontSize: SizeConfig.screenRatio * 11,
                        fontFamily: 'Poppins',
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: SizeConfig.blockHeight * 88,
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockHeight * 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        SizedBox(width: SizeConfig.blockWidth * 3),
                        Icon(
                          Icons.star,
                          color: Colors.amber[800],
                        ),
                        Text(
                          "  What's New",
                          style: TextStyle(
                            fontSize: SizeConfig.blockWidth * 4,
                            fontFamily: 'Poppins',
                            color: Colors.amber[800],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: SizeConfig.blockWidth * 40),
                        Text(
                          "View all",
                          style: TextStyle(
                            fontSize: SizeConfig.blockWidth * 3.6,
                            fontFamily: 'Poppins',
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: SizeConfig.blockWidth * 3),
                      ],
                    ),
                  ),
                  newsTile(
                      title:
                          'Seniority List of all the Ayush physicians working under Ministry of Ayush and CGHS organization as on 01.01.2021 & 01.01.2022',
                      onPressed: () {}),
                  newsTile(
                      title:
                          'WHO-GCTM (Global Center for Traditional Medicine)',
                      onPressed: () {}),
                  newsTile(
                      title:
                          'Master Chef Competition for Global AYUSH Investment and Innovation Summit, ',
                      onPressed: () {}),
                  newsTile(
                      title:
                          'NOTICE: All Candidates who are participating in 3rd/Mop-up Round of AACCC-UG counseling, 2021.',
                      onPressed: () {}),
                  newsTile(
                      title:
                          'Draft of UPI, P-I, Vol-VII for public comments/suggestion',
                      onPressed: () {}),
                  newsTile(
                      title:
                          'Corrigendum on engagement of Young Professionals in the Ministry of Ayush-reg.',
                      onPressed: () {}),
                  newsTile(
                      title:
                          'Filling up one post of Assistant Drug Controller (Unani) Ministry of Ayush – reg.',
                      onPressed: () {}),
                  newsTile(
                      title:
                          'Master Chef Competition for Global AYUSH Investment and Innovation Summit, ',
                      onPressed: () {}),
                  newsTile(
                      title:
                          'Competition for Global AYUSH Investment and Innovation Summit, ',
                      onPressed: () {}),
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: SizeConfig.blockHeight * 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        SizedBox(width: SizeConfig.blockWidth * 3),
                        Icon(
                          Icons.link_rounded,
                          color: Colors.amber[800],
                        ),
                        Text(
                          "  Related Links",
                          style: TextStyle(
                            fontSize: SizeConfig.blockWidth * 4,
                            fontFamily: 'Poppins',
                            color: Colors.amber[800],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: SizeConfig.blockWidth * 37),
                        Text(
                          "View all",
                          style: TextStyle(
                            fontSize: SizeConfig.blockWidth * 3.6,
                            fontFamily: 'Poppins',
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(width: SizeConfig.blockWidth * 3),
                      ],
                    ),
                  ),
                  newsTile(
                      title:
                          'All India Ayush Post Graduate Entrance Test (AIAPGET), 2021',
                      onPressed: () {}),
                  newsTile(
                      title: ' Central Council of Indian Medicine (CCIM)',
                      onPressed: () {}),
                  newsTile(title: 'Yoga Portal', onPressed: () {}),
                  newsTile(
                      title: 'Central Council for Research in Siddha (CCRS)',
                      onPressed: () {}),
                  newsTile(
                      title:
                          'Central Council for Research in Yoga and Naturopathy (CCRYN)',
                      onPressed: () {}),
                  newsTile(
                      title:
                          'Central Council for Research in Unani Medicine (CCRUM)',
                      onPressed: () {}),
                  newsTile(
                      title:
                          'Central Council for Research in Homoeopathy (CCRH)',
                      onPressed: () {}),
                  newsTile(
                      title:
                          'Central Council for Research in Ayurvedic Sciences (CCRAS)',
                      onPressed: () {}),
                  newsTile(
                      title: 'Central Government Health Scheme (CGHS)',
                      onPressed: () {}),
                  newsTile(
                      title: 'Central Government Health Scheme (CGHS)',
                      onPressed: () {}),
                  newsTile(
                      title: 'Central Government Health Scheme (CGHS)',
                      onPressed: () {}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget newsTile({String? title, VoidCallback? onPressed}) {
  return InkWell(
    onTap: onPressed,
    child: Container(
      margin: EdgeInsets.only(bottom: SizeConfig.blockHeight * 0.6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('      ○  '),
          Container(
            // height: SizeConfig.blockHeight * 6,
            width: SizeConfig.blockWidth * 88,
            child: Text(
              '$title',
              maxLines: 3,
              style: TextStyle(
                fontSize: SizeConfig.blockWidth * 2.8,
                fontFamily: 'Poppins',
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
            ),
          )
        ],
      ),
    ),
  );
}
