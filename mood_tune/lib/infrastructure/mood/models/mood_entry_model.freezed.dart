// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mood_entry_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MoodEntryModel {

 String get id; String get userId; String get moodTag; String get method; double? get confidence; String? get note; String get timestamp; List<String> get tracksPlayed; int? get sessionDuration;
/// Create a copy of MoodEntryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MoodEntryModelCopyWith<MoodEntryModel> get copyWith => _$MoodEntryModelCopyWithImpl<MoodEntryModel>(this as MoodEntryModel, _$identity);

  /// Serializes this MoodEntryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoodEntryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.moodTag, moodTag) || other.moodTag == moodTag)&&(identical(other.method, method) || other.method == method)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&(identical(other.note, note) || other.note == note)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&const DeepCollectionEquality().equals(other.tracksPlayed, tracksPlayed)&&(identical(other.sessionDuration, sessionDuration) || other.sessionDuration == sessionDuration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,moodTag,method,confidence,note,timestamp,const DeepCollectionEquality().hash(tracksPlayed),sessionDuration);

@override
String toString() {
  return 'MoodEntryModel(id: $id, userId: $userId, moodTag: $moodTag, method: $method, confidence: $confidence, note: $note, timestamp: $timestamp, tracksPlayed: $tracksPlayed, sessionDuration: $sessionDuration)';
}


}

/// @nodoc
abstract mixin class $MoodEntryModelCopyWith<$Res>  {
  factory $MoodEntryModelCopyWith(MoodEntryModel value, $Res Function(MoodEntryModel) _then) = _$MoodEntryModelCopyWithImpl;
@useResult
$Res call({
 String id, String userId, String moodTag, String method, double? confidence, String? note, String timestamp, List<String> tracksPlayed, int? sessionDuration
});




}
/// @nodoc
class _$MoodEntryModelCopyWithImpl<$Res>
    implements $MoodEntryModelCopyWith<$Res> {
  _$MoodEntryModelCopyWithImpl(this._self, this._then);

  final MoodEntryModel _self;
  final $Res Function(MoodEntryModel) _then;

/// Create a copy of MoodEntryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = null,Object? moodTag = null,Object? method = null,Object? confidence = freezed,Object? note = freezed,Object? timestamp = null,Object? tracksPlayed = null,Object? sessionDuration = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,moodTag: null == moodTag ? _self.moodTag : moodTag // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,confidence: freezed == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,tracksPlayed: null == tracksPlayed ? _self.tracksPlayed : tracksPlayed // ignore: cast_nullable_to_non_nullable
as List<String>,sessionDuration: freezed == sessionDuration ? _self.sessionDuration : sessionDuration // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [MoodEntryModel].
extension MoodEntryModelPatterns on MoodEntryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MoodEntryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MoodEntryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MoodEntryModel value)  $default,){
final _that = this;
switch (_that) {
case _MoodEntryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MoodEntryModel value)?  $default,){
final _that = this;
switch (_that) {
case _MoodEntryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String userId,  String moodTag,  String method,  double? confidence,  String? note,  String timestamp,  List<String> tracksPlayed,  int? sessionDuration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MoodEntryModel() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String userId,  String moodTag,  String method,  double? confidence,  String? note,  String timestamp,  List<String> tracksPlayed,  int? sessionDuration)  $default,) {final _that = this;
switch (_that) {
case _MoodEntryModel():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String userId,  String moodTag,  String method,  double? confidence,  String? note,  String timestamp,  List<String> tracksPlayed,  int? sessionDuration)?  $default,) {final _that = this;
switch (_that) {
case _MoodEntryModel() when $default != null:
return $default(_that.id,_that.userId,_that.moodTag,_that.method,_that.confidence,_that.note,_that.timestamp,_that.tracksPlayed,_that.sessionDuration);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MoodEntryModel extends MoodEntryModel {
  const _MoodEntryModel({required this.id, required this.userId, required this.moodTag, required this.method, this.confidence, this.note, required this.timestamp, final  List<String> tracksPlayed = const [], this.sessionDuration}): _tracksPlayed = tracksPlayed,super._();
  factory _MoodEntryModel.fromJson(Map<String, dynamic> json) => _$MoodEntryModelFromJson(json);

@override final  String id;
@override final  String userId;
@override final  String moodTag;
@override final  String method;
@override final  double? confidence;
@override final  String? note;
@override final  String timestamp;
 final  List<String> _tracksPlayed;
@override@JsonKey() List<String> get tracksPlayed {
  if (_tracksPlayed is EqualUnmodifiableListView) return _tracksPlayed;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tracksPlayed);
}

@override final  int? sessionDuration;

/// Create a copy of MoodEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MoodEntryModelCopyWith<_MoodEntryModel> get copyWith => __$MoodEntryModelCopyWithImpl<_MoodEntryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MoodEntryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MoodEntryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.moodTag, moodTag) || other.moodTag == moodTag)&&(identical(other.method, method) || other.method == method)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&(identical(other.note, note) || other.note == note)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&const DeepCollectionEquality().equals(other._tracksPlayed, _tracksPlayed)&&(identical(other.sessionDuration, sessionDuration) || other.sessionDuration == sessionDuration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,moodTag,method,confidence,note,timestamp,const DeepCollectionEquality().hash(_tracksPlayed),sessionDuration);

@override
String toString() {
  return 'MoodEntryModel(id: $id, userId: $userId, moodTag: $moodTag, method: $method, confidence: $confidence, note: $note, timestamp: $timestamp, tracksPlayed: $tracksPlayed, sessionDuration: $sessionDuration)';
}


}

/// @nodoc
abstract mixin class _$MoodEntryModelCopyWith<$Res> implements $MoodEntryModelCopyWith<$Res> {
  factory _$MoodEntryModelCopyWith(_MoodEntryModel value, $Res Function(_MoodEntryModel) _then) = __$MoodEntryModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String userId, String moodTag, String method, double? confidence, String? note, String timestamp, List<String> tracksPlayed, int? sessionDuration
});




}
/// @nodoc
class __$MoodEntryModelCopyWithImpl<$Res>
    implements _$MoodEntryModelCopyWith<$Res> {
  __$MoodEntryModelCopyWithImpl(this._self, this._then);

  final _MoodEntryModel _self;
  final $Res Function(_MoodEntryModel) _then;

/// Create a copy of MoodEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = null,Object? moodTag = null,Object? method = null,Object? confidence = freezed,Object? note = freezed,Object? timestamp = null,Object? tracksPlayed = null,Object? sessionDuration = freezed,}) {
  return _then(_MoodEntryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,moodTag: null == moodTag ? _self.moodTag : moodTag // ignore: cast_nullable_to_non_nullable
as String,method: null == method ? _self.method : method // ignore: cast_nullable_to_non_nullable
as String,confidence: freezed == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,tracksPlayed: null == tracksPlayed ? _self._tracksPlayed : tracksPlayed // ignore: cast_nullable_to_non_nullable
as List<String>,sessionDuration: freezed == sessionDuration ? _self.sessionDuration : sessionDuration // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
