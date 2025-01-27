import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:uuid/uuid.dart';

import '../../../../app/constants/hive_table_constant.dart';
import '../../domain/entity/user_entity.dart';

part 'user_hive_model.g.dart';


//dart run build_runner build -d

@HiveType(typeId: HiveTableConstant.userTableId)
class UserHiveModel extends Equatable {
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String email;

  @HiveField(3)
  final String? image;

  @HiveField(4)
  final String phone;

  @HiveField(7)
  final String username;

  @HiveField(8)
  final String password;

  UserHiveModel({
    String? id,
    required this.name,
    required this.email,
    this.image,
    required this.phone,
    required this.username,
    required this.password,
  }) : id = id ?? const Uuid().v4();

  /// Initial constructor
  const UserHiveModel.initial()
      : id = '',
        name = '',
        email = '',
        image = '',
        phone = '',
        username = '',
        password = '';

  // Convert from entity
  factory UserHiveModel.fromEntity(UserEntity entity) {
    return UserHiveModel(
      id: entity.id,
      name: entity.name,
      email: entity.email,
      image: entity.image,
      phone: entity.phone,
      username: entity.username,
      password: entity.password,
    );
  }

  // Convert to entity
  UserEntity toEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
      image: image,
      phone: phone,
      username: username,
      password: password,
    );
  }

  static List<UserHiveModel> fromEntityList(
      List<UserEntity> entityList) {
    return entityList
        .map((entity) => UserHiveModel.fromEntity(entity))
        .toList();
  }

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        image,
        phone,
        username,
        password,
      ];
}
