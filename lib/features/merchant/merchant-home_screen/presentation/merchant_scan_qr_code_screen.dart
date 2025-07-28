// import 'dart:async';
// import 'package:brayne_digital_app/assets_helper/app_colors.dart';
// import 'package:brayne_digital_app/assets_helper/app_fonts.dart';
// import 'package:brayne_digital_app/assets_helper/app_icons.dart';
// import 'package:brayne_digital_app/common_widgets/custom_appbar_profile.dart';
// import 'package:brayne_digital_app/common_widgets/custom_button.dart';
// import 'package:brayne_digital_app/helpers/navigation_service.dart';
// import 'package:brayne_digital_app/helpers/ui_helpers.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
// import 'package:share_plus/share_plus.dart';
//
// class MerchantScanQrCodeScreen extends StatefulWidget {
//   const MerchantScanQrCodeScreen({super.key});
//
//   @override
//   State<MerchantScanQrCodeScreen> createState() => _MerchantScanQrCodeScreenState();
// }
//
// class _MerchantScanQrCodeScreenState extends State<MerchantScanQrCodeScreen> with SingleTickerProviderStateMixin {
//   late Duration _remainingTime;
//   late Timer _timer;
//   final Duration initialTime = const Duration(minutes: 4, seconds: 45);
//   late MobileScannerController _scannerController;
//   String? _scannedLink;
//   bool _isScanning = true;
//   late AnimationController _animationController;
//   late Animation<double> _scanLineAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     _remainingTime = initialTime;
//     _startTimer();
//     _scannerController = MobileScannerController(
//       facing: CameraFacing.back,
//       torchEnabled: false,
//     );
//     ///=========Animation Controller Setup Section  =========================
//     _animationController = AnimationController(
//
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     )..repeat(reverse: true);
//     _scanLineAnimation = Tween<double>(begin: 0, end: 1).animate(_animationController);
//   }
//
//   @override
//   void dispose() {
//     _timer.cancel();
//     _scannerController.dispose();
//     _animationController.dispose();
//     super.dispose();
//   }
//   ///==============Time Function=================
//   void _startTimer() {
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         if (_remainingTime.inSeconds > 0) {
//           _remainingTime = _remainingTime - const Duration(seconds: 1);
//         } else {
//           timer.cancel();
//         }
//       });
//     });
//   }
//
//   String _formatDuration(Duration duration) {
//     String twoDigits(int n) => n.toString().padLeft(2, '0');
//     final minutes = twoDigits(duration.inMinutes.remainder(60));
//     final seconds = twoDigits(duration.inSeconds.remainder(60));
//     return '$minutes:$seconds';
//   }
//   ///=============Dialog box======================
//   void _showLinkDialog(String link) {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return Dialog(
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
//           backgroundColor: Colors.white.withOpacity(0.95),
//           child: Padding(
//             padding: EdgeInsets.all(20.w),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'QR Code Scanned',
//                   style: TextFontStyle.titleStyle20w600c182245Manrope.copyWith(fontSize: 20.sp),
//                 ),
//                 UIHelper.verticalSpace(16.h),
//                 Container(
//                   padding: EdgeInsets.all(12.w),
//                   decoration: BoxDecoration(
//                     border: Border.all(color: AppColors.primary2),
//                     color: AppColors.white.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(8.r),
//                   ),
//                   child: Text(
//                     'Link: $link',
//                     style: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(color:AppColors.c000000,fontSize: 16.sp),
//                   ),
//                 ),
//                 UIHelper.verticalSpace(20.h),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     _buildDialogButton(
//                       text: 'Copy',
//                       icon: Icons.copy,
//                       onPressed: () {
//                         Clipboard.setData(ClipboardData(text: link));
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text('Link copied to clipboard', style: TextFontStyle.titleStyle16w500primary2Manrope),
//                             backgroundColor: AppColors.cFF4800,
//                             duration: const Duration(seconds: 2),
//                           ),
//                         );
//                       },
//                     ),
//                     _buildDialogButton(
//                       text: 'Share',
//                       icon: Icons.share,
//                       onPressed: () => Share.share(link, subject: 'Scanned QR Code'),
//                     ),
//                   ],
//                 ),
//                 UIHelper.verticalSpace(16.h),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     TextButton(
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                         setState(() {
//                           _isScanning = true;
//                           _scannerController.start();
//                         });
//                       },
//                       child: Text('Rescan', style: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(color: AppColors.cFF4800)),
//                     ),
//                     TextButton(
//                       onPressed: () => Navigator.of(context).pop(),
//                       child: Text('Close', style: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(color: AppColors.cFF4800)),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   Widget _buildDialogButton({required String text, required IconData icon, required VoidCallback onPressed}) {
//     return ElevatedButton.icon(
//       onPressed: onPressed,
//       icon: Icon(icon, size: 18.sp, color: Colors.white),
//       label: Text(text, style: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(color: Colors.white)),
//       style: ElevatedButton.styleFrom(
//         backgroundColor: AppColors.cFF4800,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
//         padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: CustomAppbarProfile(title: "Discount Redemption", iconPath: AppIcons.backArrowIcon, onIconTap: () => NavigationService.goBack,
//
//       showIcon: false,
//       ),
//
//
//       body: Container(
//         decoration: BoxDecoration(
//         ),
//         child: SafeArea(
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
//             child: Column(
//               children: [
//                 UIHelper.verticalSpace(24.h),
//                 ///=======QR code scan widget=========================
//                 Container(
//                   height: 330.h,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(16.r),
//                     boxShadow: [
//
//                       BoxShadow(
//                         color: Colors.black12,
//                         blurRadius: 12.r,
//                         offset: const Offset(0, 4),
//                       ),
//                     ],
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(16.r),
//                     child: Stack(
//                       fit: StackFit.expand,
//                       children: [
//
//                         if (_isScanning)
//                           MobileScanner(
//                             controller: _scannerController,
//                             onDetect: (BarcodeCapture capture) {
//                               final List<Barcode> barcodes = capture.barcodes;
//                               for (final barcode in barcodes) {
//                                 if (barcode.rawValue != null) {
//                                   setState(() {
//                                     _scannedLink = barcode.rawValue;
//                                     _isScanning = false;
//                                   });
//                                   _scannerController.stop();
//                                   _showLinkDialog(barcode.rawValue!);
//                                 }
//                               }
//                             },
//                           ),
//
//
//                         if (_isScanning)
//                           Positioned.fill(
//                             child: CustomPaint(
//                               painter: ScannerOverlayPainter(),
//                               child: AnimatedBuilder(
//                                 animation: _scanLineAnimation,
//                                 builder: (context, child) {
//                                   return Stack(
//                                     children: [
//                                       Positioned(
//                                         top: (315.h * _scanLineAnimation.value * 0.8) + 36.h,
//                                         left: 40.w,
//                                         right: 40.w,
//                                         child: Container(
//                                           height: 2.h,
//                                           decoration: BoxDecoration(
//                                             color: AppColors.c000000.withOpacity(0.7),
//                                             boxShadow: [
//                                               BoxShadow(
//                                                 color: AppColors.c000000.withOpacity(0.5),
//                                                 blurRadius: 8.r,
//                                                 spreadRadius: 2.r,
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     ],
//                                   );
//                                 },
//                               ),
//                             ),
//                           ),
//
//
//                         if (!_isScanning)
//                           Center(
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 16.w),
//                               child: Text(
//                                 _scannedLink != null
//                                     ? 'QR Code Scanned:\n$_scannedLink'
//                                     : 'Scan a QR code',
//                                 textAlign: TextAlign.center,
//                                 style: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(
//                                   color: Colors.black87,
//                                   fontSize: 18.sp,
//                                 ),
//                               ),
//                             ),
//                           ),
//                       ],
//                     ),
//                   ),
//                 ),
//
//                 ///=============Time and Torch and Camera Section====================//
//                 UIHelper.verticalSpace(20.h),
//                 if (_isScanning)
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ValueListenableBuilder(
//                         valueListenable: _scannerController,
//                         builder: (context, torchState, child) {
//                           return GestureDetector(
//                             onTap: () => _scannerController.toggleTorch(),
//                             child: AnimatedContainer(
//                               duration: const Duration(milliseconds: 300),
//                               padding: EdgeInsets.all(12.w),
//                               decoration: BoxDecoration(
//                                 color: torchState == TorchState.on
//                                     ? AppColors.white.withOpacity(0.2)
//                                     : Colors.white.withOpacity(0.8),
//                                 borderRadius: BorderRadius.circular(12.r),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.black12,
//                                     blurRadius: 8.r,
//                                     offset: const Offset(0, 2),
//                                   ),
//                                 ],
//                               ),
//                               child: Icon(
//                                 torchState == TorchState.off ? Icons.flash_off : Icons.flash_on,
//                                 color: torchState == TorchState.off ? Colors.black54 : AppColors.cFF4800,
//                                 size: 28.sp,
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                       UIHelper.horizontalSpace(20.w),
//
//                       GestureDetector(
//                         onTap: () => _scannerController.switchCamera(),
//                         child: Container(
//                           padding: EdgeInsets.all(12.w),
//                           decoration: BoxDecoration(
//                             color: Colors.white.withOpacity(0.8),
//                             borderRadius: BorderRadius.circular(12.r),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black12,
//                                 blurRadius: 8.r,
//                                 offset: const Offset(0, 2),
//                               ),
//                             ],
//                           ),
//                           child: Icon(
//                             Icons.cameraswitch,
//                             color: AppColors.cFF4800,
//                             size: 28.sp,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//
//                 UIHelper.verticalSpace(24.h),
//
//                 ///==============Cancel Button======================//
//                 CustomButton(
//                   color: AppColors.cFF4800,
//                   borderRadius: 12.r,
//                   name: "Cancel",
//                   onCallBack: () => NavigationService.goBack,
//                   context: context,
//                   textStyle: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(
//                     color: Colors.white,
//                     fontSize: 16.sp,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// ///=================Custom Overly Painter Class Section=====================
// class ScannerOverlayPainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()
//       ..color = Colors.white
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 4.0;
//
//     final cornerLength = 24.0;
//     final scanArea = size.width * 0.75;
//     final offset = (size.width - scanArea) / 2;
//     final rect = Rect.fromLTWH(offset, offset, scanArea, scanArea);
//
//
//     canvas.drawLine(
//       Offset(rect.left, rect.top),
//       Offset(rect.left + cornerLength, rect.top),
//       paint,
//     );
//     canvas.drawLine(
//       Offset(rect.left, rect.top),
//       Offset(rect.left, rect.top + cornerLength),
//       paint,
//     );
//     canvas.drawLine(
//       Offset(rect.right - cornerLength, rect.top),
//       Offset(rect.right, rect.top),
//       paint,
//     );
//     canvas.drawLine(
//       Offset(rect.right, rect.top),
//       Offset(rect.right, rect.top + cornerLength),
//       paint,
//     );
//     canvas.drawLine(
//       Offset(rect.left, rect.bottom - cornerLength),
//       Offset(rect.left, rect.bottom),
//       paint,
//     );
//     canvas.drawLine(
//       Offset(rect.left, rect.bottom),
//       Offset(rect.left + cornerLength, rect.bottom),
//       paint,
//     );
//     canvas.drawLine(
//       Offset(rect.right - cornerLength, rect.bottom),
//       Offset(rect.right, rect.bottom),
//       paint,
//     );
//     canvas.drawLine(
//       Offset(rect.right, rect.bottom - cornerLength),
//       Offset(rect.right, rect.bottom),
//       paint,
//     );
//
//     final backgroundPaint = Paint()
//       ..color = Colors.black.withOpacity(0.4)
//       ..style = PaintingStyle.fill;
//
//     canvas.drawPath(
//       Path()
//         ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
//         ..addRect(rect)
//         ..fillType = PathFillType.evenOdd,
//       backgroundPaint,
//     );
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
// }
//
//
//
//  ///===============Time show =============
// // Container(
// // padding: EdgeInsets.all(8.w),
// // decoration: BoxDecoration(
// // color: Colors.white.withOpacity(0.8),
// // borderRadius: BorderRadius.circular(12.r),
// // boxShadow: [
// // BoxShadow(
// // color: Colors.black12,
// // blurRadius: 8.r,
// // offset: const Offset(0, 2),
// // ),
// // ],
// // ),
// // child: Text(
// // _formatDuration(_remainingTime),
// // style: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(
// // fontSize: 16.sp,
// // color: AppColors.cFF4800,
// // ),
// // ),
// // ),


import 'dart:async';
import 'package:digital_app/assets_helper/app_colors.dart';
import 'package:digital_app/assets_helper/app_fonts.dart';
import 'package:digital_app/assets_helper/app_icons.dart';
import 'package:digital_app/common_widgets/custom_appbar_profile.dart';
import 'package:digital_app/common_widgets/custom_button.dart';
import 'package:digital_app/helpers/navigation_service.dart';
import 'package:digital_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:share_plus/share_plus.dart';
import 'package:vibration/vibration.dart';

class MerchantScanQrCodeScreen extends StatefulWidget {
  const MerchantScanQrCodeScreen({super.key});

  @override
  State<MerchantScanQrCodeScreen> createState() => _MerchantScanQrCodeScreenState();
}

class _MerchantScanQrCodeScreenState extends State<MerchantScanQrCodeScreen> with SingleTickerProviderStateMixin {
  late Duration _remainingTime;
  late Timer _timer;
  final Duration initialTime = const Duration(minutes: 4, seconds: 45);
  late MobileScannerController _scannerController;
  String? _scannedLink;
  bool _isScanning = true;
  late AnimationController _animationController;
  late Animation<double> _scanLineAnimation;

  @override
  void initState() {
    super.initState();
    _remainingTime = initialTime;
    _startTimer();
    _scannerController = MobileScannerController(
      facing: CameraFacing.back,
      torchEnabled: false,
    );

    ///========= Animation Controller Setup==============
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat(reverse: true);
    _scanLineAnimation = Tween<double>(begin: 0.2, end: 0.8).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    _scannerController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  ///============== Timer Function===================
  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime.inSeconds > 0) {
          _remainingTime = _remainingTime - const Duration(seconds: 1);
        } else {
          timer.cancel();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Scanning time expired!')),
          );
          NavigationService.goBack();
        }
      });
    });
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  ///============= Dialog Box for Scanned QR Code============
  void _showLinkDialog(String link) async {
    // Check if device supports vibration
    bool? hasVibrator = await Vibration.hasVibrator();
    if (hasVibrator == true) {
      print("Vibration triggered");
      Vibration.vibrate(duration: 200); // Haptic feedback on scan
    } else {
      print("This device does not support vibration");
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
          backgroundColor: Colors.white.withOpacity(0.95),
          child: Padding(
            padding: EdgeInsets.all(20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'QR Code Scanned',
                  style: TextFontStyle.titleStyle20w600c182245Manrope.copyWith(fontSize: 20.sp),
                ),
                UIHelper.verticalSpace(16.h),
                Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.primary2),
                    color: AppColors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Text(
                    'Link: $link',
                    style: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(
                      color: AppColors.c000000,
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                UIHelper.verticalSpace(20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildDialogButton(
                      text: 'Copy',
                      icon: Icons.copy,
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: link));
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Link copied to clipboard',
                              style: TextFontStyle.titleStyle16w500primary2Manrope,
                            ),
                            backgroundColor: AppColors.cFF4800,
                            duration: const Duration(seconds: 2),
                          ),
                        );
                      },
                    ),
                    _buildDialogButton(
                      text: 'Share',
                      icon: Icons.share,
                      onPressed: () => Share.share(link, subject: 'Scanned QR Code'),
                    ),
                  ],
                ),
                UIHelper.verticalSpace(16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        setState(() {
                          _isScanning = true;
                          _scannerController.start();
                        });
                      },
                      child: Text(
                        'Rescan',
                        style: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(color: AppColors.cFF4800),
                      ),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        'Close',
                        style: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(color: AppColors.cFF4800),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDialogButton({required String text, required IconData icon, required VoidCallback onPressed}) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18.sp, color: Colors.white),
      label: Text(
        text,
        style: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.cFF4800,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        elevation: 2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppbarProfile(
        title: "Discount Redemption",
        iconPath: AppIcons.backArrowIcon,
        onIconTap: () => NavigationService.goBack,
        showIcon: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.white, Color(0xFFF5F5F5)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
              child: Column(
                children: [
                  UIHelper.verticalSpace(24.h),
                  ///============== QR Code Scanner Widget================
                  Container(
                    height: 330.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 12.r,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16.r),
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          if (_isScanning)
                            MobileScanner(
                              controller: _scannerController,
                              onDetect: (BarcodeCapture capture) {
                                final List<Barcode> barcodes = capture.barcodes;
                                for (final barcode in barcodes) {
                                  if (barcode.rawValue != null) {
                                    setState(() {
                                      _scannedLink = barcode.rawValue;
                                      _isScanning = false;
                                    });
                                    _scannerController.stop();
                                    _showLinkDialog(barcode.rawValue!);
                                  }
                                }
                              },
                            ),
                          ///=========== Overlay and Scan Line===================
                          if (_isScanning)
                            Positioned.fill(
                              child: CustomPaint(
                                painter: ScannerOverlayPainter(),
                                child: AnimatedBuilder(
                                  animation: _scanLineAnimation,
                                  builder: (context, child) {
                                    return Stack(
                                      children: [
                                        Positioned(
                                          top: (315.h * _scanLineAnimation.value * 0.6) + 40.h,
                                          left: 48.w,
                                          right: 48.w,
                                          child: Container(
                                            height: 1.5.h,
                                            decoration: BoxDecoration(
                                              color: AppColors.c000000.withOpacity(0.8),
                                              borderRadius: BorderRadius.circular(2.r),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: AppColors.c000000.withOpacity(0.4),
                                                  blurRadius: 10.r,
                                                  spreadRadius: 2.r,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ///============== Text when scanning stops===============
                          if (!_isScanning)
                            Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Text(
                                  _scannedLink != null ? 'QR Code Scanned:\n$_scannedLink' : 'Scan a QR code',
                                  textAlign: TextAlign.center,
                                  style: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(
                                    color: Colors.black87,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  // Timer and Buttons Section
                  UIHelper.verticalSpace(20.h),
                  if (_isScanning)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ///=================== Timer Display================
                        Container(
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 8.r,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Text(
                            _formatDuration(_remainingTime),
                            style: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(
                              fontSize: 18.sp,
                              color: AppColors.cFF4800,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        UIHelper.horizontalSpace(20.w),
                        ///=============Torch Button=================
                        ValueListenableBuilder(
                          valueListenable: _scannerController,
                          builder: (context, torchState, child) {
                            return GestureDetector(
                              onTap: () => _scannerController.toggleTorch(),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                padding: EdgeInsets.all(12.w),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: torchState == TorchState.on
                                      ? Colors.white
                                      : Colors.red.withOpacity(0.9),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.1),
                                      blurRadius: 8.r,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  torchState == TorchState.off ? Icons.flash_off : Icons.flash_on,
                                  color: torchState == TorchState.off ? Colors.black87 : AppColors.white,
                                  size: 28.sp,
                                ),
                              ),
                            );
                          },
                        ),
                        UIHelper.horizontalSpace(20.w),
                        ///============= Camera Switch Button======================
                        GestureDetector(
                          onTap: () => _scannerController.switchCamera(),
                          child: Container(
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white.withOpacity(0.9),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 8.r,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Icon(
                              Icons.cameraswitch,
                              color: AppColors.cFF4800,
                              size: 28.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  UIHelper.verticalSpace(135.h),
                  ///===============cancel button=============
                  CustomButton(
                    color: AppColors.cFF4800,
                    borderRadius: 12.r,
                    name: "Cancel",
                    onCallBack: () => NavigationService.goBack,
                    context: context,
                    textStyle: TextFontStyle.titleStyle16w500primary2Manrope.copyWith(
                      color: Colors.white,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Custom Overlay Painter
// Custom Overlay Painter
class ScannerOverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0; // Thicker border

    final cornerLength = 30.0; // Larger corners
    final scanArea = size.width * 0.7; // Smaller scan area
    final offset = (size.width - scanArea) / 2;
    final rect = Rect.fromLTWH(offset, offset, scanArea, scanArea);

    // Corner lines
    canvas.drawLine(Offset(rect.left, rect.top), Offset(rect.left + cornerLength, rect.top), paint);
    canvas.drawLine(Offset(rect.left, rect.top), Offset(rect.left, rect.top + cornerLength), paint);
    canvas.drawLine(Offset(rect.right - cornerLength, rect.top), Offset(rect.right, rect.top), paint);
    canvas.drawLine(Offset(rect.right, rect.top), Offset(rect.right, rect.top + cornerLength), paint);
    canvas.drawLine(Offset(rect.left, rect.bottom - cornerLength), Offset(rect.left, rect.bottom), paint);
    canvas.drawLine(Offset(rect.left, rect.bottom), Offset(rect.left + cornerLength, rect.bottom), paint);
    canvas.drawLine(Offset(rect.right - cornerLength, rect.bottom), Offset(rect.right, rect.bottom), paint);
    canvas.drawLine(Offset(rect.right, rect.bottom - cornerLength), Offset(rect.right, rect.bottom), paint);

    // Background shade
    final backgroundPaint = Paint()
      ..color = Colors.black.withOpacity(0.4)
      ..style = PaintingStyle.fill;

    canvas.drawPath(
      Path()
        ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
        ..addRect(rect)
        ..fillType = PathFillType.evenOdd,
      backgroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}