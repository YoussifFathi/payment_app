import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app_2/Features/checkout/presentation/views/my_cart_view.dart';
import 'package:payment_app_2/bloc_observer.dart';
import 'package:payment_app_2/core/utils/api_key.dart';


void main() {
  Stripe.publishableKey = ApiKeys.publishableKey;
  Bloc.observer = MyBlocObserver();
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
