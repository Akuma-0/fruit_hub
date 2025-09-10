class UserEntity {
  UserEntity({required this.name, required this.email, required this.uId});
  final String name;
  final String email;
  final String uId;
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'uId': uId,
    };
  }
}
