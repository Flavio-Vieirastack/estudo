import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageMethods {
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
        encryptedSharedPreferences: true,
      );
  final options =
      const IOSOptions(accessibility: KeychainAccessibility.first_unlock);
  FlutterSecureStorage get storage => const FlutterSecureStorage();

  Future<void> save({required String key, required String value}) async {
    await storage.write(
      key: key,
      value: value,
      aOptions: _getAndroidOptions(),
      iOptions: options,
    );
  }

  Future<String?> getValue({required String key}) async {
    final data = await storage.read(
      key: key,
      aOptions: _getAndroidOptions(),
      iOptions: options,
    );
    log(data ?? 'Sem dados');
    return data;
  }
}
