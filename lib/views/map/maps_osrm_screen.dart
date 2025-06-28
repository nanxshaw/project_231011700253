import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class OSRMMapScreen extends StatefulWidget {
  @override
  _OSRMMapScreenState createState() => _OSRMMapScreenState();
}

class _OSRMMapScreenState extends State<OSRMMapScreen> {
  GoogleMapController? mapController;

  final LatLng start = LatLng(-6.200000, 106.816666); // Jakarta
  final LatLng end = LatLng(-6.914744, 107.609810);   // Bandung

  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};

  @override
  void initState() {
    super.initState();
    _loadRoute();
  }

  Future<void> _loadRoute() async {
    final url =
        'https://router.project-osrm.org/route/v1/driving/${start.longitude},${start.latitude};${end.longitude},${end.latitude}?overview=full&geometries=geojson';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final route = data['routes'][0]['geometry']['coordinates'];

      List<LatLng> polylinePoints = [];

      for (var point in route) {
        polylinePoints.add(LatLng(point[1], point[0])); // [lon, lat]
      }

      setState(() {
        _markers = {
          Marker(markerId: MarkerId("start"), position: start),
          Marker(markerId: MarkerId("end"), position: end),
        };

        _polylines = {
          Polyline(
            polylineId: PolylineId("route"),
            color: Colors.blue,
            width: 5,
            points: polylinePoints,
          ),
        };
      });
    } else {
      print("Failed to load route");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("OSRM Route")),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: start,
          zoom: 7,
        ),
        onMapCreated: (controller) => mapController = controller,
        markers: _markers,
        polylines: _polylines,
      ),
    );
  }
}
