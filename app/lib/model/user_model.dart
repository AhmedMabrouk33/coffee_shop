// TODO: Create Abstract class which will be parent for all model classes
// Class will create in utils.

// TODO: UserModel will extends from model abstract class. 
class UserModel {
  final String id;
  final String userName;
  final String email;
  final String password;
  final bool resetPassword;
  final String image;

  const UserModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.password,
    required this.resetPassword,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': userName,
      'email': email,
      'password': password,
      'resetPassword': resetPassword,
      'image': image,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json, String password) {
    return UserModel(
      id: json['id'].toString(),
      userName: json['username'] ?? '',
      email: json['email'] ?? '',
      password: password,
      resetPassword: json['resetppassword'] ?? false,
      image: json['image'] ?? '',
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, userName: $userName, email: $email, password: $password, resetPassword: $resetPassword, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is UserModel &&
      other.id == id &&
      other.userName == userName &&
      other.email == email &&
      other.password == password &&
      other.resetPassword == resetPassword &&
      other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      userName.hashCode ^
      email.hashCode ^
      password.hashCode ^
      resetPassword.hashCode ^
      image.hashCode;
  }
}
