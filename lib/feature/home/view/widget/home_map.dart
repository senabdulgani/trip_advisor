import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trip_advisor/feature/home/view/mixin/home_map_mixin.dart';

class MyMapScreen extends StatefulWidget {
  const MyMapScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyMapScreenState createState() => _MyMapScreenState();
}

class _MyMapScreenState extends State<MyMapScreen> with HomeMapMixin { 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map'),
      ),
      body: currentP == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : GoogleMap(
              onMapCreated: ((GoogleMapController controller) =>
                  mapController.complete(controller)),
              initialCameraPosition: CameraPosition(
                target: school,
                zoom: 13,
              ),
              markers: {
                Marker(
                  markerId: const MarkerId("_currentLocation"),
                  icon: BitmapDescriptor.defaultMarker,
                  position: currentP!,
                ),
                 Marker(
                    markerId: const MarkerId("_sourceLocation"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: school),
                 Marker(
                    markerId: const MarkerId("_destionationLocation"),
                    icon: BitmapDescriptor.defaultMarker,
                    position: myHome)
              },
              polylines: Set<Polyline>.of(polylines.values),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: goToCurrentLocation,
        child: const Icon(Icons.location_on),
      ),
    );
  }

}
