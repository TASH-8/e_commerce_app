import 'package:e_commerce_app/features/login/domain/entities/user_login_entity.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_login_models.g.dart';

@JsonSerializable()
class UserLoginModels extends UserLoginEntities {
  const UserLoginModels({required super.email, required super.password});

  factory UserLoginModels.fromJson(Map<String, dynamic> json) =>
      _$UserLoginModelsFromJson(json);

  Map<String, dynamic> toJson() => _$UserLoginModelsToJson(this);
}
