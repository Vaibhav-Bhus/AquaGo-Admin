import 'dart:convert';

class StoreModel {
  String? uId;
  bool? isFormFilled;
  String? name;
  String? mob;
  StoreModel({
    this.uId,
    this.isFormFilled,
    this.name,
    this.mob,
  });

  StoreModel copyWith({
    String? uId,
    bool? isFormFilled,
    String? name,
    String? mob,
  }) {
    return StoreModel(
      uId: uId ?? this.uId,
      isFormFilled: isFormFilled ?? this.isFormFilled,
      name: name ?? this.name,
      mob: mob ?? this.mob,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'isFormFilled': isFormFilled,
      'name': name,
      'mob': mob,
    };
  }

  factory StoreModel.fromMap(Map<String, dynamic> map) {
    return StoreModel(
      uId: map['uId'],
      isFormFilled: map['isFormFilled'],
      name: map['name'],
      mob: map['mob'],
    );
  }

  String toJson() => json.encode(toMap());

  StoreModel.fromJson(Map<String, dynamic> json) {
    uId = json["uId"];
    isFormFilled = json['isFormFilled'];
    mob = json['mob'];
    name = json['name'];

  }

  @override
  String toString() {
    return 'StoreModel(uId: $uId, isFormFilled: $isFormFilled, name: $name, mob: $mob)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StoreModel &&
        other.uId == uId &&
        other.isFormFilled == isFormFilled &&
        other.name == name &&
        other.mob == mob;
  }

  @override
  int get hashCode {
    return uId.hashCode ^ isFormFilled.hashCode ^ name.hashCode ^ mob.hashCode;
  }
}
