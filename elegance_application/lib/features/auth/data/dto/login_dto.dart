import 'package:json_annotation/json_annotation.dart';

part 'login_dto.g.dart';

@JsonSerializable()
class LoginDTO {
  final bool success;
  final String token;
  final int statusCode;

  LoginDTO({
    required this.success,
    required this.token,
    required this.statusCode,

  });

  /// Factory constructor for creating a `LoginDTO` from JSON
  factory LoginDTO.fromJson(Map<String, dynamic> json) =>
      _$LoginDTOFromJson(json);

  /// Converts the current instance to JSON
  Map<String, dynamic> toJson() => _$LoginDTOToJson(this);
}
