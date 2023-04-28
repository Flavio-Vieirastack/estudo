import 'dart:convert';

import 'create_client_entity.dart';


class CreateClientModel extends CreateClientEntity {
  CreateClientModel({
    super.id,
    super.email,
    super.name,
    super.firebaseUuid,
    super.firebasePushToken,
    super.photoUrl,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (email != null) {
      result.addAll({'email': email});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (firebaseUuid != null) {
      result.addAll({'firebaseUuid': firebaseUuid});
    }
    if (firebasePushToken != null) {
      result.addAll({'firebasePushToken': firebasePushToken});
    }
    if (photoUrl != null) {
      result.addAll({'photoUrl': photoUrl});
    }

    return result;
  }

  factory CreateClientModel.fromMap(Map<String, dynamic> map) {
    return CreateClientModel(
      id: map['id']?.toInt(),
      email: map['email'],
      name: map['name'],
      firebaseUuid: map['firebaseUuid'],
      firebasePushToken: map['firebasePushToken'],
      photoUrl: map['photoUrl'],
    );
  }

  factory CreateClientModel.fromEntity(CreateClientEntity createClientEntity) {
    return CreateClientModel(
      email: createClientEntity.email,
      firebasePushToken: createClientEntity.firebasePushToken,
      firebaseUuid: createClientEntity.firebaseUuid,
      id: createClientEntity.id,
      name: createClientEntity.name,
      photoUrl: createClientEntity.photoUrl,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateClientModel.fromJson(String source) =>
      CreateClientModel.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreateClientModel &&
        other.id == id &&
        other.email == email &&
        other.name == name &&
        other.firebaseUuid == firebaseUuid &&
        other.firebasePushToken == firebasePushToken &&
        other.photoUrl == photoUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        email.hashCode ^
        name.hashCode ^
        firebaseUuid.hashCode ^
        firebasePushToken.hashCode ^
        photoUrl.hashCode;
  }
}
