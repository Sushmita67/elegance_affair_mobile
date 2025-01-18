import 'package:elegance_application/features/auth/data/model/customer_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CustomerHiveModelAdapter extends TypeAdapter<CustomerHiveModel> {
  @override
  final int typeId = 7;

  @override
  CustomerHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CustomerHiveModel(
      customerId: fields[0] as String?,
      fname: fields[1] as String,
      lname: fields[2] as String,
      image: fields[3] as String?,
      phone: fields[4] as String,
      username: fields[7] as String,
      password: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CustomerHiveModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.customerId)
      ..writeByte(1)
      ..write(obj.fname)
      ..writeByte(2)
      ..write(obj.lname)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.phone)
      ..writeByte(7)
      ..write(obj.username)
      ..writeByte(8)
      ..write(obj.password);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomerHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
