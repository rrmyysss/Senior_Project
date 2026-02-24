// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mood_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MoodEntry {

 String get id; String get userId; MoodTag get moodTag; MoodMethod get method; double? get confidence; String? get note; DateTime get timestamp; List<String> get tracksPlayed; int? get sessionDuration;
/// Create a copy of MoodEntry
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoodEntryCopyWith<MoodEntry> get copyWith => _$MoodEntryCopyWithImpl<MoodEntry>(this as MoodEntry, _$identity);

  /// Serializes this MoodEntry to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoodEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.moodTag, moodTag) || other.moodTag == moodTag)&&(identical(other.method, method) || other.method == method)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&(identical(other.note, note) || other.note == note)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&const DeepCollectionEquality().equals(other.tracksPlayed, tracksPlayed)&&(identical(other.sessionDuration, sessionDuration) || other.sessionDuration == sessionDuration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,moodTag,method,confidence,note,timestamp,const DeepCollectionEquality().hash(tracksPlayed),sessionDuration);

@override
String toString() {
  return 'MoodEntry(id: $id, userId: $userId, moodTag: $moodTag, method: $method, confidence: $confidence, note: $note, timestamp: $timestamp, tracksPlayed: $tracksPlayed, sessionDuration: $sessionDuration)';
}


}

/// @nodoc
abstract mixin class $MoodEntryCopyWith<$Res>  {
  factory $MoodEntryCopyWith(MoodEntry value, $Res Function(MoodEntry) _then) = _$MoodEntryCopyWithImpl;
@useResult
$Res call({
 String id, String userId, MoodTag moodTag, MoodMethod method, double? confidence, String? note, DateTime timestamp, List<String> tracksPlayed, int? sessionDuration
});




}
/// @nodoc
class _$MoodEntryCopyWithImpl<$Res>
    implements $MoodEntryCopyWith<$Res> {
  _$MoodEntryCopyWithImpl(this._self, this._then);

  final MoodEntry _self;
  final $Res Function(MoodEntry) _then;

/// Create a copy of MoodEntry
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? moodTag = null,Object? method = null,Object? confidence = freezed,Object? note = freezed,Object? timestamp = null,Object? tracksPlayed = null,Object? sessionDuration = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,moodTag: null == moodTag ? _self.moodTag : moodTag // ignore: cast_nullable_to_non_nullable
as MoodTag,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as MoodMethod,confidence: freezed == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tracksPlayed: null == tracksPlayed ? _self.tracksPlayed : tracksPlayed // ignore: cast_nullable_to_non_nullable
as List<String>,sessionDuration: freezed == sessionDuration ? _self.sessionDuration : sessionDuration // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [MoodEntry].
extension MoodEntryPatterns on MoodEntry {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MoodEntry value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MoodEntry() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MoodEntry value)  $default,){
final _that = this;
switch (_that) {
case _MoodEntry():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MoodEntry value)?  $default,){
final _that = this;
switch (_that) {
case _MoodEntry() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  MoodTag moodTag,  MoodMethod method,  double? confidence,  String? note,  DateTime timestamp,  List<String> tracksPlayed,  int? sessionDuration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MoodEntry() when $default != null:
return $default(_that.id,_that.userId,_that.moodTag,_that.method,_that.confidence,_that.note,_that.timestamp,_that.tracksPlayed,_that.sessionDuration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  MoodTag moodTag,  MoodMethod method,  double? confidence,  String? note,  DateTime timestamp,  List<String> tracksPlayed,  int? sessionDuration)  $default,) {final _that = this;
switch (_that) {
case _MoodEntry():
return $default(_that.id,_that.userId,_that.moodTag,_that.method,_that.confidence,_that.note,_that.timestamp,_that.tracksPlayed,_that.sessionDuration);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  MoodTag moodTag,  MoodMethod method,  double? confidence,  String? note,  DateTime timestamp,  List<String> tracksPlayed,  int? sessionDuration)?  $default,) {final _that = this;
switch (_that) {
case _MoodEntry() when $default != null:
return $default(_that.id,_that.userId,_that.moodTag,_that.method,_that.confidence,_that.note,_that.timestamp,_that.tracksPlayed,_that.sessionDuration);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MoodEntry implements MoodEntry {
  const _MoodEntry({required this.id, required this.userId, required this.moodTag, required this.method, this.confidence, this.note, required this.timestamp, final  List<String> tracksPlayed = const [], this.sessionDuration}): _tracksPlayed = tracksPlayed;
  factory _MoodEntry.fromJson(Map<String, dynamic> json) => _$MoodEntryFromJson(json);

@override final  String id;
@override final  String userId;
@override final  MoodTag moodTag;
@override final  MoodMethod method;
@override final  double? confidence;
@override final  String? note;
@override final  DateTime timestamp;
 final  List<String> _tracksPlayed;
@override@JsonKey() List<String> get tracksPlayed {
  if (_tracksPlayed is EqualUnmodifiableListView) return _tracksPlayed;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tracksPlayed);
}

@override final  int? sessionDuration;

/// Create a copy of MoodEntry
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MoodEntryCopyWith<_MoodEntry> get copyWith => __$MoodEntryCopyWithImpl<_MoodEntry>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MoodEntryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MoodEntry&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.moodTag, moodTag) || other.moodTag == moodTag)&&(identical(other.method, method) || other.method == method)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&(identical(other.note, note) || other.note == note)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&const DeepCollectionEquality().equals(other._tracksPlayed, _tracksPlayed)&&(identical(other.sessionDuration, sessionDuration) || other.sessionDuration == sessionDuration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,moodTag,method,confidence,note,timestamp,const DeepCollectionEquality().hash(_tracksPlayed),sessionDuration);

@override
String toString() {
  return 'MoodEntry(id: $id, userId: $userId, moodTag: $moodTag, method: $method, confidence: $confidence, note: $note, timestamp: $timestamp, tracksPlayed: $tracksPlayed, sessionDuration: $sessionDuration)';
}


}

/// @nodoc
abstract mixin class _$MoodEntryCopyWith<$Res> implements $MoodEntryCopyWith<$Res> {
  factory _$MoodEntryCopyWith(_MoodEntry value, $Res Function(_MoodEntry) _then) = __$MoodEntryCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, MoodTag moodTag, MoodMethod method, double? confidence, String? note, DateTime timestamp, List<String> tracksPlayed, int? sessionDuration
});




}
/// @nodoc
class __$MoodEntryCopyWithImpl<$Res>
    implements _$MoodEntryCopyWith<$Res> {
  __$MoodEntryCopyWithImpl(this._self, this._then);

  final _MoodEntry _self;
  final $Res Function(_MoodEntry) _then;

/// Create a copy of MoodEntry
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? moodTag = null,Object? method = null,Object? confidence = freezed,Object? note = freezed,Object? timestamp = null,Object? tracksPlayed = null,Object? sessionDuration = freezed,}) {
  return _then(_MoodEntry(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,moodTag: null == moodTag ? _self.moodTag : moodTag // ignore: cast_nullable_to_non_nullable
as MoodTag,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as MoodMethod,confidence: freezed == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,tracksPlayed: null == tracksPlayed ? _self._tracksPlayed : tracksPlayed // ignore: cast_nullable_to_non_nullable
as List<String>,sessionDuration: freezed == sessionDuration ? _self.sessionDuration : sessionDuration // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
