// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  uid: json['uid'] as String,
  email: json['email'] as String,
  displayName: json['displayName'] as String,
  photoUrl: json['photoUrl'] as String?,
  lastMood: json['lastMood'] as String?,
  preferredLanguage: json['preferredLanguage'] as String?,
  createdAt: json['createdAt'] as String,
  onboardingCompleted: json['onboardingCompleted'] as bool,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'email': instance.email,
      'displayName': instance.displayName,
      'photoUrl': instance.photoUrl,
      'lastMood': instance.lastMood,
      'preferredLanguage': instance.preferredLanguage,
      'createdAt': instance.createdAt,
      'onboardingCompleted': instance.onboardingCompleted,
    };
