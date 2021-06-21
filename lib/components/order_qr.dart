import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class OrderQr extends StatelessWidget {
  final String orderId;
  const OrderQr({required this.orderId});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SizedBox(width: 500, child: QrImage(data: orderId)),
    );
  }
}
