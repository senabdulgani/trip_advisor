import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trip_advisor/core/costum_left_text.dart';
import 'package:trip_advisor/feature/search/components/location_list_tile.dart';
import 'package:trip_advisor/feature/search/constants.dart';
import 'package:trip_advisor/feature/search/view/mixin/location_search_mixin.dart';
import 'package:trip_advisor/product/state/provider/latest_location.dart';

class NavigationInputsBottomSheet extends StatefulWidget {
  const NavigationInputsBottomSheet({
    super.key,
  });

  @override
  State<NavigationInputsBottomSheet> createState() =>
      _NavigationInputsBottomSheetState();
}

class _NavigationInputsBottomSheetState
    extends State<NavigationInputsBottomSheet> with NavigationInputsMixin {

  late TextEditingController _fromController;
  late TextEditingController _toController;


  @override
  void initState() {
    super.initState();
    _fromController = TextEditingController(text: context.read<LatestLocation>().latestFromLocation);
    _toController = TextEditingController(text: context.read<LatestLocation>().latestToLocation);
  }

  @override
  void dispose() {
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
  }

  bool isFrom = true;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(8),
        ),
      ),
      height: deviceHeight * 0.6,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
        child: Column(
          children: <Widget>[
            const CostumHeaderInLeft(title: 'Route'),
            // todo Add the category services logo in future
            TextFormField(
              controller: _fromController,
              onChanged: (value) {
                placeAutocomplate(value);
                setState(() {
                  isFrom = true;
                });
              },
              decoration: inputNavigationDecoration(
                  'From', Icons.location_on_rounded, false),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 24.0, right: 12),
              child: Divider(
                height: 0,
                color: Colors.black,
                thickness: 0,
              ),
            ),
            TextFormField(
              controller: _toController,
              onChanged: (value) {
                placeAutocomplate(value);
                setState(() {
                  isFrom = false;
                });
                },
              decoration: inputNavigationDecoration(
                  'To', Icons.flag, true),
              ),
            Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.gps_fixed,
                  color: textColorLightTheme,
                ),
                label: const Text("Use my Current Location"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                  foregroundColor: textColorLightTheme,
                  elevation: 0,
                  fixedSize: const Size(double.infinity, 40),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.3,
              child: ListView.builder(
                itemCount: placePredictions.length,
                itemBuilder: (context, index) => LocationListTile(
                  location: placePredictions[index].description!,
                  controller: isFrom ? _fromController : _toController, // todo Burada kullanıcı hangi controller ı seçti ona bak.
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration inputNavigationDecoration(String text, IconData icon, bool isFirst) {
    return InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: 
              UnderlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: isFirst ?
                const BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ) :
                const BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
              ),
              
              contentPadding: const EdgeInsets.all(12.0),
              prefixIcon: Icon(icon),
              hintText: text,
              hintStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey),
              suffixIcon: const Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                child: VerticalDivider(
                  color: Colors.black,
                  thickness: 0,
                ),
              ),
              suffix: const Text(
                'Map',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            );
  }

}