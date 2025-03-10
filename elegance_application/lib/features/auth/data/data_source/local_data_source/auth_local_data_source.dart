import 'dart:io';

import 'package:elegance/core/network/hive_service.dart';
import 'package:elegance/features/auth/data/data_source/auth_data_source.dart';
import 'package:elegance/features/auth/data/model/auth_hive_model.dart';
import 'package:elegance/features/auth/domain/entity/auth_entity.dart';
import 'package:elegance/features/auth/domain/use_case/login_usecase.dart';

class AuthLocalDataSource implements IAuthDataSource {
  final HiveService _hiveService;

  AuthLocalDataSource(this._hiveService);

  @override
  Future<AuthEntity> getCurrentUser() {
    return Future.value(const AuthEntity(
      userId: '',
      name: '',
      username: '',
      password: '',
      email: '',
      phone: '',
      image: null,
      age: 19,
    ));
  }

  @override
  Future<AuthResponse> loginUser(String username, String password) async {
    try {
      await _hiveService.login(username, password);
      return Future.value(const AuthResponse(token: 'token', userId: 'userId'));
    } catch (e) {
      return Future.error('Login failed: $e');
    }
  }

  @override
  Future<void> registerUser(AuthEntity user) async {
    try {
      // Convert AuthEntity to AuthHiveModel
      final authHiveModel = AuthHiveModel.fromEntity(user);

      await _hiveService.register(authHiveModel);
      return Future.value();
    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<String> uploadProfilePicture(File file) {
    // TODO: implement uploadProfilePicture
    throw UnimplementedError();
  }
  
  @override
  Future<void> updateUser(String name, String email, int age, String phone) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
