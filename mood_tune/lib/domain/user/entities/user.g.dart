// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  uid: json['uid'] as String,
  email: json['email'] as String,
  displayName: json['displayName'] as String,
  photoUrl: json['photoUrl'] as String?,
  lastMood: json['lastMood'] as String?,
  preferredLanguage: json['preferredLanguage'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  onboardingCompleted: json['onboardingCompleted'] as bool,
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'uid': instance.uid,
  'email': instance.email,
  'displayName': instance.displayName,
  'photoUrl': instance.photoUrl,
  'lastMood': instance.lastMood,
  'preferredLanguage': instance.preferredLanguage,
  'createdAt': instance.createdAt.toIso8601String(),
  'onboardingCompleted': instance.onboardingCompleted,
};
