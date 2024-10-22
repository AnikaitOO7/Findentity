import 'dart:convert';

Details detailsFromJson(String str) => Details.fromJson(json.decode(str));

String detailsToJson(Details data) => json.encode(data.toJson());

class Details {
  Details({
    required this.id,
    required this.address,
    required this.fatherMobile,
    required this.fatherName,
    required this.firstName,
    required this.lastName,
    required this.mobile,
    required this.pin,
  });

  String id;
  String address;
  String fatherMobile;
  String fatherName;
  String firstName;
  String lastName;
  String mobile;
  String pin;

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    id: json["id"],
    address: json["address"],
    fatherMobile: json["father_mobile"],
    fatherName: json["father_name"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    mobile: json["mobile"],
    pin: json["pin"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "address": address,
    "father_mobile": fatherMobile,
    "father_name": fatherName,
    "first_name": firstName,
    "last_name": lastName,
    "mobile": mobile,
    "pin": pin,
  };
}