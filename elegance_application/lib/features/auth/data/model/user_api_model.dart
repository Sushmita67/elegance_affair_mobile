import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/customer_entity.dart';


@JsonSerializable()
class UserApiModel extends Equatable {
  @JsonKey(name: '_id') // Maps the server field "_id" to the "userId" field
  final String? id;
  final String name;
  final String username;
  final String phone;
  final String email;
  final String password;
  final String? image;

  const UserApiModel({
    this.id,
    required this.name,
    required this.username,
    required this.phone,
    required this.email,
    required this.password,
    this.image,
  });

  const UserApiModel.empty()
      : id = '',
        name = '',
        username = '',
        phone = '',
        email = '',
        password = '',
        image = '';

  /// Factory constructor for creating a `UserApiModel` from JSON
  factory UserApiModel.fromJson(Map<String, dynamic> json) {
    return UserApiModel(
      id: json['_id'] as String?,
      name: json['name'] as String,
      username: json['username'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      image: json['photo'] as String?,
    );
  }

  /// Converts the current instance to JSON
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'username': username,
      'phone': phone,
      'email': email,
      'password': password,
      'image': image,
    };
  }

  /// Converts the API model to a domain entity
  CustomerEntity toEntity() => CustomerEntity(
    id: id,
    name: name,
    username: username,
    phone: phone,
    email: email,
    password: password,
    image: image,

  );

  /// Converts a domain entity to an API model
  factory UserApiModel.fromEntity(CustomerEntity entity) {
    return UserApiModel(
      id: entity.id,
      name: entity.name,
      username: entity.username,
      phone: entity.phone,
      email: entity.email,
      password: entity.password,
      image: entity.image,
    );
  }

  /// Converts a list of API models to a list of entities
  static List<CustomerEntity> toEntityList(List<UserApiModel> models) {
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  List<Object?> get props => [
    id,
    name,
    username,
    phone,
    email,
    password,
    image,
  ];
}
