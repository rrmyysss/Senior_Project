// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Failure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure()';
}


}

/// @nodoc
class $FailureCopyWith<$Res>  {
$FailureCopyWith(Failure _, $Res Function(Failure) __);
}


/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NetworkFailure value)?  network,TResult Function( ServerFailure value)?  server,TResult Function( AuthFailure value)?  auth,TResult Function( FaceNotDetectedFailure value)?  faceNotDetected,TResult Function( LowConfidenceFailure value)?  lowConfidence,TResult Function( TFLiteModelFailure value)?  tfliteModel,TResult Function( YouTubeQuotaFailure value)?  youTubeQuota,TResult Function( YouTubeRegionFailure value)?  youTubeRegion,TResult Function( CacheExpiredFailure value)?  cacheExpired,TResult Function( EmptyTracksFailure value)?  emptyTracks,TResult Function( FirestoreFailure value)?  firestore,TResult Function( UnexpectedFailure value)?  unexpected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NetworkFailure() when network != null:
return network(_that);case ServerFailure() when server != null:
return server(_that);case AuthFailure() when auth != null:
return auth(_that);case FaceNotDetectedFailure() when faceNotDetected != null:
return faceNotDetected(_that);case LowConfidenceFailure() when lowConfidence != null:
return lowConfidence(_that);case TFLiteModelFailure() when tfliteModel != null:
return tfliteModel(_that);case YouTubeQuotaFailure() when youTubeQuota != null:
return youTubeQuota(_that);case YouTubeRegionFailure() when youTubeRegion != null:
return youTubeRegion(_that);case CacheExpiredFailure() when cacheExpired != null:
return cacheExpired(_that);case EmptyTracksFailure() when emptyTracks != null:
return emptyTracks(_that);case FirestoreFailure() when firestore != null:
return firestore(_that);case UnexpectedFailure() when unexpected != null:
return unexpected(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NetworkFailure value)  network,required TResult Function( ServerFailure value)  server,required TResult Function( AuthFailure value)  auth,required TResult Function( FaceNotDetectedFailure value)  faceNotDetected,required TResult Function( LowConfidenceFailure value)  lowConfidence,required TResult Function( TFLiteModelFailure value)  tfliteModel,required TResult Function( YouTubeQuotaFailure value)  youTubeQuota,required TResult Function( YouTubeRegionFailure value)  youTubeRegion,required TResult Function( CacheExpiredFailure value)  cacheExpired,required TResult Function( EmptyTracksFailure value)  emptyTracks,required TResult Function( FirestoreFailure value)  firestore,required TResult Function( UnexpectedFailure value)  unexpected,}){
final _that = this;
switch (_that) {
case NetworkFailure():
return network(_that);case ServerFailure():
return server(_that);case AuthFailure():
return auth(_that);case FaceNotDetectedFailure():
return faceNotDetected(_that);case LowConfidenceFailure():
return lowConfidence(_that);case TFLiteModelFailure():
return tfliteModel(_that);case YouTubeQuotaFailure():
return youTubeQuota(_that);case YouTubeRegionFailure():
return youTubeRegion(_that);case CacheExpiredFailure():
return cacheExpired(_that);case EmptyTracksFailure():
return emptyTracks(_that);case FirestoreFailure():
return firestore(_that);case UnexpectedFailure():
return unexpected(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NetworkFailure value)?  network,TResult? Function( ServerFailure value)?  server,TResult? Function( AuthFailure value)?  auth,TResult? Function( FaceNotDetectedFailure value)?  faceNotDetected,TResult? Function( LowConfidenceFailure value)?  lowConfidence,TResult? Function( TFLiteModelFailure value)?  tfliteModel,TResult? Function( YouTubeQuotaFailure value)?  youTubeQuota,TResult? Function( YouTubeRegionFailure value)?  youTubeRegion,TResult? Function( CacheExpiredFailure value)?  cacheExpired,TResult? Function( EmptyTracksFailure value)?  emptyTracks,TResult? Function( FirestoreFailure value)?  firestore,TResult? Function( UnexpectedFailure value)?  unexpected,}){
final _that = this;
switch (_that) {
case NetworkFailure() when network != null:
return network(_that);case ServerFailure() when server != null:
return server(_that);case AuthFailure() when auth != null:
return auth(_that);case FaceNotDetectedFailure() when faceNotDetected != null:
return faceNotDetected(_that);case LowConfidenceFailure() when lowConfidence != null:
return lowConfidence(_that);case TFLiteModelFailure() when tfliteModel != null:
return tfliteModel(_that);case YouTubeQuotaFailure() when youTubeQuota != null:
return youTubeQuota(_that);case YouTubeRegionFailure() when youTubeRegion != null:
return youTubeRegion(_that);case CacheExpiredFailure() when cacheExpired != null:
return cacheExpired(_that);case EmptyTracksFailure() when emptyTracks != null:
return emptyTracks(_that);case FirestoreFailure() when firestore != null:
return firestore(_that);case UnexpectedFailure() when unexpected != null:
return unexpected(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  network,TResult Function( String? message)?  server,TResult Function( String? message)?  auth,TResult Function()?  faceNotDetected,TResult Function()?  lowConfidence,TResult Function()?  tfliteModel,TResult Function()?  youTubeQuota,TResult Function()?  youTubeRegion,TResult Function()?  cacheExpired,TResult Function()?  emptyTracks,TResult Function( String? message)?  firestore,TResult Function()?  unexpected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NetworkFailure() when network != null:
return network();case ServerFailure() when server != null:
return server(_that.message);case AuthFailure() when auth != null:
return auth(_that.message);case FaceNotDetectedFailure() when faceNotDetected != null:
return faceNotDetected();case LowConfidenceFailure() when lowConfidence != null:
return lowConfidence();case TFLiteModelFailure() when tfliteModel != null:
return tfliteModel();case YouTubeQuotaFailure() when youTubeQuota != null:
return youTubeQuota();case YouTubeRegionFailure() when youTubeRegion != null:
return youTubeRegion();case CacheExpiredFailure() when cacheExpired != null:
return cacheExpired();case EmptyTracksFailure() when emptyTracks != null:
return emptyTracks();case FirestoreFailure() when firestore != null:
return firestore(_that.message);case UnexpectedFailure() when unexpected != null:
return unexpected();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  network,required TResult Function( String? message)  server,required TResult Function( String? message)  auth,required TResult Function()  faceNotDetected,required TResult Function()  lowConfidence,required TResult Function()  tfliteModel,required TResult Function()  youTubeQuota,required TResult Function()  youTubeRegion,required TResult Function()  cacheExpired,required TResult Function()  emptyTracks,required TResult Function( String? message)  firestore,required TResult Function()  unexpected,}) {final _that = this;
switch (_that) {
case NetworkFailure():
return network();case ServerFailure():
return server(_that.message);case AuthFailure():
return auth(_that.message);case FaceNotDetectedFailure():
return faceNotDetected();case LowConfidenceFailure():
return lowConfidence();case TFLiteModelFailure():
return tfliteModel();case YouTubeQuotaFailure():
return youTubeQuota();case YouTubeRegionFailure():
return youTubeRegion();case CacheExpiredFailure():
return cacheExpired();case EmptyTracksFailure():
return emptyTracks();case FirestoreFailure():
return firestore(_that.message);case UnexpectedFailure():
return unexpected();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  network,TResult? Function( String? message)?  server,TResult? Function( String? message)?  auth,TResult? Function()?  faceNotDetected,TResult? Function()?  lowConfidence,TResult? Function()?  tfliteModel,TResult? Function()?  youTubeQuota,TResult? Function()?  youTubeRegion,TResult? Function()?  cacheExpired,TResult? Function()?  emptyTracks,TResult? Function( String? message)?  firestore,TResult? Function()?  unexpected,}) {final _that = this;
switch (_that) {
case NetworkFailure() when network != null:
return network();case ServerFailure() when server != null:
return server(_that.message);case AuthFailure() when auth != null:
return auth(_that.message);case FaceNotDetectedFailure() when faceNotDetected != null:
return faceNotDetected();case LowConfidenceFailure() when lowConfidence != null:
return lowConfidence();case TFLiteModelFailure() when tfliteModel != null:
return tfliteModel();case YouTubeQuotaFailure() when youTubeQuota != null:
return youTubeQuota();case YouTubeRegionFailure() when youTubeRegion != null:
return youTubeRegion();case CacheExpiredFailure() when cacheExpired != null:
return cacheExpired();case EmptyTracksFailure() when emptyTracks != null:
return emptyTracks();case FirestoreFailure() when firestore != null:
return firestore(_that.message);case UnexpectedFailure() when unexpected != null:
return unexpected();case _:
  return null;

}
}

}

/// @nodoc


class NetworkFailure implements Failure {
  const NetworkFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.network()';
}


}




/// @nodoc


class ServerFailure implements Failure {
  const ServerFailure({this.message});
  

 final  String? message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerFailureCopyWith<ServerFailure> get copyWith => _$ServerFailureCopyWithImpl<ServerFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.server(message: $message)';
}


}

/// @nodoc
abstract mixin class $ServerFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $ServerFailureCopyWith(ServerFailure value, $Res Function(ServerFailure) _then) = _$ServerFailureCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$ServerFailureCopyWithImpl<$Res>
    implements $ServerFailureCopyWith<$Res> {
  _$ServerFailureCopyWithImpl(this._self, this._then);

  final ServerFailure _self;
  final $Res Function(ServerFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(ServerFailure(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class AuthFailure implements Failure {
  const AuthFailure({this.message});
  

 final  String? message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthFailureCopyWith<AuthFailure> get copyWith => _$AuthFailureCopyWithImpl<AuthFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.auth(message: $message)';
}


}

/// @nodoc
abstract mixin class $AuthFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $AuthFailureCopyWith(AuthFailure value, $Res Function(AuthFailure) _then) = _$AuthFailureCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$AuthFailureCopyWithImpl<$Res>
    implements $AuthFailureCopyWith<$Res> {
  _$AuthFailureCopyWithImpl(this._self, this._then);

  final AuthFailure _self;
  final $Res Function(AuthFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(AuthFailure(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class FaceNotDetectedFailure implements Failure {
  const FaceNotDetectedFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaceNotDetectedFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.faceNotDetected()';
}


}




/// @nodoc


class LowConfidenceFailure implements Failure {
  const LowConfidenceFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LowConfidenceFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.lowConfidence()';
}


}




/// @nodoc


class TFLiteModelFailure implements Failure {
  const TFLiteModelFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TFLiteModelFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.tfliteModel()';
}


}




/// @nodoc


class YouTubeQuotaFailure implements Failure {
  const YouTubeQuotaFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is YouTubeQuotaFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.youTubeQuota()';
}


}




/// @nodoc


class YouTubeRegionFailure implements Failure {
  const YouTubeRegionFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is YouTubeRegionFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.youTubeRegion()';
}


}




/// @nodoc


class CacheExpiredFailure implements Failure {
  const CacheExpiredFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CacheExpiredFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.cacheExpired()';
}


}




/// @nodoc


class EmptyTracksFailure implements Failure {
  const EmptyTracksFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmptyTracksFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.emptyTracks()';
}


}




/// @nodoc


class FirestoreFailure implements Failure {
  const FirestoreFailure({this.message});
  

 final  String? message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FirestoreFailureCopyWith<FirestoreFailure> get copyWith => _$FirestoreFailureCopyWithImpl<FirestoreFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FirestoreFailure&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.firestore(message: $message)';
}


}

/// @nodoc
abstract mixin class $FirestoreFailureCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $FirestoreFailureCopyWith(FirestoreFailure value, $Res Function(FirestoreFailure) _then) = _$FirestoreFailureCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$FirestoreFailureCopyWithImpl<$Res>
    implements $FirestoreFailureCopyWith<$Res> {
  _$FirestoreFailureCopyWithImpl(this._self, this._then);

  final FirestoreFailure _self;
  final $Res Function(FirestoreFailure) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(FirestoreFailure(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class UnexpectedFailure implements Failure {
  const UnexpectedFailure();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnexpectedFailure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.unexpected()';
}


}




// dart format on
