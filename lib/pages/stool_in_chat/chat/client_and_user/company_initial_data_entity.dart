import './company_situation_entity.dart';

class CompanyInitialDataEntity {
  final String? firebaseUuid;
  final String? mainPhotoUrlImage;
  final String? name;
  final String? urlImage;
  final String? cnpj;
  final double? latitude;
  final double? longitude;
  final String? signedAt;
  final String? openHour;
  final String? closeHour;
  final String? breakForLunchHour;
  final String? dashboardPassword;
  final String? email;
  final CompanySituationEntity? companySituation;
  final Iterable<String>? firebasePushToken;
  final bool? isImpulsioned;
  final int? id;
  final DateTime? createdAt;
  final String? distance;
  final int? maxSchedulesPerDay;
  CompanyInitialDataEntity({
    this.firebaseUuid,
    this.name,
    this.urlImage,
    this.cnpj,
    this.latitude,
    this.longitude,
    this.signedAt,
    this.openHour,
    this.closeHour,
    this.breakForLunchHour,
    this.dashboardPassword,
    this.email,
    this.companySituation,
    this.firebasePushToken,
    this.isImpulsioned,
    this.id,
    this.createdAt,
    this.mainPhotoUrlImage,
    this.distance,
    this.maxSchedulesPerDay,
  });

  static String getFormatedDistance(String? distance) {
    if (distance != null) {
      final distanceToInt = int.parse(distance);
      if (distanceToInt >= 1000) {
        return '$distance KM';
      } else {
        return '$distance M';
      }
    }
    return 'Sem dados';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CompanyInitialDataEntity &&
        other.firebaseUuid == firebaseUuid &&
        other.mainPhotoUrlImage == mainPhotoUrlImage &&
        other.name == name &&
        other.urlImage == urlImage &&
        other.cnpj == cnpj &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.signedAt == signedAt &&
        other.openHour == openHour &&
        other.closeHour == closeHour &&
        other.breakForLunchHour == breakForLunchHour &&
        other.dashboardPassword == dashboardPassword &&
        other.email == email &&
        other.companySituation == companySituation &&
        other.firebasePushToken == firebasePushToken &&
        other.isImpulsioned == isImpulsioned &&
        other.id == id &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return firebaseUuid.hashCode ^
        mainPhotoUrlImage.hashCode ^
        name.hashCode ^
        urlImage.hashCode ^
        cnpj.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        signedAt.hashCode ^
        openHour.hashCode ^
        closeHour.hashCode ^
        breakForLunchHour.hashCode ^
        dashboardPassword.hashCode ^
        email.hashCode ^
        companySituation.hashCode ^
        firebasePushToken.hashCode ^
        isImpulsioned.hashCode ^
        id.hashCode ^
        createdAt.hashCode;
  }
}
