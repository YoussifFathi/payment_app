import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app_2/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_app_2/Features/checkout/data/repo/payment_repo.dart';
import 'package:payment_app_2/core/errors/failures.dart';
import 'package:payment_app_2/core/utils/stripe_service.dart';

class PaymentRepoImp extends PaymentRepo{
  @override
  Future<Either<Failures, void>> makePayment(PaymentIntentInputModel paymentIntentInputModel) async {
    try{
      await StripeService().makePayment(paymentIntentInputModel);
      return right(null);
    } on DioException catch (e){
      return left(ServerSideError.fromDioException(e));
    }on StripeException catch(e){
      return left(ServerSideError.fromStripeException(e));
    }catch(e){

      return left(ServerSideError(e.toString()));

    }
  }
}