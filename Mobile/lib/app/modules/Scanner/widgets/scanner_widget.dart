import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:project_mobile/app/modules/Scanner/controllers/scanner_controller.dart';

class ScannerWidget extends StatefulWidget {
  final ScannerController scannerController;

  ScannerWidget({
    required this.scannerController,
  });

  @override
  _ScannerWidgetState createState() => _ScannerWidgetState();
}

class _ScannerWidgetState extends State<ScannerWidget> {
  QRViewController? _controller; // Controller untuk mengontrol QRView
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR'); // GlobalKey untuk QRView

  @override
  void dispose() {
    _controller?.dispose(); // Membersihkan controller ketika widget dihancurkan
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Scanner'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, Routes.DETAILS); // Navigasi ke Routes.DETAILS
          },
        ),
      ),
      body: Column(
        children: [
          // QRView untuk memindai kode QR
          Expanded(
            flex: 4,
            child: QRView(
              key: qrKey,  // Menambahkan GlobalKey
              onQRViewCreated: (QRViewController controller) {
                _controller = controller; // Simpan controller yang diterima
                _controller!.scannedDataStream.listen((scanData) {
                  widget.scannerController.handleScan(_controller!, scanData.code!);
                  setState(() {}); // Perbarui UI saat data baru diterima
                });
              },
              overlay: QrScannerOverlayShape(
                borderColor: Colors.blue,
                borderRadius: 10,
                borderLength: 20,
                borderWidth: 5,
                cutOutSize: 250, // Ukuran area pemindaian
              ),
            ),
          ),
          // Menampilkan hasil pemindaian
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                widget.scannerController.qrText,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // Tombol untuk memulai pemindaian
          ElevatedButton(
            onPressed: _controller == null
                ? null
                : () {
                    widget.scannerController.startScan(_controller!);
                  },
            child: const Text("Start Scan"),
          ),
          // Tombol untuk menghentikan pemindaian
          ElevatedButton(
            onPressed: _controller == null
                ? null
                : () {
                    widget.scannerController.stopScan(_controller!);
                  },
            child: const Text("Stop Scan"),
          ),
        ],
      ),
    );
  }
}

// Definisikan rute aplikasi
class Routes {
  static const String DETAILS = '/details';
}
