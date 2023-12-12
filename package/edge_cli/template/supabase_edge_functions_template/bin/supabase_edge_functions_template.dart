import "package:general_lib/general_lib.dart";

void main(List<String> args) {
  print(generateUuid(32));
  Crypto crypto = Crypto(key: "MAR3Lh4cMBNjZ3O0s22Z5597iFAe3fQ9");
  String datab = crypto.encrypt(data: "asasp");

  print(crypto.decrypt(data_base64: datab));
}
