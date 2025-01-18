import 'package:elegance_application/features/auth/domain/entity/customer_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:uuid/uuid.dart';

import '../../../../app/constants/hive_table_constant.dart';

//dart run build_runner build -d

@HiveType(typeId: HiveTableConstant.customerTableId)
class CustomerHiveModel extends Equatable {
  @HiveField(0)
  final String? customerId;

  @HiveField(1)
  final String fname;

  @HiveField(2)
  final String lname;

  @HiveField(3)
  final String? image;

  @HiveField(4)
  final String phone;

  @HiveField(7)
  final String username;

  @HiveField(8)
  final String password;

  CustomerHiveModel({
    String? customerId,
    required this.fname,
    required this.lname,
    this.image,
    required this.phone,
    required this.username,
    required this.password,
  }) : customerId = customerId ?? const Uuid().v4();

  /// Initial constructor
  const CustomerHiveModel.initial()
      : customerId = '',
        fname = '',
        lname = '',
        image = '',
        phone = '',
        username = '',
        password = '';

  // Convert from entity
  factory CustomerHiveModel.fromEntity(CustomerEntity entity) {
    return CustomerHiveModel(
      customerId: entity.customerId,
      fname: entity.fname,
      lname: entity.lname,
      image: entity.image,
      phone: entity.phone,
      username: entity.username,
      password: entity.password,
    );
  }

  // Convert to entity
  CustomerEntity toEntity() {
    return CustomerEntity(
      customerId: customerId,
      fname: fname,
      lname: lname,
      image: image,
      phone: phone,
      username: username,
      password: password,
    );
  }

  static List<CustomerHiveModel> fromEntityList(
      List<CustomerEntity> entityList) {
    return entityList
        .map((entity) => CustomerHiveModel.fromEntity(entity))
        .toList();
  }

  @override
  List<Object?> get props => [
        customerId,
        fname,
        lname,
        image,
        phone,
        username,
        password,
      ];
}
