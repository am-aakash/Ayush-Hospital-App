// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sih22/components/size_config.dart';
import 'package:sih22/screens/hospital_details/facilites_card.dart';
import 'package:sih22/screens/hospital_details/image_card.dart';
import 'package:sih22/screens/hospital_details/specializations_card.dart';

class HospitalDetailsPage extends StatefulWidget {
  const HospitalDetailsPage({
    Key? key,
    this.name,
    this.address,
    this.type,
    this.phone,
    this.hours,
    this.beds,
    this.loc,
  }) : super(key: key);
  final String? name;
  final String? address;
  final String? type;
  final String? phone;
  final String? hours;
  final String? beds;
  final LatLng? loc;
  State<HospitalDetailsPage> createState() => _HospitalDetailsPageState();
}

class _HospitalDetailsPageState extends State<HospitalDetailsPage> {
  Location currentLocation = Location();
  late BitmapDescriptor myIcon;

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
    _googleMapController.dispose();
    super.dispose();
  }

  void _onMapCreated(GoogleMapController controller) {
    _googleMapController = controller;

    MarkerId markerId1 = MarkerId("1");
    listMarkerIds.add(markerId1);
    Marker marker1 = Marker(
      markerId: markerId1,
      position: LatLng(23.20525931966346, 77.40826379886849),
      icon: myIcon,
    );
    setState(() {
      markers[markerId1] = marker1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(
                    top: SizeConfig.blockHeight * 4,
                    bottom: SizeConfig.blockHeight * 2,
                    left: SizeConfig.blockWidth * 24,
                    right: SizeConfig.blockWidth * 2,
                  ),
                  child: Text(
                    "${widget.name}",
                    maxLines: 4,
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
                    top: SizeConfig.blockHeight * 1,
                    bottom: SizeConfig.blockHeight * 0.5,
                    left: SizeConfig.blockWidth * 5,
                    // right: SizeConfig.blockWidth * 10,
                  ),
                  child: Text(
                    "Address",
                    maxLines: 3,
                    style: TextStyle(
                      // fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                      fontSize: SizeConfig.blockWidth * 3.2,
                      color: Colors.black,
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    // top: SizeConfig.blockHeight * 4,
                    bottom: SizeConfig.blockHeight * 2.52,
                    left: SizeConfig.blockWidth * 5,
                    right: SizeConfig.blockWidth * 5,
                  ),
                  child: Text(
                    "${widget.address}",
                    maxLines: 3,
                    style: TextStyle(
                      // fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: SizeConfig.blockWidth * 3,
                      color: Colors.grey[600],
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Container(
                  height: SizeConfig.blockHeight * 25,
                  // width: SizeConfig.blockWidth * 90,
                  margin: EdgeInsets.only(
                    bottom: SizeConfig.blockHeight * 2,
                    left: SizeConfig.blockWidth * 5,
                    right: SizeConfig.blockWidth * 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // borderRadius: BorderRadius.all(Radius.circular(8)),
                    // border: Border.all(color: COLORS.black),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5.0,
                      ),
                    ],
                  ),
                  child: GoogleMap(
                    onMapCreated: _onMapCreated,
                    myLocationButtonEnabled: true,
                    myLocationEnabled: true,
                    zoomControlsEnabled: true,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(23.20525931966346, 77.40826379886849),
                      zoom: 13,
                    ),
                    markers: Set<Marker>.of(markers.values),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: SizeConfig.blockHeight * 1,
                    bottom: SizeConfig.blockHeight * 0.5,
                    left: SizeConfig.blockWidth * 5,
                    // right: SizeConfig.blockWidth * 10,
                  ),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Hospital Type: ",
                        maxLines: 3,
                        style: TextStyle(
                          // fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.blockWidth * 3.2,
                          color: Colors.black,
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        "${widget.type}",
                        maxLines: 3,
                        style: TextStyle(
                          // fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.blockWidth * 3.2,
                          color: Colors.amber[600],
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: SizeConfig.blockHeight * 1,
                    bottom: SizeConfig.blockHeight * 0.5,
                    left: SizeConfig.blockWidth * 5,
                    // right: SizeConfig.blockWidth * 10,
                  ),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Open Hours: ",
                        maxLines: 3,
                        style: TextStyle(
                          // fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.blockWidth * 3.2,
                          color: Colors.black,
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        "${widget.hours}",
                        maxLines: 3,
                        style: TextStyle(
                          // fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.blockWidth * 3.2,
                          color: Colors.amber[600],
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: SizeConfig.blockHeight * 1,
                    bottom: SizeConfig.blockHeight * 0.5,
                    left: SizeConfig.blockWidth * 5,
                    // right: SizeConfig.blockWidth * 10,
                  ),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Phone: ",
                        maxLines: 3,
                        style: TextStyle(
                          // fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.blockWidth * 3.2,
                          color: Colors.black,
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        "${widget.phone}",
                        maxLines: 3,
                        style: TextStyle(
                          // fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.blockWidth * 3.2,
                          color: Colors.amber[600],
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: SizeConfig.blockHeight * 1,
                    bottom: SizeConfig.blockHeight * 0.5,
                    left: SizeConfig.blockWidth * 5,
                    // right: SizeConfig.blockWidth * 10,
                  ),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Total beds: ",
                        maxLines: 3,
                        style: TextStyle(
                          // fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.blockWidth * 3.2,
                          color: Colors.black,
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        "${widget.beds}",
                        maxLines: 3,
                        style: TextStyle(
                          // fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.blockWidth * 3.2,
                          color: Colors.amber[600],
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: SizeConfig.blockHeight * 1,
                    bottom: SizeConfig.blockHeight * 0.5,
                    left: SizeConfig.blockWidth * 5,
                    // right: SizeConfig.blockWidth * 10,
                  ),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Hospital Images: ",
                        maxLines: 3,
                        style: TextStyle(
                          // fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.blockWidth * 3.2,
                          color: Colors.black,
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: SizeConfig.blockHeight * 1,
                    bottom: SizeConfig.blockHeight * 0.5,
                    left: SizeConfig.blockWidth * 2,
                    right: SizeConfig.blockWidth * 2,
                  ),
                  height: SizeConfig.blockHeight * 22,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      imageCard(
                          uri:
                              "https://www.edufever.com/wp-content/uploads/2019/07/Khushilal-Ayrvedic-College-Madhya-Pradesh.jpg"),
                      imageCard(
                          uri:
                              "https://www.edufever.com/wp-content/uploads/2019/07/Khushilal-Ayrvedic-College-Madhya-Pradesh.jpg"),
                      imageCard(
                          uri:
                              "https://www.edufever.com/wp-content/uploads/2019/07/Khushilal-Ayrvedic-College-Madhya-Pradesh.jpg"),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: SizeConfig.blockHeight * 2,
                    bottom: SizeConfig.blockHeight * 0.5,
                    left: SizeConfig.blockWidth * 5,
                    // right: SizeConfig.blockWidth * 10,
                  ),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Specializations: ",
                        maxLines: 3,
                        style: TextStyle(
                          // fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.blockWidth * 3.2,
                          color: Colors.black,
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: SizeConfig.blockHeight * 1,
                    bottom: SizeConfig.blockHeight * 2,
                    left: SizeConfig.blockWidth * 2,
                    right: SizeConfig.blockWidth * 2,
                  ),
                  height: SizeConfig.blockHeight * 16,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      specializationCard(
                        name: "Cancer Treatment",
                        desc: "provide some better solutions to cure cancer",
                        prof: "Dr. Arun Singh",
                        email: "arunsinghs1@xyz.com",
                        phone: "+91 7244632892",
                      ),
                      specializationCard(
                        name: "Cancer Treatment",
                        desc: "provide some better solutions to cure cancer",
                        prof: "Dr. Arun Singh",
                        email: "arunsinghs1@xyz.com",
                        phone: "+91 7244632892",
                      ),
                      specializationCard(
                        name: "Cancer Treatment",
                        desc: "provide some better solutions to cure cancer",
                        prof: "Dr. Arun Singh",
                        email: "arunsinghs1@xyz.com",
                        phone: "+91 7244632892",
                      ),
                      specializationCard(
                        name: "Cancer Treatment",
                        desc: "provide some better solutions to cure cancer",
                        prof: "Dr. Arun Singh",
                        email: "arunsinghs1@xyz.com",
                        phone: "+91 7244632892",
                      ),
                      specializationCard(
                        name: "name",
                        desc: "desc",
                        prof: "prof",
                        email: "email",
                        phone: "phone",
                      ),
                      specializationCard(
                        name: "name",
                        desc: "desc",
                        prof: "prof",
                        email: "email",
                        phone: "phone",
                      ),
                      specializationCard(
                        name: "name",
                        desc: "desc",
                        prof: "prof",
                        email: "email",
                        phone: "phone",
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: SizeConfig.blockHeight * 2,
                    bottom: SizeConfig.blockHeight * 0.5,
                    left: SizeConfig.blockWidth * 5,
                    // right: SizeConfig.blockWidth * 10,
                  ),
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Facilities: ",
                        maxLines: 3,
                        style: TextStyle(
                          // fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.blockWidth * 3.2,
                          color: Colors.black,
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: SizeConfig.blockHeight * 1,
                    bottom: SizeConfig.blockHeight * 2,
                    left: SizeConfig.blockWidth * 2,
                    right: SizeConfig.blockWidth * 2,
                  ),
                  height: SizeConfig.blockHeight * 22,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      facilitesCard(
                        name: "Ayurveda Dispensary",
                        desc: "All ayurveda and unani medicines available",
                        uri:
                            "https://newint.org/sites/default/files/blog/majority/2015/07/21/21.07.15-india-chemist-590.jpg",
                      ),
                      facilitesCard(
                        name: "Operation theatres available",
                        desc: "All Ayurvedic facilities available",
                        uri:
                            "https://static.toiimg.com/thumb/msid-78715506,width-1280,height-720,resizemode-4/.jpg",
                      ),
                      facilitesCard(
                        name: "Ayurveda Dispensary",
                        desc: "All ayurveda and unani medicines available",
                        uri:
                            "https://newint.org/sites/default/files/blog/majority/2015/07/21/21.07.15-india-chemist-590.jpg",
                      ),
                      facilitesCard(
                        name: "Operation theatres available",
                        desc: "All Ayurvedic facilities available",
                        uri:
                            "https://static.toiimg.com/thumb/msid-78715506,width-1280,height-720,resizemode-4/.jpg",
                      ),
                      facilitesCard(
                        name: "Operation theatres available",
                        desc: "All Ayurvedic facilities available",
                        uri:
                            "https://static.toiimg.com/thumb/msid-78715506,width-1280,height-720,resizemode-4/.jpg",
                      ),
                    ],
                  ),
                ),
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
      ),
    );
  }
}
