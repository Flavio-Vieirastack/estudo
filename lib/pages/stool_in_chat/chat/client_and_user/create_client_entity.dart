class CreateClientEntity {
  final int? id;
  final String? email;
  final String? name;
  final String? firebaseUuid;
  final String? firebasePushToken;
  final String? photoUrl;
  CreateClientEntity({
    this.id,
    this.email,
    this.name,
    this.firebaseUuid,
    this.firebasePushToken,
    this.photoUrl,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CreateClientEntity &&
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
