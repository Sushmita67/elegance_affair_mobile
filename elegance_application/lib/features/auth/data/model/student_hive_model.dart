import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:uuid/uuid.dart';

import '../../../../app/constants/hive_table_constant.dart';
import '../../domain/entity/student_entity.dart';

part 'student_hive_model.g.dart';
//dart run build_runner build -d

@HiveType(typeId: HiveTableConstant.studentTableId)
class StudentHiveModel extends Equatable {
  @HiveField(0)
  final String? studentId;

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

  StudentHiveModel({
    String? studentId,
    required this.fname,
    required this.lname,
    this.image,
    required this.phone,
    required this.username,
    required this.password,
  }) : studentId = studentId ?? const Uuid().v4();

  /// Initial constructor
  const StudentHiveModel.initial()
      : studentId = '',
        fname = '',
        lname = '',
        image = '',
        phone = '',
        username = '',
        password = '';

  // Convert from entity
  factory StudentHiveModel.fromEntity(StudentEntity entity) {
    return StudentHiveModel(
      studentId: entity.studentId,
      fname: entity.fname,
      lname: entity.lname,
      image: entity.image,
      phone: entity.phone,
      username: entity.username,
      password: entity.password,
    );
  }

  // Convert to entity
  StudentEntity toEntity() {
    return StudentEntity(
      studentId: studentId,
      fname: fname,
      lname: lname,
      image: image,
      phone: phone,
      username: username,
      password: password,
    );
  }

  static List<StudentHiveModel> fromEntityList(List<StudentEntity> entityList) {
    return entityList
        .map((entity) => StudentHiveModel.fromEntity(entity))
        .toList();
  }

  @override
  List<Object?> get props => [
        studentId,
        fname,
        lname,
        image,
        phone,
        username,
        password,
      ];
}
