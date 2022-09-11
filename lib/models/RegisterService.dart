import 'dart:convert';

List<RegisterServices> RegisterServicesFromJson(String str) =>
    List<RegisterServices>.from(
        json.decode(str).map((x) => RegisterServices.fromJson(x)));

String SpecialServicesToJson(List<RegisterServices> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RegisterServices {
  RegisterServices({
    required this.number,
    required this.fullname,
    required this.email,
    required this.password,
  });

  String number;
  String fullname;
  String email;
  String password;

  factory RegisterServices.fromJson(Map<String, dynamic> json) =>
      RegisterServices(
        number: json["num_ber"],
        fullname: json["full_name"],
        email: json["e_mail"],
        password: json["pass_word"],
      );

  Map<String, dynamic> toJson() => {
        "num_ber": number,
        "full_name": fullname,
        "e_mail": email,
        "pass_word": password,
      };
}
