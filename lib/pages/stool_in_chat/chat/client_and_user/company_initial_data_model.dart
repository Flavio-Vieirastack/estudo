import 'dart:convert';
import './company_situation_entity.dart';
import 'company_initial_data_entity.dart';


class CompanyInitialDataModel extends CompanyInitialDataEntity {
  CompanyInitialDataModel({
    super.firebaseUuid,
    super.name,
    super.urlImage,
    super.cnpj,
    super.latitude,
    super.longitude,
    super.signedAt,
    super.openHour,
    super.closeHour,
    super.breakForLunchHour,
    super.dashboardPassword,
    super.email,
    super.companySituation,
    super.firebasePushToken,
    super.isImpulsioned,
    super.id,
    super.createdAt,
    super.mainPhotoUrlImage,
    super.distance,
    super.maxSchedulesPerDay,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    if (maxSchedulesPerDay != null) {
      result.addAll({'maxSchedulesPerDay': maxSchedulesPerDay});
    }
    if (firebaseUuid != null) {
      result.addAll({'firebaseUuid': firebaseUuid});
    }
    if (mainPhotoUrlImage != null) {
      result.addAll({'mainPhotoUrlImage': mainPhotoUrlImage});
    }
    if (name != null) {
      result.addAll({'enterpriseName': name});
    }
    if (urlImage != null) {
      result.addAll({'photoLogoUrl': urlImage});
    }
    if (cnpj != null) {
      result.addAll({'cnpj': cnpj});
    }
    if (latitude != null) {
      result.addAll({'latitude': latitude});
    }
    if (longitude != null) {
      result.addAll({'longitude': longitude});
    }
    if (signedAt != null) {
      result.addAll({'signedAt': signedAt});
    }
    if (openHour != null) {
      result.addAll({'openHour': openHour});
    }
    if (closeHour != null) {
      result.addAll({'closeHour': closeHour});
    }
    if (breakForLunchHour != null) {
      result.addAll({'breakForLunch': breakForLunchHour});
    }
    if (dashboardPassword != null) {
      result.addAll({'dashboardPassword': dashboardPassword});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (companySituation?.status != null) {
      result.addAll({'situation': companySituation?.status});
    }
    if (firebasePushToken != null) {
      result.addAll({'firebasePushToken': firebasePushToken});
    }
    if (isImpulsioned != null) {
      result.addAll({'isImpulsioned': isImpulsioned});
    }

    return result;
  }

  factory CompanyInitialDataModel.fromMap(Map<String, dynamic> map) {
    return CompanyInitialDataModel(
      mainPhotoUrlImage: map['mainPhotoUrlImage'],
      firebaseUuid: map['firebaseUuid'] ?? '',
      name: map['enterpriseName'] ?? '',
      urlImage: map['photoLogoUrl'] ?? '',
      cnpj: map['cnpj'] ?? '',
      latitude: double.parse(map['latitude']),
      longitude: double.parse(map['longitude']),
      signedAt: map['signedAt'],
      openHour: map['openHour'] ?? '',
      closeHour: map['closeHour'] ?? '',
      breakForLunchHour: map['breakForLunch'] ?? '',
      dashboardPassword: map['dashboardPassword'] ?? '',
      email: map['email'] ?? '',
      companySituation: CompanySituationEntity.getStatus(
        map['situation'],
      ),
      firebasePushToken: List<String>.from(map['firebasePushToken']),
      isImpulsioned: map['isImpulsioned'] ?? false,
      id: map['id'] ?? 0,
      createdAt: DateTime.parse(map['createdAt']),
      maxSchedulesPerDay: map['maxSchedulesPerDay'],
      distance: CompanyInitialDataEntity.getFormatedDistance(map['distance']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyInitialDataModel.fromJson(String source) =>
      CompanyInitialDataModel.fromMap(json.decode(source));

  factory CompanyInitialDataModel.fromEntity(
      CompanyInitialDataEntity companyInitialDataEntity) {
    return CompanyInitialDataModel(
      firebaseUuid: companyInitialDataEntity.firebaseUuid,
      name: companyInitialDataEntity.name,
      urlImage: companyInitialDataEntity.urlImage,
      cnpj: companyInitialDataEntity.cnpj,
      latitude: companyInitialDataEntity.latitude,
      longitude: companyInitialDataEntity.longitude,
      openHour: companyInitialDataEntity.openHour,
      closeHour: companyInitialDataEntity.closeHour,
      breakForLunchHour: companyInitialDataEntity.breakForLunchHour,
      dashboardPassword: companyInitialDataEntity.dashboardPassword,
      email: companyInitialDataEntity.email,
      companySituation: companyInitialDataEntity.companySituation,
      firebasePushToken: companyInitialDataEntity.firebasePushToken,
      isImpulsioned: companyInitialDataEntity.isImpulsioned,
      mainPhotoUrlImage: companyInitialDataEntity.mainPhotoUrlImage,
      maxSchedulesPerDay: companyInitialDataEntity.maxSchedulesPerDay,
    );
  }
}
