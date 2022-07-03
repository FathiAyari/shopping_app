import 'package:aicha/constants/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/action_button.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late double longitude;
  late double altitude;

  getCurrentPosition() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        // Get.to(HomePageAdmin());
      }
    } else {
      var position = await Geolocator.getCurrentPosition();

      setState(() {
        longitude = position.longitude;
        altitude = position.altitude;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.transparent,
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('markers').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var shops = snapshot.data!.docs.toList();
            Set<Marker> markers = {};
            for (var data in shops) {
              markers.add(Marker(
                  onTap: () async {
                    List<Placemark> placemarks =
                        await placemarkFromCoordinates(data.get("position").latitude, data.get("position").longitude);
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        backgroundColor: Colors.transparent,
                        builder: (BuildContext context) {
                          return Container(
                              margin: EdgeInsets.only(bottom: Constants.screenHeight * 0.009),
                              height: Constants.screenHeight * 0.3,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  Column(
                                    children: [
                                      const Text("Rades",
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Color(0xffa0c4f6))),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Image.asset("assets/images/mg.png", height: Constants.screenHeight * 0.09),
                                            Text(
                                              "${data.id}",
                                              style:
                                                  TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xffa0c4f6)),
                                            ),
                                            Spacer(),
                                            IconButton(
                                                onPressed: () async {
                                                  final Uri launchUri = Uri(
                                                    scheme: 'tel',
                                                    path: data.get("phone"),
                                                  );
                                                  await launchUrl(launchUri);
                                                },
                                                icon: Icon(
                                                  Icons.phone,
                                                  color: Color(0xffa0c4f6),
                                                )),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text("Adresse:",
                                                style: TextStyle(
                                                    fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xffa0c4f6))),
                                            Text(
                                                "${placemarks[0].country}-${placemarks[0].administrativeArea}-${placemarks[0].name}",
                                                style: TextStyle(
                                                    fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xffa0c4f6))),
                                          ],
                                        ),
                                      ),
                                      buildActionButton("Explorer les produits", () {}),
                                    ],
                                  ),
                                  IconButton(
                                      splashColor: Colors.transparent,
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.close,
                                        color: Colors.redAccent,
                                      )),
                                ],
                              ));
                        },
                        context: context);
                  },
                  markerId: MarkerId(data.id),
                  position: LatLng(data.get('position').latitude, data.get('position').longitude)));
            }
            return Stack(
              children: [
                GoogleMap(
                  markers: markers,
                  trafficEnabled: true,
                  myLocationEnabled: true,
                  scrollGesturesEnabled: true,
                  onLongPress: (test) async {},
                  initialCameraPosition: CameraPosition(
                    zoom: 6.7,
                    target: LatLng(36.820719, 9.776173),
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    ));
  }
}
