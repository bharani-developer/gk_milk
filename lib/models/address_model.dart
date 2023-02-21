// ignore_for_file: non_constant_identifier_names

class ShAddressModel {
  int? id;
  String? first_name;
  String? last_name;
  String? pinCode;
  String? city;
  String? state;
  String? address_type;
  String? address;
  String? phone_number;
  String? country;

  ShAddressModel(
      {this.id,
      this.first_name,
      this.last_name,
      this.pinCode,
      this.city,
      this.state,
      this.address_type,
      this.address,
      this.phone_number,
      this.country});

  factory ShAddressModel.fromJson(Map<String, dynamic> json) {
    return ShAddressModel(
      id: json['id'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      pinCode: json['pinCode'],
      city: json['city'],
      state: json['state'],
      address_type: json['address_type'],
      address: json['address'],
      phone_number: json['phone_number'],
      country: json['country'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = first_name;
    data['last_name'] = last_name;
    data['pinCode'] = pinCode;
    data['city'] = city;
    data['state'] = state;
    data['address_type'] = address_type;
    data['address'] = address;
    data['phone_number'] = phone_number;
    data['country'] = country;
    return data;
  }
}
