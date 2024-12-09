import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:project_mobile/app/modules/Scanner/controllers/scanner_controller.dart';
import 'package:project_mobile/app/modules/Scanner/widgets/scanner_widget.dart';

class ScannerView extends StatefulWidget {
  @override
  _ScannerViewState createState() => _ScannerViewState();
}

class _ScannerViewState extends State<ScannerView> {
  final ScannerController scannerController = ScannerController();
  QRViewController? controller;  // controller bisa null pada awalnya

  @override
  void dispose() {
    controller?.dispose();  // Pastikan dispose dipanggil
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Code Scanner"),
        backgroundColor: const Color.fromARGB(255, 243, 171, 36),
      ),
      body: ScannerWidget(
        scannerController: scannerController,
      ),
    );
  }
}