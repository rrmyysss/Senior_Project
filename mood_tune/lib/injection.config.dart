// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'application/auth/bloc/auth_bloc.dart' as _i81;
import 'application/mood/bloc/mood_bloc.dart' as _i677;
import 'application/music/bloc/music_bloc.dart' as _i619;
import 'domain/mood/repositories/i_mood_repository.dart' as _i126;
import 'domain/music/repositories/i_music_repository.dart' as _i67;
import 'domain/user/repositories/i_auth_repository.dart' as _i369;
import 'infrastructure/auth/repositories/auth_repository_impl.dart' as _i725;
import 'infrastructure/core/injectable_module.dart' as _i1026;
import 'infrastructure/mood/repositories/mood_repository_impl.dart' as _i823;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final firebaseInjectableModule = _$FirebaseInjectableModule();
    gh.lazySingleton<_i59.FirebaseAuth>(
      () => firebaseInjectableModule.firebaseAuth,
    );
    gh.lazySingleton<_i974.FirebaseFirestore>(
      () => firebaseInjectableModule.firestore,
    );
    gh.lazySingleton<_i369.IAuthRepository>(
      () => _i725.AuthRepositoryImpl(
        gh<_i59.FirebaseAuth>(),
        gh<_i974.FirebaseFirestore>(),
      ),
    );
    gh.factory<_i619.MusicBloc>(
      () => _i619.MusicBloc(gh<_i67.IMusicRepository>()),
    );
    gh.factory<_i81.AuthBloc>(() => _i81.AuthBloc(gh<_i369.IAuthRepository>()));
    gh.lazySingleton<_i126.IMoodRepository>(
      () => _i823.MoodRepositoryImpl(gh<_i974.FirebaseFirestore>()),
    );
    gh.factory<_i677.MoodBloc>(
      () => _i677.MoodBloc(gh<_i126.IMoodRepository>()),
    );
    return this;
  }
}

class _$FirebaseInjectableModule extends _i1026.FirebaseInjectableModule {}
