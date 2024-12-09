import 'package:flutter/material.dart';
import 'package:project_mobile/app/modules/Teh/widgets/teh_widget.dart';

class TehView extends StatelessWidget {
  const TehView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.orange),
        title: Text('Es Teh', style: TextStyle(color: Colors.orange)),
      ),
      body: TehWidget(),
    );
  }
}
