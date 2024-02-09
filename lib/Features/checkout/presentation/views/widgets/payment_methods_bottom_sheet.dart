import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app_2/Features/checkout/data/repo/payment_repo_imp.dart';
import 'package:payment_app_2/Features/checkout/presentation/view_models/payment_cubit.dart';
import 'package:payment_app_2/Features/checkout/presentation/views/widgets/custom_button_bloc_consumer.dart';
import 'package:payment_app_2/Features/checkout/presentation/views/widgets/payment_methods_list_view.dart';
import 'package:payment_app_2/core/widgets/custom_button.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>  PaymentCubit(PaymentRepoImp()),
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 16,
            ),
            PaymentMethodsListView(),
            SizedBox(
              height: 32,
            ),
            CustomButtonBlocConsumer(),
          ],
        ),
      ),
    );
  }
}

