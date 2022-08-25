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
import 'package:sih22/screens/hospital_details/hospital_details_page.dart';
import 'package:sih22/screens/map_helpers/info_window.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(23.251270, 77.473770),
    zoom: 14.5,
  );
  Location currentLocation = Location();
  late BitmapDescriptor myIcon;
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  /// Set of displayed markers and cluster markers on the map
  final Set<Marker> _markers = {};
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  List<MarkerId> listMarkerIds = List<MarkerId>.empty(growable: true);
  bool isSearched = false;

  late GoogleMapController _googleMapController;

  void _currentLocation() async {
    var location = await currentLocation.getLocation();

    _googleMapController.animateCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        bearing: 0,
        target: LatLng(location.latitude!, location.longitude!),
        zoom: 17.0,
      ),
    ));
  }

  void initState() {
    super.initState();
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      'assets/images/pin.png',
    ).then((onValue) {
      myIcon = onValue;
    });
  }

  @override
  void dispose() {
    _customInfoWindowController.dispose();
    _googleMapController.dispose();
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    _googleMapController = controller;
    _customInfoWindowController.googleMapController = controller;

    MarkerId markerId1 = MarkerId("1");
    MarkerId markerId2 = MarkerId("2");
    MarkerId markerId3 = MarkerId("3");
    MarkerId markerId4 = MarkerId("4");
    MarkerId markerId5 = MarkerId("5");
    MarkerId markerId6 = MarkerId("6");
    MarkerId markerId7 = MarkerId("7");

    listMarkerIds.add(markerId1);
    listMarkerIds.add(markerId2);
    listMarkerIds.add(markerId3);
    listMarkerIds.add(markerId4);
    listMarkerIds.add(markerId5);
    listMarkerIds.add(markerId6);
    listMarkerIds.add(markerId7);

    Marker marker1 = Marker(
      markerId: markerId1,
      position: LatLng(23.2600389508425, 77.3923594244537),
      icon: myIcon,
      onTap: () {
        _customInfoWindowController.addInfoWindow!(
          infoWindowHelper(
            name: "Hamidia Hospital",
            address:
                "Sultania Rd, Royal Market, Medical College Campus, Kohefiza, Bhopal, Madhya Pradesh 462001",
            type: "Public",
            phone: "0755 405 0450",
            hours: "Open 24 hours",
            beds: "800",
            // ontap: () {
            //   Navigator.of(context).push(
            //     MaterialPageRoute<void>(
            //       builder: (BuildContext context) => HospitalDetailsPage(),
            //     ),
            //   );
            // },
            context: context,
          ),
          LatLng(23.2600389508425, 77.3923594244537),
        );
      },
    );

    Marker marker2 = Marker(
      markerId: markerId2,
      position: LatLng(23.25300641419404, 77.46171626875504),
      icon: myIcon,
      onTap: () {
        _customInfoWindowController.addInfoWindow!(
          infoWindowHelper(
            name: "Navodaya Cancer Hospital",
            address:
                "Nizamuddin Rd, Opp BHEL Gate#1, Indrapuri B Sector, Sector B, Indrapuri, Bhopal, \nMadhya Pradesh 462022",
            type: "Private (For Profit)",
            phone: "9827055790",
            hours: "Open 24 hours",
            beds: "750",
            // ontap: () {
            //   Navigator.of(context).push(
            //     MaterialPageRoute<void>(
            //       builder: (BuildContext context) => HospitalDetailsPage(),
            //     ),
            //   );
            // },
            context: context,
          ),
          LatLng(23.25300641419404, 77.46171626875504),
        );
      },
    );
    Marker marker3 = Marker(
      markerId: markerId3,
      position: LatLng(23.171533935221994, 77.42227176875362),
      icon: myIcon,
      onTap: () {
        _customInfoWindowController.addInfoWindow!(
          infoWindowHelper(
            name: "Galaxy hospital",
            address:
                "25 Banjari, near Jain Mandir, Danish Kunj, Kolar Rd, Bhopal, Madhya Pradesh 462042",
            type: "Private (For Profit)",
            phone: "9713171857",
            hours: "Open 24 hours",
            beds: "500",
            // ontap: () {
            //   Navigator.of(context).push(
            //     MaterialPageRoute<void>(
            //       builder: (BuildContext context) => HospitalDetailsPage(),
            //     ),
            //   );
            // },
            context: context,
          ),
          LatLng(23.171533935221994, 77.42227176875362),
        );
      },
    );
    Marker marker4 = Marker(
      markerId: markerId4,
      position: LatLng(23.20525931966346, 77.40826379886849),
      icon: myIcon,
      onTap: () {
        _customInfoWindowController.addInfoWindow!(
          infoWindowHelper(
            name:
                "Pt. Khushilal Sharma Govt. Ayurveda College & Institute Bhopal",
            address: "near Mpcost, Nehru Nagar, Bhopal, Madhya Pradesh 462007",
            type: "Government",
            phone: "07552970319",
            hours: "Open 9am-2pm",
            beds: "100",
            context: context,
            loc: LatLng(23.20525931966346, 77.40826379886849),
          ),
          LatLng(23.20525931966346, 77.40826379886849),
        );
      },
    );
    Marker marker5 = Marker(
      markerId: markerId5,
      position: LatLng(23.302149058983957, 77.42394816690555),
      icon: myIcon,
      onTap: () {
        _customInfoWindowController.addInfoWindow!(
          infoWindowHelper(
            name: "PEOPLES HOSPITAL BHANPUR BHOPAL",
            address: "Peoples Campus, Bhanpur, Bhopal, Madhya Pradesh 462037",
            type: "Private (Not for Profit)",
            phone: "9893573779",
            hours: "Open 24 hours",
            beds: "600",
            // ontap: () {
            //   Navigator.of(context).push(
            //     MaterialPageRoute<void>(
            //       builder: (BuildContext context) => HospitalDetailsPage(),
            //     ),
            //   );
            // },
            context: context,
          ),
          LatLng(23.302149058983957, 77.42394816690555),
        );
      },
    );
    Marker marker6 = Marker(
      markerId: markerId6,
      position: LatLng(23.268994534096244, 77.30806386875541),
      icon: myIcon,
      onTap: () {
        _customInfoWindowController.addInfoWindow!(
          infoWindowHelper(
            name: "CHIRAYU MEDICAL COLLEGE AND HOSPITAL",
            address:
                "Bhopal-Indore Highway Bhainsakhedi, Bairagarh, Bhopal, \nMadhya Pradesh 462030",
            type: "Private (Not for Profit)",
            phone: "9893230364",
            hours: "Open 24 hours",
            beds: "600",
            // ontap: () {
            //   Navigator.of(context).push(
            //     MaterialPageRoute<void>(
            //       builder: (BuildContext context) => HospitalDetailsPage(),
            //     ),
            //   );
            // },
            context: context,
          ),
          LatLng(23.268994534096244, 77.30806386875541),
        );
      },
    );

    setState(() {
      markers[markerId1] = marker1;
      markers[markerId2] = marker2;
      markers[markerId3] = marker3;
      markers[markerId4] = marker4;
      markers[markerId5] = marker5;
      markers[markerId6] = marker6;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isHindi = false;
    return Scaffold(
      key: _scaffoldKey,
      drawer: drawerHelper(context),
      body: SingleChildScrollView(
        child: Container(
          height: SizeConfig.screenHeight,
          child: Stack(
            children: [
              Column(
                children: <Widget>[
                  Container(
                    height: SizeConfig.blockHeight * 100,
                    // Main map
                    child: GoogleMap(
                      myLocationButtonEnabled: false,
                      myLocationEnabled: true,
                      zoomControlsEnabled: true,
                      initialCameraPosition: _initialCameraPosition,
                      onMapCreated: _onMapCreated,
                      onTap: (position) {
                        _customInfoWindowController.hideInfoWindow!();
                      },
                      onCameraMove: (position) {
                        _customInfoWindowController.onCameraMove!();
                      },
                      markers: Set<Marker>.of(markers.values),
                    ),
                  ),
                  // Container(
                  //   height: SizeConfig.blockHeight * 7,
                  //   decoration: const BoxDecoration(
                  //     color: Colors.white,
                  //     // borderRadius: BorderRadius.all(Radius.circular(8)),
                  //     boxShadow: [
                  //       BoxShadow(
                  //         color: Colors.black12,
                  //         blurRadius: 2.0,
                  //       ),
                  //     ],
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: <Widget>[
                  //       Container(
                  //         margin:
                  //             EdgeInsets.only(left: SizeConfig.blockWidth * 10),
                  //         child: Icon(
                  //           AntIcons.userOutlined,
                  //           size: SizeConfig.blockWidth * 7,
                  //           color: COLORS.black,
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.only(
                  //             right: SizeConfig.blockWidth * 10),
                  //         child: Icon(
                  //           AntIcons.funnelPlotOutlined,
                  //           size: SizeConfig.blockWidth * 7,
                  //           color: COLORS.black,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
              Positioned(
                bottom: 40,
                left: SizeConfig.blockWidth * 30,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/hospital_list');
                  },
                  child: Container(
                    height: SizeConfig.blockHeight * 6,
                    width: SizeConfig.blockWidth * 40,
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
                        'View List',
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
              CustomInfoWindow(
                controller: _customInfoWindowController,
                height: SizeConfig.blockHeight * 24,
                width: SizeConfig.blockWidth * 60,
                offset: 0,
              ),
              // cneter icon
              // Positioned(
              //   bottom: 15,
              //   left: SizeConfig.blockWidth * 42.5,
              //   child: InkWell(
              //     onTap: () {
              //       _currentLocation();
              //     },
              //     child: Container(
              //       height: SizeConfig.blockWidth * 15,
              //       width: SizeConfig.blockWidth * 15,
              //       decoration: BoxDecoration(
              //         color: Colors.white,
              //         borderRadius: BorderRadius.all(
              //           Radius.circular(SizeConfig.blockWidth * 20),
              //         ),
              //       ),
              //       child: Center(
              //         child: Icon(
              //           Icons.location_on,
              //           size: SizeConfig.blockWidth * 7,
              //           color: COLORS.black,
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
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
                        onTap: () {
                          // Navigator.pushNamed(context, '/notification_page');
                          _currentLocation();
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
                          child: Icon(Icons.location_on),
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
