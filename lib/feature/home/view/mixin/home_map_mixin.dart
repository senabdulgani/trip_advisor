import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:trip_advisor/feature/home/view/widget/home_map.dart';
import 'package:trip_advisor/product/state/provider/navigation_provider.dart';

mixin HomeMapMixin on State<MyMapScreen> {

  LatLng myHome = const LatLng(39.9845136, 32.7671988);
  LatLng school = const LatLng(39.9016974, 32.779087);

  LatLng? _currentP;
  get currentP => _currentP;


  @override
  void dispose() {
    context.read<NavigationHelper>().mapController.future.then((value) => value.dispose());
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    context.read<NavigationHelper>().determinePosition().then((position) => 
      setState(() {
        _currentP = LatLng(position.latitude, position.longitude);
      }));
  }
}
