import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:talimger/view/widgets/app_snackbar.dart';
import 'package:talimger/view/widgets/screen_size.dart';
import 'package:widget_mask/widget_mask.dart';

class QRPage extends StatefulWidget {
  const QRPage({super.key});

  @override
  State<QRPage> createState() => _QRPageState();
}

class _QRPageState extends State<QRPage> {
  final _localAuth = LocalAuthentication();
  bool _isAuthtenticated = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Talimger QR'),
      ),
      body: Stack(
        children: [
          // MobileScanner(
          //   controller: MobileScannerController(
          //     detectionSpeed: DetectionSpeed.normal,
          //     // useNewCameraSelector: true,
          //   ),
          //   onDetect: (capture) async {
          //     //   List codes = capture.barcodes;

          //     //   for (Barcode code in codes) {
          //     //     try {
          //     //       final bool didAuthenticate = await _localAuth.authenticate(
          //     //         localizedReason: 'Face Check',
          //     //         options: AuthenticationOptions(
          //     //           biometricOnly: true,
          //     //           stickyAuth: true,
          //     //         ),
          //     //       );
          //     //       setState(() {
          //     //         _isAuthtenticated = didAuthenticate;
          //     //       });
          //     //     } catch (e) {
          //     //       debugPrint(e.toString());
          //     //     }
          //     //     // showAppSnackBar(context: context, text: code.rawValue);
          //     //   }
          //   },
          // ),
          Container(
            width: getScreenWidth(context),
            height: getScreenHeight(context),

            color: Colors.red.withOpacity(0.5),
            // decoration: BoxDecoration(
            //   color: Colors.red.withOpacity(0.5),
            // ),

            child: Center(
              child: Container(
                height: 200,
                width: 200,
                color: Colors.white,
                child: MobileScanner(
                  controller: MobileScannerController(
                    detectionSpeed: DetectionSpeed.normal,
                    // useNewCameraSelector: true,
                  ),
                  onDetect: (capture) async {
                    List codes = capture.barcodes;

                    for (Barcode code in codes) {
                      try {
                        final bool didAuthenticate =
                            await _localAuth.authenticate(
                          localizedReason: 'Face Check',
                          options: AuthenticationOptions(
                            biometricOnly: true,
                            stickyAuth: true,
                          ),
                        );

                        setState(() {
                          _isAuthtenticated = didAuthenticate;
                        });
                      } catch (e) {
                        debugPrint(e.toString());
                      }
                      // showAppSnackBar(context: context, text: code.rawValue);
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
