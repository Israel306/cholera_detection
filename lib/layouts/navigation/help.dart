import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  final Completer<GoogleMapController> _controller = Completer();
  LatLng? _currentLocation;

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  // Function to get user location
  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    // Request permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    // Get current position
    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      _currentLocation = LatLng(position.latitude, position.longitude);
    });

    // Move camera to current location
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: _currentLocation!,
          zoom: 14.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentLocation == null
          ? const Center(child: CircularProgressIndicator()) // Show loading indicator
          : GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: _currentLocation!,
          zoom: 14.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
    );
  }
}


//
// import 'package:flutter/material.dart';
//
// class Help extends StatefulWidget {
//   const Help({super.key});
//
//   @override
//   State<Help> createState() => _HelpState();
// }
//
// class _HelpState extends State<Help> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'assets/cholera.png',
//               fit: BoxFit.cover,
//             ),
//             const SizedBox(width: 5),
//             const Text(
//               'Cholera Detector',
//               style: TextStyle(
//                 color: Color(0xFF176C90),
//                 fontSize: 24,
//                 fontFamily: "Inter",
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ],
//         ),
//
//
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             const Divider(color: Colors.grey, thickness: 2,),
//             SizedBox(height: 10),// Horizontal line after AppBar
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     "Emergency Help",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF176C90),
//
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   const Text(
//                     "Get Immediate Medical Assistance Near You",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   const SizedBox(height: 10),
//                   TextField(
//                     decoration: InputDecoration(
//                       hintText: "Your location",
//                       prefixIcon: const Icon(Icons.location_on_outlined, color: Colors.blue),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20),
//                         borderSide: const BorderSide(color: Colors.grey),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 20),
//                   // Placeholder for Map - Replace with Google Maps widget
//                   Container(
//                     height: 400,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: ClipRRect(
//                       borderRadius: BorderRadius.circular(10),
//                       child: Image.asset(
//                         'assets/map.png', // Replace with your image path
//                         fit: BoxFit.cover, // Ensures the image covers the entire container
//                       ),
//                     ),
//                   ),
//
//                   const SizedBox(height: 20),
//                   // Hospital Details
//                   Container(
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: Colors.white,
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black12,
//                           blurRadius: 5,
//                           spreadRadius: 2,
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: const [
//                         Text(
//                           "General Hospital",
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.black87,
//                           ),
//                         ),
//                         SizedBox(height: 5),
//                         Text(
//                           "15 Adeola Street, Victoria Island, Lagos, Nigeria",
//                           style: TextStyle(fontSize: 14, color: Colors.black54),
//                         ),
//                         SizedBox(height: 5),
//                         Text(
//                           "1hr 13mins (106 km)",
//                           style: TextStyle(fontSize: 14, color: Colors.black54),
//                         ),
//                         SizedBox(height: 5),
//                         Text(
//                           "+234 800 123 4567",
//                           style: TextStyle(fontSize: 14, color: Colors.blue),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//
//
