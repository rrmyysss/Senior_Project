// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserPreferences {

 String get userId; List<String> get favoriteGenres; bool get notificationsEnabled; String? get dailyMoodReminderTime; bool get explicitContentAllowed;
/// Create a copy of UserPreferences
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserPreferencesCopyWith<UserPreferences> get copyWith => _$UserPreferencesCopyWithImpl<UserPreferences>(this as UserPreferences, _$identity);

  /// Serializes this UserPreferences to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserPreferences&&(identical(other.userId, userId) || other.userId == userId)&&const DeepCollectionEquality().equals(other.favoriteGenres, favoriteGenres)&&(identical(other.notificationsEnabled, notificationsEnabled) || other.notificationsEnabled == notificationsEnabled)&&(identical(other.dailyMoodReminderTime, dailyMoodReminderTime) || other.dailyMoodReminderTime == dailyMoodReminderTime)&&(identical(other.explicitContentAllowed, explicitContentAllowed) || other.explicitContentAllowed == explicitContentAllowed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,const DeepCollectionEquality().hash(favoriteGenres),notificationsEnabled,dailyMoodReminderTime,explicitContentAllowed);

@override
String toString() {
  return 'UserPreferences(userId: $userId, favoriteGenres: $favoriteGenres, notificationsEnabled: $notificationsEnabled, dailyMoodReminderTime: $dailyMoodReminderTime, explicitContentAllowed: $explicitContentAllowed)';
}


}

/// @nodoc
abstract mixin class $UserPreferencesCopyWith<$Res>  {
  factory $UserPreferencesCopyWith(UserPreferences value, $Res Function(UserPreferences) _then) = _$UserPreferencesCopyWithImpl;
@useResult
$Res call({
 String userId, List<String> favoriteGenres, bool notificationsEnabled, String? dailyMoodReminderTime, bool explicitContentAllowed
});




}
/// @nodoc
class _$UserPreferencesCopyWithImpl<$Res>
    implements $UserPreferencesCopyWith<$Res> {
  _$UserPreferencesCopyWithImpl(this._self, this._then);

  final UserPreferences _self;
  final $Res Function(UserPreferences) _then;

/// Create a copy of UserPreferences
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? favoriteGenres = null,Object? notificationsEnabled = null,Object? dailyMoodReminderTime = freezed,Object? explicitContentAllowed = null,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,favoriteGenres: null == favoriteGenres ? _self.favoriteGenres : favoriteGenres // ignore: cast_nullable_to_non_nullable
as List<String>,notificationsEnabled: null == notificationsEnabled ? _self.notificationsEnabled : notificationsEnabled // ignore: cast_nullable_to_non_nullable
as bool,dailyMoodReminderTime: freezed == dailyMoodReminderTime ? _self.dailyMoodReminderTime : dailyMoodReminderTime // ignore: cast_nullable_to_non_nullable
as String?,explicitContentAllowed: null == explicitContentAllowed ? _self.explicitContentAllowed : explicitContentAllowed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [UserPreferences].
extension UserPreferencesPatterns on UserPreferences {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserPreferences value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserPreferences() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserPreferences value)  $default,){
final _that = this;
switch (_that) {
case _UserPreferences():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserPreferences value)?  $default,){
final _that = this;
switch (_that) {
case _UserPreferences() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  List<String> favoriteGenres,  bool notificationsEnabled,  String? dailyMoodReminderTime,  bool explicitContentAllowed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserPreferences() when $default != null:
return $default(_that.userId,_that.favoriteGenres,_that.notificationsEnabled,_that.dailyMoodReminderTime,_that.explicitContentAllowed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  List<String> favoriteGenres,  bool notificationsEnabled,  String? dailyMoodReminderTime,  bool explicitContentAllowed)  $default,) {final _that = this;
switch (_that) {
case _UserPreferences():
return $default(_that.userId,_that.favoriteGenres,_that.notificationsEnabled,_that.dailyMoodReminderTime,_that.explicitContentAllowed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  List<String> favoriteGenres,  bool notificationsEnabled,  String? dailyMoodReminderTime,  bool explicitContentAllowed)?  $default,) {final _that = this;
switch (_that) {
case _UserPreferences() when $default != null:
return $default(_that.userId,_that.favoriteGenres,_that.notificationsEnabled,_that.dailyMoodReminderTime,_that.explicitContentAllowed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserPreferences implements UserPreferences {
  const _UserPreferences({required this.userId, final  List<String> favoriteGenres = const [], required this.notificationsEnabled, this.dailyMoodReminderTime, required this.explicitContentAllowed}): _favoriteGenres = favoriteGenres;
  factory _UserPreferences.fromJson(Map<String, dynamic> json) => _$UserPreferencesFromJson(json);

@override final  String userId;
 final  List<String> _favoriteGenres;
@override@JsonKey() List<String> get favoriteGenres {
  if (_favoriteGenres is EqualUnmodifiableListView) return _favoriteGenres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_favoriteGenres);
}

@override final  bool notificationsEnabled;
@override final  String? dailyMoodReminderTime;
@override final  bool explicitContentAllowed;

/// Create a copy of UserPreferences
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserPreferencesCopyWith<_UserPreferences> get copyWith => __$UserPreferencesCopyWithImpl<_UserPreferences>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserPreferencesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserPreferences&&(identical(other.userId, userId) || other.userId == userId)&&const DeepCollectionEquality().equals(other._favoriteGenres, _favoriteGenres)&&(identical(other.notificationsEnabled, notificationsEnabled) || other.notificationsEnabled == notificationsEnabled)&&(identical(other.dailyMoodReminderTime, dailyMoodReminderTime) || other.dailyMoodReminderTime == dailyMoodReminderTime)&&(identical(other.explicitContentAllowed, explicitContentAllowed) || other.explicitContentAllowed == explicitContentAllowed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,const DeepCollectionEquality().hash(_favoriteGenres),notificationsEnabled,dailyMoodReminderTime,explicitContentAllowed);

@override
String toString() {
  return 'UserPreferences(userId: $userId, favoriteGenres: $favoriteGenres, notificationsEnabled: $notificationsEnabled, dailyMoodReminderTime: $dailyMoodReminderTime, explicitContentAllowed: $explicitContentAllowed)';
}


}

/// @nodoc
abstract mixin class _$UserPreferencesCopyWith<$Res> implements $UserPreferencesCopyWith<$Res> {
  factory _$UserPreferencesCopyWith(_UserPreferences value, $Res Function(_UserPreferences) _then) = __$UserPreferencesCopyWithImpl;
@override @useResult
$Res call({
 String userId, List<String> favoriteGenres, bool notificationsEnabled, String? dailyMoodReminderTime, bool explicitContentAllowed
});




}
/// @nodoc
class __$UserPreferencesCopyWithImpl<$Res>
    implements _$UserPreferencesCopyWith<$Res> {
  __$UserPreferencesCopyWithImpl(this._self, this._then);

  final _UserPreferences _self;
  final $Res Function(_UserPreferences) _then;

/// Create a copy of UserPreferences
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? favoriteGenres = null,Object? notificationsEnabled = null,Object? dailyMoodReminderTime = freezed,Object? explicitContentAllowed = null,}) {
  return _then(_UserPreferences(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,favoriteGenres: null == favoriteGenres ? _self._favoriteGenres : favoriteGenres // ignore: cast_nullable_to_non_nullable
as List<String>,notificationsEnabled: null == notificationsEnabled ? _self.notificationsEnabled : notificationsEnabled // ignore: cast_nullable_to_non_nullable
as bool,dailyMoodReminderTime: freezed == dailyMoodReminderTime ? _self.dailyMoodReminderTime : dailyMoodReminderTime // ignore: cast_nullable_to_non_nullable
as String?,explicitContentAllowed: null == explicitContentAllowed ? _self.explicitContentAllowed : explicitContentAllowed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
