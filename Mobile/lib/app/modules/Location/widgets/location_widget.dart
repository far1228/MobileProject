import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationWidget extends StatelessWidget {
  final double latitude;
  final double longitude;

  LocationWidget({required this.latitude, required this.longitude});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final url = 'https://www.google.com/maps?q=$latitude,$longitude';
        launch(url);
      },
      child: Text('Open in Google Maps'),
    );
  }
}
