class ForgetPasswordResponse {
  String? statusMsg;
  String? message;

  ForgetPasswordResponse({this.statusMsg, this.message});

  factory ForgetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ForgetPasswordResponse(
      statusMsg: json['statusMsg'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {'statusMsg': statusMsg, 'message': message};
}

class VerifyResetCodeResponse {
  final String? status;
  VerifyResetCodeResponse({required this.status});

  factory VerifyResetCodeResponse.fromJson(Map<String, dynamic> json) {
    return VerifyResetCodeResponse(status: json['status' as String?]);
  }
}

class ResetPasswordResponse {
  final String? token;
  ResetPasswordResponse({required this.token});

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) {
    return ResetPasswordResponse(token: json['token' as String?]);
  }
}
