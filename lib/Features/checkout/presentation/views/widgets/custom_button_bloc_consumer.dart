import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_app_2/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_app_2/Features/checkout/presentation/view_models/payment_cubit.dart';
import 'package:payment_app_2/Features/checkout/presentation/views/thank_you_view.dart';
import 'package:payment_app_2/core/widgets/custom_button.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if (state is PaymentSucessfulState) {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ThankYouView(),
              ));
        }
        if (state is PaymentFailureState) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Center(
            child: Text(state.errorMessage),
          )));
        }
      },
      builder: (context, state) {
        return CustomButton(
          text: 'Continue',
          isLoading: state is PaymentLoadingState,
          onTap: () {
            if ((state is! PaymentLoadingState)) {
              //stripe
              PaymentIntentInputModel paymentIntentInputModel =
                  PaymentIntentInputModel(
                      amount: (50.97 * 100).toInt(),
                      currency: 'usd',
                      customerId: 'cus_PWvI7tAkfTgi3m');
              BlocProvider.of<PaymentCubit>(context)
                  .makePayment(paymentIntentInputModel);


              //paypal
              // Navigator.of(context).push(MaterialPageRoute(
              //   builder: (BuildContext context) => PaypalCheckoutView(
              //     sandboxMode: true,
              //     clientId: "AWJIkG-zfXg0CLNv_ld0japlZ3NcszJO3B8ckcE97fV65WnSaS84Sj8LyIabC7aey6F0_BGrEySXdGl1",
              //     secretKey: "EDf3HCYqv-FWvQ075cnVI2eXCCG3Kbi3uo8IGdOcxh5I15IZLILe0ECu0mNwZBFXDhI-YZfHuVsdeW-K",
              //     transactions: const [
              //       {
              //         "amount": {
              //           "total": '100',
              //           "currency": "USD",
              //           "details": {
              //             "subtotal": '100',
              //             "shipping": '0',
              //             "shipping_discount": 0
              //           }
              //         },
              //         "description": "The payment transaction description.",
              //         // "payment_options": {
              //         //   "allowed_payment_method":
              //         //       "INSTANT_FUNDING_SOURCE"
              //         // },
              //         "item_list": {
              //           "items": [
              //             {
              //               "name": "Apple",
              //               "quantity": 4,
              //               "price": '10',
              //               "currency": "USD"
              //             },
              //             {
              //               "name": "Pineapple",
              //               "quantity": 5,
              //               "price": '12',
              //               "currency": "USD"
              //             }
              //           ],
              //
              //           // Optional
              //           //   "shipping_address": {
              //           //     "recipient_name": "Tharwat samy",
              //           //     "line1": "tharwat",
              //           //     "line2": "",
              //           //     "city": "tharwat",
              //           //     "country_code": "EG",
              //           //     "postal_code": "25025",
              //           //     "phone": "+00000000",
              //           //     "state": "ALex"
              //           //  },
              //         }
              //       }
              //     ],
              //     note: "Contact us for any questions on your order.",
              //     onSuccess: (Map params) async {
              //       log("onSuccess: $params");
              //       Navigator.pop(context);
              //     },
              //     onError: (error) {
              //       log("onError: $error");
              //       Navigator.pop(context);
              //     },
              //     onCancel: () {
              //       print('cancelled:');
              //       Navigator.pop(context);
              //     },
              //   ),
              // ));

            }
          },
        );
      },
    );
  }
}
