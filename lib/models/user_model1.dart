class UserModel {
  String? uid;
  String? name;
  String? email;
  String? phoneNumber;
  String? status;
  String? userType;
  String? frontImageUrl;
  String? backImageUrl;

  UserModel({
    this.uid,
    this.name,
    this.email,
    this.phoneNumber,
    this.frontImageUrl,
    this.status,
    this.userType,
    this.backImageUrl,
  });

  // Factory constructor to create a UserModel instance from a map (json)
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      status: json['status'] as String?,
      userType: json['userType'] as String?,
      frontImageUrl: json['cnic_front_url'] as String?,
      backImageUrl: json['cnic_back_url'] as String?,
    );
  }

  // Method to convert a UserModel instance to a map (json)
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'status': status,
      'cnic_front_url': frontImageUrl,
      'cnic_back_url': backImageUrl,
    };
  }
}
