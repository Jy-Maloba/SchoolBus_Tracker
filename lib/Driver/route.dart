import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class DriverRoute extends StatefulWidget {
  const DriverRoute({Key? key}) : super(key: key);

  @override
  State<DriverRoute> createState() => _DriverRouteState();
}

class _DriverRouteState extends State<DriverRoute> {

  final LatLng _parentLocation = const LatLng(-1.3107, 36.8250);
  final LatLng _driverLocation = const LatLng(-1.1532, 36.9629);
  final String googleApiKey = 'AIzaSyB5fMSyxV9eF6OpB5k2xILMAJyG-Desags';

  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;

  void getCurrentLocation(){
    Location location = Location();
    
    location.getLocation().then((location) {
      currentLocation = location;
    });
  }

  void getPolypoints() async{
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleApiKey,
        PointLatLng(_driverLocation.latitude, _driverLocation.longitude),
        PointLatLng(_parentLocation.latitude, _parentLocation.longitude)
    );

    if (result.points.isNotEmpty){
      result.points.forEach(
              (PointLatLng point)=> polylineCoordinates.add(
                  LatLng(point.latitude, point.longitude)
              )
      );
      setState(() {

      });
    }
  }

  @override
  void initState() {
    // getCurrentLocation();
    getPolypoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ROUTE'),
      ),
      // body: currentLocation == null ? const Center(child: Text('loading..'))
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _driverLocation,
          zoom: 14.5,
        ),

        polylines: {
          Polyline(
            polylineId: const PolylineId('Driver route'),
            points: polylineCoordinates,
            color: Colors.deepPurple,
            width: 6,
          ),

        },
        markers: {
          // Marker(
          //   markerId: MarkerId('current location'),
          //   position: LatLng(currentLocation!.latitude!, currentLocation!.longitude!),
          //   draggable: true,
          // ),
          Marker(
            markerId: const MarkerId('driver location'),
            position: _driverLocation,
            draggable: true,
          ),
          Marker(
            markerId: const MarkerId('Parent location'),
            position: _parentLocation,
            draggable: true,
          )
        },
      ),
    );
  }
}

