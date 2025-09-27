class UserEntity {
  final String name;
  final String email;

  UserEntity({required this.name, required this.email});

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    return UserEntity(name: json['name'], email: json['email']);
  }

  Map<String, dynamic> toJson() => {'name': name, 'email': email};
}
