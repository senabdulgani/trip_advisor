import 'package:flutter/material.dart';
import 'package:trip_advisor/feature/search/view/mixin/location_search_mixin.dart';
import 'components/location_list_tile.dart';
import 'constants.dart';

class SearchLocationScreen extends StatefulWidget {
  const SearchLocationScreen({Key? key}) : super(key: key);

  @override
  State<SearchLocationScreen> createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState extends State<SearchLocationScreen> with LocationSearchMixin {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: placePredictions.length,
              itemBuilder: (context, index) => LocationListTile(
                press: () {
                  
                },
                location: placePredictions[index].description!,
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
