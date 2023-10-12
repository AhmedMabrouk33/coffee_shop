// TODO: Create Abstract class which will be parent for all model classes
// Class will create in utils.

// TODO: UserModel will extends from model abstract class.
class AuthModel {
  final String jwt;
  final String email;
  final String password;

  const AuthModel({
    required this.jwt,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'jwt': jwt,
      'email': email,
      'password': password,
    };
  }

  factory AuthModel.fromJson(Map<String, dynamic> json, String password) {
    return AuthModel(
      jwt: json['jwt'].toString(),
      email: json['email'] ?? '',
      password: password,
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $jwt, email: $email, password: $password)';
  }
}
