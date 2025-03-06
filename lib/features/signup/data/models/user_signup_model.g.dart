// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_signup_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSignupModel _$UserSignupModelFromJson(Map<String, dynamic> json) =>
    UserSignupModel(
      uid: json['uid'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserSignupModelToJson(UserSignupModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'password': instance.password,
    };
