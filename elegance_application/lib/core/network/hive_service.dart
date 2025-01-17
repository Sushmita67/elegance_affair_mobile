import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../../app/constants/hive_table_constant.dart';
import '../../features/auth/data/model/student_hive_model.dart';

class HiveService {
  Future<void> init() async {

    //Initialize the Database
    var directory = await getApplicationDocumentsDirectory();
    var path = '${directory.path}elegance_application.db';

    //Create Database
    Hive.init(path);

    //Register Adapters

    Hive.registerAdapter(StudentHiveModelAdapter());

  }


// Student Queries
  Future<void> addStudent(StudentHiveModel student) async {
    var box =
    await Hive.openBox<StudentHiveModel>(HiveTableConstant.studentBox);
    await box.put(student.studentId, student);
  }

  Future<void> deleteStudent(String id) async {
    var box =
    await Hive.openBox<StudentHiveModel>(HiveTableConstant.studentBox);
    await box.delete(id);
  }

  Future<List<StudentHiveModel>> getAllStudents() async {
    var box =
    await Hive.openBox<StudentHiveModel>(HiveTableConstant.studentBox);
    var students = box.values.toList();
    return students;
  }

  Future<StudentHiveModel?> loginStudent(String username, String password) async {
    var box =
    await Hive.openBox<StudentHiveModel>(HiveTableConstant.studentBox);

    var auth = box.values.firstWhere(
            (element) =>
        element.username == username && element.password == password,
        orElse: () => StudentHiveModel.initial());

    return auth;
  }





}
