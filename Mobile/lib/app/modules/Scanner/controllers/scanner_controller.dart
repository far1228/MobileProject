import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class ScannerController {
  // Variabel untuk menyimpan hasil pemindaian
  String qrText = "Scan a code";

  void handleScan(QRViewController controller, String scanData) {
    qrText = scanData;  // Update hasil pemindaian
  }

  void startScan(QRViewController controller) {
    controller.resumeCamera();
  }

  void stopScan(QRViewController controller) {
    controller.pauseCamera();
  }
}