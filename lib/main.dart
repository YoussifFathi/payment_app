// import 'package:checkout_payment_ui/Features/checkout/presentation/views/my_cart_view.dart';
import 'package:flutter/material.dart';
import 'package:payment_app_2/Features/checkout/presentation/views/my_cart_view.dart';

void main() {
  runApp(const CheckoutApp());
}

class CheckoutApp extends StatelessWidget {
  const CheckoutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCartView(),
    );
  }
}
