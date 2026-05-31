// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _AuthCheckRequested value)?  authCheckRequested,TResult Function( _SignedOut value)?  signedOut,TResult Function( _SignedIn value)?  signedIn,TResult Function( _Registered value)?  registered,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthCheckRequested() when authCheckRequested != null:
return authCheckRequested(_that);case _SignedOut() when signedOut != null:
return signedOut(_that);case _SignedIn() when signedIn != null:
return signedIn(_that);case _Registered() when registered != null:
return registered(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _AuthCheckRequested value)  authCheckRequested,required TResult Function( _SignedOut value)  signedOut,required TResult Function( _SignedIn value)  signedIn,required TResult Function( _Registered value)  registered,}){
final _that = this;
switch (_that) {
case _AuthCheckRequested():
return authCheckRequested(_that);case _SignedOut():
return signedOut(_that);case _SignedIn():
return signedIn(_that);case _Registered():
return registered(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _AuthCheckRequested value)?  authCheckRequested,TResult? Function( _SignedOut value)?  signedOut,TResult? Function( _SignedIn value)?  signedIn,TResult? Function( _Registered value)?  registered,}){
final _that = this;
switch (_that) {
case _AuthCheckRequested() when authCheckRequested != null:
return authCheckRequested(_that);case _SignedOut() when signedOut != null:
return signedOut(_that);case _SignedIn() when signedIn != null:
return signedIn(_that);case _Registered() when registered != null:
return registered(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  authCheckRequested,TResult Function()?  signedOut,TResult Function( String email,  String password)?  signedIn,TResult Function( String email,  String password,  String displayName)?  registered,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthCheckRequested() when authCheckRequested != null:
return authCheckRequested();case _SignedOut() when signedOut != null:
return signedOut();case _SignedIn() when signedIn != null:
return signedIn(_that.email,_that.password);case _Registered() when registered != null:
return registered(_that.email,_that.password,_that.displayName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  authCheckRequested,required TResult Function()  signedOut,required TResult Function( String email,  String password)  signedIn,required TResult Function( String email,  String password,  String displayName)  registered,}) {final _that = this;
switch (_that) {
case _AuthCheckRequested():
return authCheckRequested();case _SignedOut():
return signedOut();case _SignedIn():
return signedIn(_that.email,_that.password);case _Registered():
return registered(_that.email,_that.password,_that.displayName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  authCheckRequested,TResult? Function()?  signedOut,TResult? Function( String email,  String password)?  signedIn,TResult? Function( String email,  String password,  String displayName)?  registered,}) {final _that = this;
switch (_that) {
case _AuthCheckRequested() when authCheckRequested != null:
return authCheckRequested();case _SignedOut() when signedOut != null:
return signedOut();case _SignedIn() when signedIn != null:
return signedIn(_that.email,_that.password);case _Registered() when registered != null:
return registered(_that.email,_that.password,_that.displayName);case _:
  return null;

}
}

}

/// @nodoc


class _AuthCheckRequested implements AuthEvent {
  const _AuthCheckRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthCheckRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.authCheckRequested()';
}


}




/// @nodoc


class _SignedOut implements AuthEvent {
  const _SignedOut();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignedOut);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.signedOut()';
}


}




/// @nodoc


class _SignedIn implements AuthEvent {
  const _SignedIn({required this.email, required this.password});
  

 final  String email;
 final  String password;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignedInCopyWith<_SignedIn> get copyWith => __$SignedInCopyWithImpl<_SignedIn>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignedIn&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password));
}


@override
int get hashCode => Object.hash(runtimeType,email,password);

@override
String toString() {
  return 'AuthEvent.signedIn(email: $email, password: $password)';
}


}

/// @nodoc
abstract mixin class _$SignedInCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$SignedInCopyWith(_SignedIn value, $Res Function(_SignedIn) _then) = __$SignedInCopyWithImpl;
@useResult
$Res call({
 String email, String password
});




}
/// @nodoc
class __$SignedInCopyWithImpl<$Res>
    implements _$SignedInCopyWith<$Res> {
  __$SignedInCopyWithImpl(this._self, this._then);

  final _SignedIn _self;
  final $Res Function(_SignedIn) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,}) {
  return _then(_SignedIn(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Registered implements AuthEvent {
  const _Registered({required this.email, required this.password, required this.displayName});
  

 final  String email;
 final  String password;
 final  String displayName;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisteredCopyWith<_Registered> get copyWith => __$RegisteredCopyWithImpl<_Registered>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Registered&&(identical(other.email, email) || other.email == email)&&(identical(other.password, password) || other.password == password)&&(identical(other.displayName, displayName) || other.displayName == displayName));
}


@override
int get hashCode => Object.hash(runtimeType,email,password,displayName);

@override
String toString() {
  return 'AuthEvent.registered(email: $email, password: $password, displayName: $displayName)';
}


}

/// @nodoc
abstract mixin class _$RegisteredCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory _$RegisteredCopyWith(_Registered value, $Res Function(_Registered) _then) = __$RegisteredCopyWithImpl;
@useResult
$Res call({
 String email, String password, String displayName
});




}
/// @nodoc
class __$RegisteredCopyWithImpl<$Res>
    implements _$RegisteredCopyWith<$Res> {
  __$RegisteredCopyWithImpl(this._self, this._then);

  final _Registered _self;
  final $Res Function(_Registered) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? email = null,Object? password = null,Object? displayName = null,}) {
  return _then(_Registered(
email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
