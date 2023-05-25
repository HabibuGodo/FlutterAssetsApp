import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSearchScreen extends StatelessWidget {
  const MapSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // return fullpage with image
    return const Scaffold(
      body: Center(
        // image
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: LatLng(-6.813602102466508, 39.28377881601517),
            zoom: 14.0,
          ),
        ),
      ),
    );
  }
}
