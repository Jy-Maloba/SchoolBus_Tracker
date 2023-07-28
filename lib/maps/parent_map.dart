import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart' as places;

LatLng _parentLocation = const LatLng(-1.3107, 36.8250);
// LatLng _driverLocation = LatLng(-1.1532, 36.9629);

class ParentMapsPage extends StatefulWidget {
  @override
  _ParentMapsPageState createState() => _ParentMapsPageState();
}

class _ParentMapsPageState extends State<ParentMapsPage> {
  GoogleMapController? _mapController;
  // Default location (San Francisco).

  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      _mapController = controller;
    });
  }

  void _moveToLocation(LatLng location) {
    _mapController?.animateCamera(CameraUpdate.newLatLng(location));
  }

  void _onSearchPlace(String place) async {
    final places.GoogleMapsPlaces _places =
    places.GoogleMapsPlaces(apiKey: 'API_KEY');

    places.PlacesSearchResponse response = await _places.searchByText(place);
    if (response.isOkay) {
      if (response.results.isNotEmpty) {
        final places.PlacesSearchResult placeResult = response.results.first;
        final location = placeResult.geometry?.location;
        if (location != null) {
          setState(() {
            _parentLocation = LatLng(location.lat, location.lng);
          });
          _moveToLocation(_parentLocation);
        }
      } else {
        // Show a snackbar or a toast message indicating that the place was not found.
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Place not found')),
        );
      }
    } else {
      // Show an error message if the search request failed.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error searching place')),
      );
    }
  }

  CollectionReference collection = FirebaseFirestore.instance.collection('parent');

  Future _saveLocationToFirestore(longitude, latitude) async{
    await FirebaseFirestore.instance.collection('parent').doc('locationID').update(
        {
          // Save _parentLocation.latitude and _parentLocation.longitude to Firestore
          'longitude': _parentLocation.longitude,
          'latitude': _parentLocation.latitude,
          // under the current parent's document.
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parent Maps'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          // Add a search bar for the user to search for a place.
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onFieldSubmitted: _onSearchPlace,
              decoration: InputDecoration(
                filled: true,
                hintText: 'Search a place...',
                prefixIcon: const Icon(Icons.search),
                contentPadding: const EdgeInsets.only(left: 5, bottom: 5, right: 5),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(target: _parentLocation, zoom: 15),
              markers: <Marker>{
                Marker(
                  markerId: const MarkerId('parentLocation'),
                  position: _parentLocation,
                  icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
                  infoWindow: const InfoWindow(
                      title: 'Parent', snippet: 'Parent Location'),
                  draggable: true,
                  onDragEnd: (LatLng newPosition) {
                    setState(() {
                      _parentLocation = newPosition;
                      _saveLocationToFirestore(
                          _parentLocation.longitude,
                          _parentLocation.latitude
                      );
                    });
                  },
                ),
              },
              myLocationEnabled: true, // Enable current location button
              myLocationButtonEnabled: true,
            ),
          ),
        ],
      ),
    );
  }
}

class ParentLocation{
  final String latitude;
  final String longitude;

  ParentLocation({
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toJson()=>{
    'latitude': _parentLocation.latitude,
    'longitude': _parentLocation.longitude,
  };

  static ParentLocation fromJson(Map<String, dynamic> json) => ParentLocation(
      latitude: json['latitude'],
      longitude: json['longitude'],
  );
}
