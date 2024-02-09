import 'package:dartz/dartz.dart';
import 'package:payment_app_2/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_app_2/core/errors/failures.dart';

abstract class PaymentRepo {
  Future<Either<Failures , void>> makePayment(PaymentIntentInputModel paymentIntentInputModel);
}