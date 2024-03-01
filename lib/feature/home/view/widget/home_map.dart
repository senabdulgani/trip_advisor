import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:trip_advisor/feature/home/view/mixin/home_map_mixin.dart';
import 'package:trip_advisor/product/state/provider/navigation_provider.dart';

class MyMapScreen extends StatefulWidget {
  const MyMapScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyMapScreenState createState() => _MyMapScreenState();
}

class _MyMapScreenState extends State<MyMapScreen> with HomeMapMixin {


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: currentP == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GoogleMap(
                onMapCreated: ((GoogleMapController controller) =>
                    context.read<NavigationHelper>().mapController.complete(controller)),
                initialCameraPosition: CameraPosition(
                  target: school,
                  zoom: 13,
                ),
                markers: context.watch<NavigationHelper>().markers.isNotEmpty
                    ? Set<Marker>.of(
                        context.watch<NavigationHelper>().markers.values)
                    : {},
                polylines: context.watch<NavigationHelper>().polylines.isNotEmpty
                    ? Set<Polyline>.of(
                        context.watch<NavigationHelper>().polylines.values)
                    : {},
              ),
      ),
    );
  }
}
