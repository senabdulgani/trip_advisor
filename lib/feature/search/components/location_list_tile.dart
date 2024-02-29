import 'package:flutter/material.dart';
import '../constants.dart';

class LocationListTile extends StatelessWidget {
  const LocationListTile({
    Key? key,
    required this.location,
    required this.controller, 
  }) : super(key: key);

  final String location;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            controller.text = location;
          },
          horizontalTitleGap: 0,
          leading: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.location_on_outlined,
            ),
          ),
          title: Text(
            location,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const Divider(
          height: 2,
          thickness: 2,
          color: secondaryColor5LightTheme,
        ),
      ],
    );
  }
}
