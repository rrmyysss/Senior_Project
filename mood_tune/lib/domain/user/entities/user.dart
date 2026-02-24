import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String uid,
    required String email,
    required String displayName,
    String? photoUrl,
    String? lastMood,
    String? preferredLanguage,
    required DateTime createdAt,
    required bool onboardingCompleted,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
