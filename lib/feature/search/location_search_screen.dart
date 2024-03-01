import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:trip_advisor/feature/search/models/autocomplate_prediction.dart';
import 'package:trip_advisor/feature/search/models/place_auto_complate_response.dart';
import 'package:trip_advisor/product/service/network_utility.dart';
import 'package:trip_advisor/product/state/provider/navigation_provider.dart';
import 'components/location_list_tile.dart';
import 'constants.dart';

class SearchLocationScreen extends StatefulWidget {
  const SearchLocationScreen({Key? key}) : super(key: key);

  @override
  State<SearchLocationScreen> createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState extends State<SearchLocationScreen> {
  List<AutocompletePrediction> placePredictions = [];

  final TextEditingController _searchController = TextEditingController();

  late final NavigationHelper navigationProvider =
      context.read<NavigationHelper>();

  void placeAutocomplate(String query) async {
    Uri uri =
        Uri.https("maps.googleapis.com", 'maps/api/place/autocomplete/json', {
      "input": query,
      "key": apiKey,
    });
    String? response = await NetworkUtility.fetchUrl(uri);
    if (response != null) {
      PlaceAutocompleteResponse result =
          PlaceAutocompleteResponse.parseAutocompleteResult(response);
      if (result.predictions != null) {
        setState(() {
          placePredictions = result.predictions!;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        children: [
          placePredictions.isEmpty
              ? const Expanded(
                  child: Center(child: CircularProgressIndicator()))
              : Expanded(
                  child: ListView.builder(
                    itemCount: placePredictions.length,
                    itemBuilder: (context, index) => LocationListTile(
                      location: placePredictions[index].description!,
                      controller: _searchController,
                    ),
                  ),
                ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: ElevatedButton.icon(
              onPressed: () {
                navigationProvider.determinePosition().then(
                  (position) {
                    navigationProvider.cameraToPosition(
                      LatLng(position.latitude, position.longitude),
                      15,
                      0,
                    );
                  },
                );
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.gps_fixed,
                color: textColorLightTheme,
              ),
              label: const Text("Go to Current Location"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow.shade300,
                foregroundColor: textColorLightTheme,
                elevation: 0,
                fixedSize: const Size(double.infinity, 40),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
            ),
          ),
          const Divider(
            height: 4,
            thickness: 4,
            color: secondaryColor5LightTheme,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(
              16,
              0,
              16,
              16,
            ),
            child: TextFormField(
              controller: _searchController,
              onChanged: (value) {
                placeAutocomplate(value);
              },
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                contentPadding: EdgeInsets.all(12.0),
                prefixIcon: Icon(Icons.location_on_rounded),
                hintText: "Locations...",
                hintStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
                suffixIcon: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                  child: VerticalDivider(
                    color: Colors.black,
                    thickness: 0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
