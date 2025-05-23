class User {
  final String? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? role;
  final String? phone;
  final String? gender;
  final String? birthdate;
  final String? address;
  final String? bio;
  final String? profileImage;
  final String? status;
  final UserMetaData? metaData;


  User({this.id, this.email, this.firstName, this.lastName, this.role, this.phone, this.gender, this.birthdate, this.address, this.bio, this.profileImage, this.status,this.metaData});

  // Factory method to create a UserModel instance from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      role: json['role'],
      phone: json['phone'],
      gender: json['gender'],
      birthdate: json['birthdate'],
      address: json['address'],
      bio: json['bio'],
      profileImage: json['profileImage'],
      status: json['status'],
      metaData: json['metaData'] != null ? UserMetaData.fromJson(json['metaData']) : null,
    );
  }

  // Method to convert UserModel instance to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'role': role,
      'phone': phone,
      'gender': gender,
      'birthdate': birthdate,
      'address': address,
      'bio': bio,
      'profileImage': profileImage,
      'status': status,
      'metaData': metaData?.toJson(),
    };
  }
}

class UserMetaData {
  final String? deviceId;
  final String? preferredLang;
  final String? selectedTheme;

  UserMetaData(this.deviceId, this.preferredLang, this.selectedTheme);

  factory UserMetaData.fromJson(Map<String, dynamic> json) {
    return UserMetaData(
      json['deviceId'],
      json['preferredLang'],
      json['selectedTheme'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'deviceId': deviceId,
      'preferredLang': preferredLang,
      'selectedTheme': selectedTheme,
    };
  }
}