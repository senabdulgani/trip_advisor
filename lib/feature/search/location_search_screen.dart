import 'package:flutter/material.dart';
import 'package:trip_advisor/feature/search/models/autocomplate_prediction.dart';
import 'package:trip_advisor/feature/search/models/place_auto_complate_response.dart';
import 'package:trip_advisor/product/service/network_utility.dart';
import 'components/location_list_tile.dart';
import 'constants.dart';

class SearchLocationScreen extends StatefulWidget {
  const SearchLocationScreen({Key? key}) : super(key: key);

  @override
  State<SearchLocationScreen> createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState extends State<SearchLocationScreen>  {

  List<AutocompletePrediction> placePredictions = [];

  void placeAutocomplate(String query) async {
    Uri uri = Uri.https(
        "maps.googleapis.com",
        'maps/api/place/autocomplete/json',
        {
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
      height: MediaQuery.of(context).size.height * 0.6,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: placePredictions.length,
              itemBuilder: (context, index) => LocationListTile(
                location: placePredictions[index].description!,
                controller: TextEditingController(),
              ),
            ),
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
                backgroundColor: secondaryColor10LightTheme,
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
          Form(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: TextFormField(
                onChanged: (value) {
                  placeAutocomplate(value);
                },
                textInputAction: TextInputAction.search,
                decoration: const InputDecoration(
                  hintText: "Search locations",
                  prefixIcon: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Icon(Icons.search),
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
