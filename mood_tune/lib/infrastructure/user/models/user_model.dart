import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../domain/user/entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String uid,
    required String email,
    required String displayName,
    String? photoUrl,
    String? lastMood,
    String? preferredLanguage,
    required String createdAt, // Stored as ISO8601 string for simplicity, or timestamp
    required bool onboardingCompleted,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromDomain(User user) {
    return UserModel(
      uid: user.uid,
      email: user.email,
      displayName: user.displayName,
      photoUrl: user.photoUrl,
      lastMood: user.lastMood,
      preferredLanguage: user.preferredLanguage,
      createdAt: user.createdAt.toIso8601String(),
      onboardingCompleted: user.onboardingCompleted,
    );
  }

  User toDomain() {
    return User(
      uid: uid,
      email: email,
      displayName: displayName,
      photoUrl: photoUrl,
      lastMood: lastMood,
      preferredLanguage: preferredLanguage,
      createdAt: DateTime.parse(createdAt),
      onboardingCompleted: onboardingCompleted,
    );
  }
}
