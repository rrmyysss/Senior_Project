import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_event.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.authCheckRequested() = _AuthCheckRequested;
  const factory AuthEvent.signedOut() = _SignedOut;
  const factory AuthEvent.signedIn({
    required String email,
    required String password,
  }) = _SignedIn;
  const factory AuthEvent.registered({
    required String email,
    required String password,
    required String displayName,
  }) = _Registered;
}
