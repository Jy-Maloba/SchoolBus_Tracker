import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';


class DriverMap extends StatefulWidget {
  const DriverMap({Key? key}) : super(key: key);

  @override
  State<DriverMap> createState() => _DriverMapState();
}

class _DriverMapState extends State<DriverMap> {

  LatLng _parentLocation = LatLng(-1.3107, 36.8250);

  // final FirebaseAuth _auth = FirebaseAuth.instance;
  late GoogleMapController _mapController;
  final Set<Marker> _markers = {};
  LatLng _driverLocation = LatLng(-1.1636, 36.9582);

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _listenToParentLocationUpdates();
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      _driverLocation = LatLng(position.latitude, position.longitude);
      _markers.add(
        Marker(
          markerId: const MarkerId('driver'),
          position: _driverLocation,
          onDragEnd: (LatLng newPosition) {
            setState(() {
              _driverLocation = newPosition;
              _saveLocationToFirestore(
                  _driverLocation.longitude,
                  _driverLocation.latitude
              );
            });
          },
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          infoWindow: const InfoWindow(title: 'Driver', snippet: 'Your Location'),
        ),
      );
    });
  }


  // Method to listen to the parent's location updates from Firebase.
  void _listenToParentLocationUpdates() {
    DatabaseReference parentLocationRef =
    FirebaseDatabase.instance.ref().child('parent');

    // Listen to changes in the parent_location node in the database.
    parentLocationRef.onValue.listen((event) {
      if (event.snapshot.value != null) {
        // Additional null check to ensure the data is not null.

        // Perform type conversion to ensure the data is of type Map<dynamic, dynamic>.
        Map<dynamic, dynamic>? values =
        event.snapshot.value as Map<dynamic, dynamic>?;

        if (values != null) {
          // Now you can access the data safely.
          double? lat = values['latitude'];
          double? lng = values['longitude'];

          if (lat != null && lng != null) {
            // If the latitude and longitude are valid, create a LatLng object
            // representing the parent's location.
            LatLng parentLocation = LatLng(lat, lng);

            // Update the state to add the parent marker on the map and create the route.
            setState(() {
              _parentLocation = parentLocation;
              _markers.add(
                Marker(
                  markerId: const MarkerId('parent'),
                  position: parentLocation,
                  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
                  infoWindow: const InfoWindow(
                      title: 'Parent', snippet: 'Parent Location'),
                ),
              );
              _createRoute(parentLocation);
            });
          }
        }
      }
    });
  }

  void _createRoute(LatLng parentLocation) {
    setState(() {
      _markers.add(
        Marker(
          markerId: const MarkerId('destination'),
          position: _parentLocation,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          infoWindow: const InfoWindow(title: 'Destination', snippet: 'Parent Location'),
        ),
      );
      _buildPolylines();
    });
  }

  // void _moveToLocation(LatLng location) {
  //   _mapController?.animateCamera(CameraUpdate.newLatLng(location));
  // }

  Future _saveLocationToFirestore(latitude, longitude) async{
    await FirebaseFirestore.instance.collection('driver').doc('locationID').update(
        {
          // Save _parentLocation.latitude and _parentLocation.longitude to Firestore
          'latitude': _driverLocation.latitude,
          'longitude': _driverLocation.longitude,

          // under the current parent's document.
        }
    );
  }

  Set<Polyline> _buildPolylines(){
    return {
      Polyline(
        polylineId:  const PolylineId('parentRoute'),
        points: [
          LatLng(_driverLocation.latitude, _driverLocation.longitude),
          LatLng(_parentLocation.latitude, _parentLocation.longitude),
        ],
        color: Colors.blue,
        width: 4,
      )
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Driver Map'),
        backgroundColor: Colors.deepPurple,
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _parentLocation,
          zoom: 16.0,
        ),
        onMapCreated: (controller) {
          setState(() {
            _mapController = controller;
          });
        },

        markers: _markers,
        polylines: _buildPolylines(),
      ),
    );


  }
}

class DriverLocation{
  String id;
  final String latitude;
  final String longitude;

  DriverLocation({
    this.id = '',
    required this.latitude,
    required this.longitude,
  });

}


