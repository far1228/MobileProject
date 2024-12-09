import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_mobile/app/modules/Onion/widgets/onion_widget.dart';


class OnionView extends StatelessWidget {
  const OnionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.orange),
        title: Text('Onion Ring', style: TextStyle(color: Colors.orange)),
      ),
      body: OnionWidget(),
    );
  }
}