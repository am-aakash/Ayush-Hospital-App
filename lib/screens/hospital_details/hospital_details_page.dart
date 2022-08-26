// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
 
import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sih22/components/size_config.dart';
import 'package:sih22/models/hospital.dart';
import 'package:sih22/screens/hospital_details/facilites_card.dart';
import 'package:sih22/screens/hospital_details/image_card.dart';
import 'package:sih22/screens/hospital_details/specializations_card.dart';

class HospitalDetailsPage extends StatefulWidget {
  const HospitalDetailsPage({
    this.hospital,
  });
  final HospitalModel? hospital;
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
        target: widget.hospital!.latLng!,
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
      position: widget.hospital!.latLng!,
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
                    "${widget.hospital!.name}",
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
                    "${widget.hospital!.address}",
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
                      target: widget.hospital!.latLng!,
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
                        (widget.hospital!.type == 1)
                            ? "Ayurveda"
                            : "Homeopathy",
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
                        "${widget.hospital!.openHours}",
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
                if (widget.hospital!.phone != null)
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
                          "${widget.hospital!.phone}",
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
                        "Total Available beds: ",
                        // maxLines: 3,
                        style: TextStyle(
                          // fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.blockWidth * 3.2,
                          color: Colors.black,
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        "${widget.hospital!.totalBeds}",
                        // maxLines: 3,
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
                        "Current Available beds: ",
                        // maxLines: 3,
                        style: TextStyle(
                          // fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.blockWidth * 3.2,
                          color: Colors.black,
                          // overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        "${widget.hospital!.totalBeds}",
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
                if (widget.hospital!.ipd != 0)
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
                          "In-patient Number: ",
                          // maxLines: 3,
                          style: TextStyle(
                            // fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockWidth * 3.2,
                            color: Colors.black,
                            // overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          "${widget.hospital!.ipd}",
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
                if (widget.hospital!.opd != 0)
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
                          "Out-patient Number: ",
                          // maxLines: 3,
                          style: TextStyle(
                            // fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                            fontSize: SizeConfig.blockWidth * 3.2,
                            color: Colors.black,
                            // overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          "${widget.hospital!.opd}",
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
                  child: Center(
                    child: Text(
                      "Hospital Images",
                      maxLines: 3,
                      style: TextStyle(
                        // fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.blockWidth * 3.6,
                        color: Colors.black,
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
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
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.hospital!.photos!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return imageCard(uri: widget.hospital!.photos![index]);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: SizeConfig.blockHeight * 2,
                    bottom: SizeConfig.blockHeight * 0.5,
                    left: SizeConfig.blockWidth * 5,
                    // right: SizeConfig.blockWidth * 10,
                  ),
                  child: Center(
                    child: Text(
                      "Specialization",
                      maxLines: 3,
                      style: TextStyle(
                        // fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.blockWidth * 3.6,
                        color: Colors.black,
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
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
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.hospital!.specs!.length,
                    itemBuilder: (BuildContext context, int index) {
                      // return imageCard(uri: widget.hospital!.specs![index]);
                      return specializationCard(
                        name: widget.hospital!.specs![index].name,
                        desc: widget.hospital!.specs![index].desc,
                        prof: widget.hospital!.specs![index].doctor,
                        email: widget.hospital!.specs![index].email,
                        phone: widget.hospital!.specs![index].phone,
                      );
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: SizeConfig.blockHeight * 2,
                    bottom: SizeConfig.blockHeight * 0.5,
                    left: SizeConfig.blockWidth * 5,
                    // right: SizeConfig.blockWidth * 10,
                  ),
                  child: Center(
                    child: Text(
                      "Hospital Facilities",
                      maxLines: 3,
                      style: TextStyle(
                        // fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: SizeConfig.blockWidth * 3.6,
                        color: Colors.black,
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
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
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.hospital!.facilities!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return facilitesCard(
                        name: widget.hospital!.facilities![index].name,
                        desc: widget.hospital!.facilities![index].desc,
                        uri: widget.hospital!.facilities![index].photo,
                      );
                    },
                  ),
                  // child: ListView(
                  //   scrollDirection: Axis.horizontal,
                  //   children: [
                  //     facilitesCard(
                  //       name: "Ayurveda Dispensary",
                  //       desc: "All ayurveda and unani medicines available",
                  //       uri:
                  //           "https://newint.org/sites/default/files/blog/majority/2015/07/21/21.07.15-india-chemist-590.jpg",
                  //     ),
                  //     facilitesCard(
                  //       name: "Operation theatres available",
                  //       desc: "All Ayurvedic facilities available",
                  //       uri:
                  //           "https://static.toiimg.com/thumb/msid-78715506,width-1280,height-720,resizemode-4/.jpg",
                  //     ),
                  //     facilitesCard(
                  //       name: "Ayurveda Dispensary",
                  //       desc: "All ayurveda and unani medicines available",
                  //       uri:
                  //           "https://newint.org/sites/default/files/blog/majority/2015/07/21/21.07.15-india-chemist-590.jpg",
                  //     ),
                  //     facilitesCard(
                  //       name: "Operation theatres available",
                  //       desc: "All Ayurvedic facilities available",
                  //       uri:
                  //           "https://static.toiimg.com/thumb/msid-78715506,width-1280,height-720,resizemode-4/.jpg",
                  //     ),
                  //     facilitesCard(
                  //       name: "Operation theatres available",
                  //       desc: "All Ayurvedic facilities available",
                  //       uri:
                  //           "https://static.toiimg.com/thumb/msid-78715506,width-1280,height-720,resizemode-4/.jpg",
                  //     ),
                  //   ],
                  // ),
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
