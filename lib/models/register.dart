
import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
    String email;
    String password;
    String fullname;
    String phone;
    String latitude;
    String longitude;
    String location;

    Register({
        required this.email,
        required this.password,
        required this.fullname,
        required this.phone,
        required this.latitude,
        required this.longitude,
        required this.location,
    });

    factory Register.fromJson(Map<String, dynamic> json) => Register(
        email: json["email"],
        password: json["password"],
        fullname: json["fullname"],
        phone: json["phone"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        location: json["location"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "fullname": fullname,
        "phone": phone,
        "latitude": latitude,
        "longitude": longitude,
        "location": location,
    };
}
