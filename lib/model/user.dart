import 'package:equatable/equatable.dart';

class UserResponse extends Equatable {
  final String responseCode;
  final String responseMessage;
  final User user;

  const UserResponse({
    required this.responseCode,
    required this.responseMessage,
    required this.user,
  });

  @override
  List<Object?> get props => [responseCode, responseMessage, user];

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      responseCode: json['responseCode'],
      responseMessage: json['responseMessage'],
      user: User.fromJson(json['data']['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'responseCode': responseCode,
      'responseMessage': responseMessage,
      'data': {
        'user': user.toJson(),
      },
    };
  }
}

class User extends Equatable {
  final String id;
  final String username;
  final String fullname;
  final String email;

  User({
    required this.id,
    required this.username,
    required this.fullname,
    required this.email,
  });

  @override
  List<Object?> get props => [id, username, fullname, email];

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      fullname: json['fullname'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'fullname': fullname,
      'email': email,
    };
  }
}
