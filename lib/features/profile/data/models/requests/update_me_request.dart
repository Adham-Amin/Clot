class UpdateMeRequest {
  String? name;
  String? email;
  String? phone;

  UpdateMeRequest({this.name, this.email, this.phone});

  factory UpdateMeRequest.fromJson(Map<String, dynamic> json) {
    return UpdateMeRequest(
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'phone': phone,
  };
}
