class PaymentIntentResponseModel {
  final String clientSecret;
  final String customerId;

  const PaymentIntentResponseModel({required this.clientSecret, required this.customerId});

  factory PaymentIntentResponseModel.fromJson(jsonData) {
    return PaymentIntentResponseModel(clientSecret: jsonData['client_secret'],customerId: jsonData['customer']);
  }
}
