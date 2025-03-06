import 'package:e_commerce_app/features/signup/domain/entities/user_signup_entitiy.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_signup_model.g.dart';

@JsonSerializable()
class UserSignupModel extends UserSignupEntity {
  const UserSignupModel(
      {required super.uid, required super.email, required super.password});

  factory UserSignupModel.fromJson(Map<String, dynamic> json) =>
      _$UserSignupModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserSignupModelToJson(this);

}
