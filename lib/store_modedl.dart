class Seller {
  String? sellerName;
  String? sellerUID;
  String? address;
  String? sellerAvatarUrl;
  String? waterType;
  String? phone;
  bool? isFormFilled;
  String? isRatesFilled;
  String? userCreated;

  Seller(
      {this.sellerName,
      this.sellerUID,
      this.address,
      this.sellerAvatarUrl,
      this.phone,
      this.waterType,
      this.isFormFilled,
      this.isRatesFilled});

  Seller.fromJson(Map<String, dynamic> json) {
    sellerName = json["sellerName"];
    phone = json["phone"];
    userCreated = json['userCreated'];

    sellerUID = json['sellerUID'];
    address = json['address'];
    sellerAvatarUrl = json['sellerAvatarUrl'];
    waterType = json['waterType'];
    isFormFilled = json['isFormFilled'];
    isRatesFilled = json['isRatesFilled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["sellerName"] = sellerName;
    data["phone"] = phone;
    data['sellerUID'] = sellerUID;
    data['address'] = address;
    data['sellerAvatarUrl'] = sellerAvatarUrl;
    data['waterType'] = waterType;

    return data;
  }
}
