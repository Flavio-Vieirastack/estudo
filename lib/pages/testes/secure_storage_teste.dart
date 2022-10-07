import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:project_test/core/local_datasource/model/user_model.dart';

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
      await UserModel(name: 'name', email: 'email').saveInCache();
      final data = await UserModel.getFromCache();
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
