class UserModel {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? profilePicture;
  String? password; // Optional field, just for demonstration

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.profilePicture,
    this.password,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    profilePicture = json['profile_picture'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['address'] = address;
    data['profile_picture'] = profilePicture;
    data['password'] = password;
    return data;
  }
}
