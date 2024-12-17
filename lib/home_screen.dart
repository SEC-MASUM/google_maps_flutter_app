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
        compassEnabled: true,
        // scrollGesturesEnabled: false,
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
        polylines: <Polyline>{
          const Polyline(
              polylineId: PolylineId("initial-polyline"),
              color: Colors.amber,
              width: 3,
              jointType: JointType.round,
              points: <LatLng>[
                LatLng(23.18406383865313, 89.50221452862024),
                LatLng(23.18439330496788, 89.50218368321657),
                LatLng(23.185597745544666, 89.50261451303959),
                LatLng(23.185781431025568, 89.50206633657217)
              ])
        },
        polygons: <Polygon>{
          Polygon(
            polygonId: const PolygonId("initial-polygon"),
            fillColor: Colors.purple.withOpacity(0.4),
            strokeColor: Colors.lightBlue,
            strokeWidth: 2,
            points: const <LatLng>[
              LatLng(23.17575448543142, 89.49260249733925),
              LatLng(23.171762668683115, 89.50581774115562),
              LatLng(23.180361678689593, 89.50727082788944),
              LatLng(23.184192050149875, 89.49105989187956),
            ],
          ),
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(
              const CameraPosition(
                zoom: 16,
                target: LatLng(23.18618077214386, 89.50080140316282),
              ),
            ),
          );
        },
        child: const Icon(Icons.location_on),
      ),
    );
  }
}
