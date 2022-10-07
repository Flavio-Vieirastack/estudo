import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_test/core/local_datasource/model/user_model.dart';
import 'package:project_test/core/local_datasource/secure_storage_methods.dart';

class SecureStorageTeste extends StatefulWidget {
  const SecureStorageTeste({Key? key}) : super(key: key);

  @override
  State<SecureStorageTeste> createState() => _SecureStorageTesteState();
}

class _SecureStorageTesteState extends State<SecureStorageTeste> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final model = UserModel(name: 'name', email: 'email').toJson();
      final storage = SecureStorageMethods();
      await storage.save(key: 'teste', value: model);
      final modelCache = await SecureStorageMethods().getValue(key: 'teste');
      final data = UserModel.fromMap(jsonDecode(modelCache!));
      log(data.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(),
    );
  }
}
