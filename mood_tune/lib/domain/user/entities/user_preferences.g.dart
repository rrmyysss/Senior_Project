// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserPreferences _$UserPreferencesFromJson(Map<String, dynamic> json) =>
    _UserPreferences(
      userId: json['userId'] as String,
      favoriteGenres:
          (json['favoriteGenres'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      notificationsEnabled: json['notificationsEnabled'] as bool,
      dailyMoodReminderTime: json['dailyMoodReminderTime'] as String?,
      explicitContentAllowed: json['explicitContentAllowed'] as bool,
    );

Map<String, dynamic> _$UserPreferencesToJson(_UserPreferences instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'favoriteGenres': instance.favoriteGenres,
      'notificationsEnabled': instance.notificationsEnabled,
      'dailyMoodReminderTime': instance.dailyMoodReminderTime,
      'explicitContentAllowed': instance.explicitContentAllowed,
    };
