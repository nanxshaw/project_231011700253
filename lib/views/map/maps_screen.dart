import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:geocoding/geocoding.dart';

class MapsScreen extends StatefulWidget {
  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  GoogleMapController? mapController;

  final LatLng start = LatLng(-6.200000, 106.816666); // Jakarta
  LatLng? destination;

  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  double zoomLevel = 7;

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _markers.add(Marker(markerId: MarkerId("start"), position: start));
  }

  Future<void> _searchDestination(String address) async {
    try {
      List<Location> locations = await locationFromAddress(address);
      if (locations.isNotEmpty) {
        destination = LatLng(locations[0].latitude, locations[0].longitude);
        _markers.removeWhere((m) => m.markerId.value == "end");
        _markers.add(Marker(
            markerId: MarkerId("end"),
            position: destination!,
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue)));

        _polylines.clear();
        await _loadRoute();

        mapController?.animateCamera(CameraUpdate.newLatLngZoom(destination!, 10));
      }
    } catch (e) {
      print("Search error: $e");
    }
  }

  Future<void> _loadRoute() async {
    if (destination == null) return;

    final url =
        'https://router.project-osrm.org/route/v1/driving/${start.longitude},${start.latitude};${destination!.longitude},${destination!.latitude}?overview=full&geometries=geojson';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final coords = data['routes'][0]['geometry']['coordinates'];

      List<LatLng> polylinePoints = coords
          .map<LatLng>((p) => LatLng(p[1], p[0]))
          .toList();

      _polylines.add(Polyline(
        polylineId: PolylineId("route"),
        color: Colors.blue,
        width: 5,
        points: polylinePoints,
      ));

      setState(() {});
    } else {
      print("Failed to get route: ${response.body}");
    }
  }

  void _zoomIn() {
    zoomLevel += 1;
    mapController?.animateCamera(
        CameraUpdate.newCameraPosition(CameraPosition(target: start, zoom: zoomLevel)));
  }

  void _zoomOut() {
    zoomLevel -= 1;
    mapController?.animateCamera(
        CameraUpdate.newCameraPosition(CameraPosition(target: start, zoom: zoomLevel)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maps',
            style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF4A00E0),
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(target: start, zoom: zoomLevel),
            onMapCreated: (controller) => mapController = controller,
            markers: _markers,
            polylines: _polylines,
            myLocationEnabled: false,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
          ),
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Material(
              elevation: 6,
              borderRadius: BorderRadius.circular(16),
              child: TextField(
                controller: _searchController,
                onSubmitted: (val) => _searchDestination(val),
                decoration: InputDecoration(
                  hintText: "Cari tujuan (cth: Bandung)...",
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 16,
            child: Column(
              children: [
                FloatingActionButton(
                  heroTag: "zoomIn",
                  mini: true,
                  onPressed: _zoomIn,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.add, color: Colors.black),
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: "zoomOut",
                  mini: true,
                  onPressed: _zoomOut,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.remove, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
