import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/user/repositories/i_auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _authRepository;

  AuthBloc(this._authRepository) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) async {
      await event.map(
        authCheckRequested: (e) async {
          // This would ideally check an active stream or initial storage.
          // For now, emit unauthenticated since real stream logic is often in
          // auth facades. Or call it 'unauthenticated' as default if we don't have stored session.
          emit(const AuthState.unauthenticated());
        },
        signedOut: (e) async {
          emit(const AuthState.loading());
          await _authRepository.signOut();
          emit(const AuthState.unauthenticated());
        },
        signedIn: (e) async {
          emit(const AuthState.loading());
          final failureOrUser = await _authRepository.signIn(
            email: e.email,
            password: e.password,
          );
          emit(
            failureOrUser.fold(
              (failure) => AuthState.failure(failure),
              (user) => AuthState.authenticated(user),
            ),
          );
        },
        registered: (e) async {
          emit(const AuthState.loading());
          final failureOrUser = await _authRepository.signUp(
            email: e.email,
            password: e.password,
            displayName: e.displayName,
          );
          emit(
            failureOrUser.fold(
              (failure) => AuthState.failure(failure),
              (user) => AuthState.authenticated(user),
            ),
          );
        },
      );
    });
  }
}
