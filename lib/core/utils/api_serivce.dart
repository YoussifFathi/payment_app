import 'package:dio/dio.dart';
import 'package:payment_app_2/Features/checkout/data/models/payment_intent_input_model.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<Response> post(
      {required String url, required String token, required body , header}) async {
    Response response = await _dio.post(url,
        data: body,

        options: Options(

          contentType: Headers.formUrlEncodedContentType,
          headers: header ?? {'Authorization':"Bearer $token"},
        ));
    return response;
  }
}
