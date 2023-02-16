import 'dart:convert';

class UserModel {
  final String id;
  final String fullName;
  final String email;
  final String photoUrl;
  final String? mobileNumber;
  UserModel({
    required this.id,
    required this.fullName,
    required this.email,
    required this.photoUrl,
    this.mobileNumber,
  });

  UserModel copyWith({
    String? id,
    String? fullName,
    String? email,
    String? photoUrl,
  }) {
    return UserModel(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fullName': fullName,
      'email': email,
      'photoUrl': photoUrl,
      'mobileNumber': mobileNumber,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      fullName: map['fullName'] as String,
      email: map['email'] as String,
      photoUrl: map['photoUrl'] as String,
      mobileNumber: map['mobileNumber'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, fullName: $fullName, email: $email, photoUrl: $photoUrl)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.fullName == fullName &&
        other.email == email &&
        other.photoUrl == photoUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^ fullName.hashCode ^ email.hashCode ^ photoUrl.hashCode;
  }
}
