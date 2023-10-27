import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ReadCodePage extends StatelessWidget {
  const ReadCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lectura de código QR"),
      ),
      body: MobileScanner(
        controller: MobileScannerController(
            detectionSpeed: DetectionSpeed.normal,
            facing: CameraFacing.back,
            torchEnabled: true),
        onDetect: (barcodes) {
          print(barcodes);
        },
      ),
    );
  }
}
