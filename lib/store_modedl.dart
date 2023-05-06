import 'package:cloud_firestore/cloud_firestore.dart';

class Seller {
  String? sellerName;
  String? sellerUID;
  String? address;
  String? sellerAvatarUrl;
  String? waterType;
  String? phone;

  Seller(
      {this.sellerName,
      this.sellerUID,
      this.address,
      this.sellerAvatarUrl,
      this.phone,
      this.waterType});

  Seller.fromJson(Map<String, dynamic> json) {
    sellerName = json["sellerName"];
    phone = json["phone"];

    sellerUID = json['sellerUID'];
    address = json['address'];
    sellerAvatarUrl = json['sellerAvatarUrl'];
    waterType = json['waterType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["sellerName"] = sellerName;
    data["phone"] = phone;
    data['sellerUID'] = sellerUID;
    data['address'] = address;
    data['sellerAvatarUrl'] = sellerAvatarUrl;
    data['waterType'] = waterType;

    return data;
  }
}
