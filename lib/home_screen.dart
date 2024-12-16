import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late GoogleMapController googleMapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Map Screen"),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: const CameraPosition(
          zoom: 16.0,
          target: LatLng(23.18618077214386, 89.50080140316282),
        ),
        onTap: (LatLng latLng) {
          print(latLng);
        },
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          googleMapController = controller;
        },
        trafficEnabled: true,
        markers: <Marker>{
          Marker(
            markerId: const MarkerId("initial-position"),
            position: const LatLng(23.18618077214386, 89.50080140316282),
            infoWindow: InfoWindow(
              title: "Home",
              onTap: () {
                print("On tapped home");
              },
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(
                BitmapDescriptor.hueOrange),
            draggable: true,
          ),
          Marker(
            markerId: const MarkerId("home"),
            position: const LatLng(23.185840604818065, 89.50092673301697),
            draggable: true,
            onDragStart: (LatLng onStartLatLng) {
              print("On start drag $onStartLatLng");
            },
            onDragEnd: (LatLng onEndLatLng) {
              print("On end drag $onEndLatLng");
            },
          ),
        },
        circles: <Circle>{
          Circle(
            circleId: const CircleId("initial-circle"),
            fillColor: Colors.red.withOpacity(.3),
            center: const LatLng(23.185909949072826, 89.50093243271112),
            radius: 30,
            strokeColor: Colors.blue,
            strokeWidth: 5,
            visible: true,
            onTap: () {
              print("Entered into Novo Nest zone");
            },
          ),
          Circle(
            circleId: const CircleId("land-circle"),
            fillColor: Colors.blue.withOpacity(.3),
            center: const LatLng(23.185561686452512, 89.50120065361261),
            radius: 50,
            strokeColor: Colors.blue,
            strokeWidth: 5,
            visible: true,
            onTap: () {
              print("Entered into Novo Nest zone");
            },
          ),
        },
      ),
    );
  }
}
