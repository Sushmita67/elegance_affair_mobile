import 'package:elegance_application/features/auth/data/model/customer_hive_model.dart';
import 'package:elegance_application/features/auth/data/model/customer_hive_model.g.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import '../../app/constants/hive_table_constant.dart';

class HiveService {
  Future<void> init() async {
    //Initialize the Database
    var directory = await getApplicationDocumentsDirectory();
    var path = '${directory.path}elegance_application.db';

    //Create Database
    Hive.init(path);

    //Register Adapters
    Hive.registerAdapter(CustomerHiveModelAdapter());
  }

  // Customer Queries
  Future<void> addCustomer(CustomerHiveModel customer) async {
    var box =
        await Hive.openBox<CustomerHiveModel>(HiveTableConstant.customerBox);
    await box.put(customer.customerId, customer);
  }

  Future<void> deleteCustomer(String id) async {
    var box =
        await Hive.openBox<CustomerHiveModel>(HiveTableConstant.customerBox);
    await box.delete(id);
  }

  Future<List<CustomerHiveModel>> getAllCustomers() async {
    var box =
        await Hive.openBox<CustomerHiveModel>(HiveTableConstant.customerBox);
    var customers = box.values.toList();
    return customers;
  }

  Future<CustomerHiveModel?> loginCustomer(
      String username, String password) async {
    var box =
        await Hive.openBox<CustomerHiveModel>(HiveTableConstant.customerBox);

    var auth = box.values.firstWhere(
        (element) =>
            element.username == username && element.password == password,
        orElse: () => CustomerHiveModel.initial());

    return auth;
  }
}
