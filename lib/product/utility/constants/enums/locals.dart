import 'package:flutter/material.dart';

/// Project Locale enum for operation and configuration
enum Locales {
  tr(Locale('tr', 'TR')),
  en(Locale('en', 'US'));

  final Locale locale;
  const Locales(this.locale);

}
