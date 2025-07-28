import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatelessWidget {
  final double destinationLat ; // Example: Dhaka
  final double destinationLng ;

  const LocationScreen({super.key, required this.destinationLat, required this.destinationLng});

  @override
  Widget build(BuildContext context) {
    LatLng destination = LatLng(destinationLat, destinationLng);

    return SizedBox(
      height: 250.h,
      child: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: destination,
              zoom: 14,
            ),
            markers: {
              Marker(
                markerId: const MarkerId('target'),
                position: destination,
                infoWindow: const InfoWindow(title: 'Destination'),
              )
            },
          ),







          // Positioned(
          //   bottom: 20,
          //   left: 20,
          //   right: 20,
          //   child: ElevatedButton(
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (_) => DirectionScreen(
          //             destinationLat: destinationLat,
          //             destinationLng: destinationLng,
          //           ),
          //         ),
          //       );
          //     },
          //     child: const Text('Get Directions'),
          //   ),
          // )
        ],
      ),
    );
  }
}