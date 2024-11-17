import 'dart:convert';

class SimpleToken {
  final String? token;
  final SimpleUser? user;

  SimpleToken({
    this.token,
    this.user,
  });

  SimpleToken copyWith({
    String? token,
    SimpleUser? user,
  }) {
    return SimpleToken(
      token: token ?? this.token,
      user: user ?? this.user,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'user': user?.toMap(),
    };
  }

  SimpleToken copyWithOnlyToken(
    String? token,
  ) {
    return SimpleToken(
      token: token ?? this.token,
    );
  }

  factory SimpleToken.fromMap(Map<String, dynamic> map) {
    return SimpleToken(
      token: map['token'] != null ? map['token'] as String : null,
      user: map['user'] != null
          ? SimpleUser.fromMap(map['user'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SimpleToken.fromJson(String source) =>
      SimpleToken.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SimpleToken(token: $token, user: $user)';

  @override
  bool operator ==(covariant SimpleToken other) {
    if (identical(this, other)) return true;

    return other.token == token && other.user == user;
  }

  @override
  int get hashCode => token.hashCode ^ user.hashCode;
}

class SimpleUser {
  final String name;
  final String userId;

  SimpleUser({
    required this.name,
    required this.userId,
  });

  SimpleUser copyWith({
    String? name,
    String? userId,
  }) {
    return SimpleUser(
      name: name ?? this.name,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'userId': userId,
    };
  }

  factory SimpleUser.fromMap(Map<String, dynamic> map) {
    return SimpleUser(
      name: map['name'] as String,
      userId: map['userId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory SimpleUser.fromJson(String source) =>
      SimpleUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SimpleUser(name: $name, userId: $userId)';

  @override
  bool operator ==(covariant SimpleUser other) {
    if (identical(this, other)) return true;

    return other.name == name && other.userId == userId;
  }

  @override
  int get hashCode => name.hashCode ^ userId.hashCode;
}
