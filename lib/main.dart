import 'package:flutter/material.dart';
import 'package:razerpay_payment_gateway/payment_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',

      home: PaymentScreen(),
    );
  }
}


