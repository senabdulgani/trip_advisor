import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:trip_advisor/feature/home/view/mixin/home_view_mixin.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trip_advisor/product/init/language/locale_keys.g.dart';
import 'package:trip_advisor/product/init/product_localization.dart';
import 'package:trip_advisor/product/utility/constants/enums/locals.dart';

part 'widget/home_app_bar.dart';
part 'widget/home_map.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with HomeViewMixin {

  
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: HomeAppBar(),
      body: HomeMapBody(),
    );
  }
}

