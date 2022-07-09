class UserModel {
  final String? profilePicUrl;
  final String name;
  final String email;
  final String mobile;
  final String userId;
  final String? token;

  UserModel({
    this.profilePicUrl,
    required this.name,
    required this.email,
    required this.mobile,
    required this.userId,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      mobile: json['mobile'],
      userId: json['userId'],
      profilePicUrl: json['profilePic'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'mobile': mobile,
      'userId': userId,
      'profilePic': profilePicUrl,
      'token': token,
    };
  }
}
