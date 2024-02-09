part of 'payment_cubit.dart';

@immutable
abstract class PaymentState {}

class PaymentInitialState extends PaymentState {}
class PaymentLoadingState extends PaymentState {}
class PaymentSucessfulState extends PaymentState {}
class PaymentFailureState extends PaymentState {
  final String errorMessage;

  PaymentFailureState({required this.errorMessage});

}
