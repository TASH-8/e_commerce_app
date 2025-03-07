import 'package:e_commerce_app/features/forget_password/domain/entities/forget_user_entitiy.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_forget_model.g.dart';

@JsonSerializable()
class UserForgetModel extends ForgetUserEntity {
  const UserForgetModel({required super.email});

  factory UserForgetModel.fromJson(Map<String, dynamic> json) =>
      _$UserForgetModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserForgetModelToJson(this);
}
