import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../controllers/location_controller.dart';

class LocationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(
      init: LocationController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Your Location'),
          ),
          body: Obx(() {
            if (controller.position.value == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        'Latitude: ${controller.position.value!.latitude}',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        'Longitude: ${controller.position.value!.longitude}',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: GoogleMap(
                    mapType: MapType.normal, // Set default map type
                    initialCameraPosition: CameraPosition(
                      target: controller.userLocation.value,
                      zoom: 15,
                    ),
                    markers: {
                      Marker(
                        markerId: MarkerId('user_location'),
                        position: controller.userLocation.value,
                      ),
                    },
                  ),
                ),
              ],
            );
          }),
        );
      },
    );
  }
}
