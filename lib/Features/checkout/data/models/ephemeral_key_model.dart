class EphemeralKeyModel {
  final String secret;

  EphemeralKeyModel({required this.secret});
  
  factory EphemeralKeyModel.fromJson(jsonData){
    return EphemeralKeyModel(secret: jsonData['secret']);
  }
}