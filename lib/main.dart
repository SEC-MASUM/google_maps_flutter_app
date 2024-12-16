import 'package:flutter/material.dart';
import 'package:google_maps_flutter_app/home_screen.dart';

void main(){
  runApp(const GoogleMapApp());
}
class GoogleMapApp extends StatelessWidget {
  const GoogleMapApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}