import 'dart:convert';

class User {
  final int? id;
  final String? name;
  final String? email;
  final String? password;
  bool? authenticated;
  bool? isLoggingIn;
  bool? loading;

  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.authenticated,
    this.isLoggingIn,
    this.loading,
  });

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
    bool? authenticated,
    bool? isLoggingIn,
    bool? loading,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      authenticated: authenticated ?? this.authenticated,
      isLoggingIn: isLoggingIn ?? this.isLoggingIn,
      loading: loading ?? this.loading,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is User &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ email.hashCode ^ password.hashCode;
  }
}
