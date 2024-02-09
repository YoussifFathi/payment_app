import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:payment_app_2/Features/checkout/data/models/payment_intent_input_model.dart';
import 'package:payment_app_2/Features/checkout/data/repo/payment_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this.paymentRepo) : super(PaymentInitialState());
  final PaymentRepo paymentRepo;
  Future makePayment(PaymentIntentInputModel paymentIntentInputModel)async{
    emit(PaymentLoadingState());
    var data = await paymentRepo.makePayment(paymentIntentInputModel);
    data.fold((l) => emit(PaymentFailureState(errorMessage: l.errorMessage)), (r) => emit(PaymentSucessfulState()));
  }

}
