
part of '../home_view.dart';

class HomeMapBody extends StatefulWidget {
  const HomeMapBody({super.key});

  @override
  State<HomeMapBody> createState() => HomeMapBodyState();
}

class HomeMapBodyState extends State<HomeMapBody> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(40.8733311,29.2530772),
    zoom: 15.59,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2, 
            child: GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          const Text('Change Language').tr(),
          ElevatedButton(
            onPressed: (){
            ProductLocalization.updateLanguage(
              context: context,
              value: Locales.en,
              );
          }, child: const Text('Change Language')),
        ],
      ),
    );
  }

  
}