import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app_2/Features/checkout/data/models/ephemeral_key_model.dart';
import 'package:payment_app_2/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_app_2/Features/checkout/data/models/payment_intent_response_model.dart';
import 'package:payment_app_2/core/utils/api_key.dart';
import 'package:payment_app_2/core/utils/api_serivce.dart';

class StripeService {
  // make payment(call other 4 functions)
  Future<void> makePayment(
      PaymentIntentInputModel paymentIntentInputModel) async {
    // 1- create payment intent
    PaymentIntentResponseModel paymentIntentResponseModel =
        await createPaymentIntent(paymentIntentInputModel);

    // 2- create ephemeral key
    EphemeralKeyModel ephemeralKeyModel =
        await createEphemeralKey(paymentIntentInputModel.customerId);
    // 3- initial payment sheet
    await initPaymentSheet(paymentIntentResponseModel:  paymentIntentResponseModel,ephemeralKeyModel:  ephemeralKeyModel);
    // 4-display payment sheet
    await displayPaymentSheet();
  }

  // create payment intent
  Future<PaymentIntentResponseModel> createPaymentIntent(
      PaymentIntentInputModel paymentIntentInputModel) async {
    Response response = await ApiService().post(
        url: ApiKeys.urlStripe,
        token: ApiKeys.secretStripeKey,
        body: paymentIntentInputModel.toJson());
    PaymentIntentResponseModel paymentIntentResponseModel =
        PaymentIntentResponseModel.fromJson(response.data);
    return paymentIntentResponseModel;
  }

  //create ephermeral key
  Future<EphemeralKeyModel> createEphemeralKey(String customerId) async {
    Response response = await ApiService().post(
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      token: ApiKeys.secretStripeKey,
      body: {'customer': customerId},
      header: {
        'Stripe-Version': "2023-10-16",
        'Authorization': "Bearer ${ApiKeys.secretStripeKey}"
      },
    );
    EphemeralKeyModel ephemeralKeyModel =
        EphemeralKeyModel.fromJson(response.data);
    return ephemeralKeyModel;
  }

  // initial payment sheet
  Future<void> initPaymentSheet({required PaymentIntentResponseModel paymentIntentResponseModel , required EphemeralKeyModel ephemeralKeyModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentResponseModel.clientSecret,
        merchantDisplayName: "Yousef Store",
        customerId: paymentIntentResponseModel.customerId,
        customerEphemeralKeySecret:ephemeralKeyModel.secret
      ),
    );
  }

  // display payment sheet
  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }
}
