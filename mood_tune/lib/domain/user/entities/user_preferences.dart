import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_preferences.freezed.dart';
part 'user_preferences.g.dart';

@freezed
class UserPreferences with _$UserPreferences {
  const factory UserPreferences({
    required String userId,
    @Default([]) List<String> favoriteGenres,
    required bool notificationsEnabled,
    String? dailyMoodReminderTime,
    required bool explicitContentAllowed,
  }) = _UserPreferences;

  factory UserPreferences.fromJson(Map<String, dynamic> json) =>
      _$UserPreferencesFromJson(json);
}
