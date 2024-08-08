class UserModel {
  String? uid;
  String? name;
  String? email;
  String? phoneNumber;
  String? status;
  String? userType;

  UserModel({
    this.uid,
    this.name,
    this.email,
    this.phoneNumber,
    this.status,
    this.userType,
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
      'userType': userType,
    };
  }
}
