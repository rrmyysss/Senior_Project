// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mood_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MoodEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoodEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MoodEvent()';
}


}

/// @nodoc
class $MoodEventCopyWith<$Res>  {
$MoodEventCopyWith(MoodEvent _, $Res Function(MoodEvent) __);
}


/// Adds pattern-matching-related methods to [MoodEvent].
extension MoodEventPatterns on MoodEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _HistoryRequested value)?  historyRequested,TResult Function( _EntryAdded value)?  entryAdded,TResult Function( _EntryDeleted value)?  entryDeleted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryRequested() when historyRequested != null:
return historyRequested(_that);case _EntryAdded() when entryAdded != null:
return entryAdded(_that);case _EntryDeleted() when entryDeleted != null:
return entryDeleted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _HistoryRequested value)  historyRequested,required TResult Function( _EntryAdded value)  entryAdded,required TResult Function( _EntryDeleted value)  entryDeleted,}){
final _that = this;
switch (_that) {
case _HistoryRequested():
return historyRequested(_that);case _EntryAdded():
return entryAdded(_that);case _EntryDeleted():
return entryDeleted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _HistoryRequested value)?  historyRequested,TResult? Function( _EntryAdded value)?  entryAdded,TResult? Function( _EntryDeleted value)?  entryDeleted,}){
final _that = this;
switch (_that) {
case _HistoryRequested() when historyRequested != null:
return historyRequested(_that);case _EntryAdded() when entryAdded != null:
return entryAdded(_that);case _EntryDeleted() when entryDeleted != null:
return entryDeleted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String userId)?  historyRequested,TResult Function( MoodEntry entry)?  entryAdded,TResult Function( String entryId,  String userId)?  entryDeleted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryRequested() when historyRequested != null:
return historyRequested(_that.userId);case _EntryAdded() when entryAdded != null:
return entryAdded(_that.entry);case _EntryDeleted() when entryDeleted != null:
return entryDeleted(_that.entryId,_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String userId)  historyRequested,required TResult Function( MoodEntry entry)  entryAdded,required TResult Function( String entryId,  String userId)  entryDeleted,}) {final _that = this;
switch (_that) {
case _HistoryRequested():
return historyRequested(_that.userId);case _EntryAdded():
return entryAdded(_that.entry);case _EntryDeleted():
return entryDeleted(_that.entryId,_that.userId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String userId)?  historyRequested,TResult? Function( MoodEntry entry)?  entryAdded,TResult? Function( String entryId,  String userId)?  entryDeleted,}) {final _that = this;
switch (_that) {
case _HistoryRequested() when historyRequested != null:
return historyRequested(_that.userId);case _EntryAdded() when entryAdded != null:
return entryAdded(_that.entry);case _EntryDeleted() when entryDeleted != null:
return entryDeleted(_that.entryId,_that.userId);case _:
  return null;

}
}

}

/// @nodoc


class _HistoryRequested implements MoodEvent {
  const _HistoryRequested(this.userId);
  

 final  String userId;

/// Create a copy of MoodEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryRequestedCopyWith<_HistoryRequested> get copyWith => __$HistoryRequestedCopyWithImpl<_HistoryRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryRequested&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,userId);

@override
String toString() {
  return 'MoodEvent.historyRequested(userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$HistoryRequestedCopyWith<$Res> implements $MoodEventCopyWith<$Res> {
  factory _$HistoryRequestedCopyWith(_HistoryRequested value, $Res Function(_HistoryRequested) _then) = __$HistoryRequestedCopyWithImpl;
@useResult
$Res call({
 String userId
});




}
/// @nodoc
class __$HistoryRequestedCopyWithImpl<$Res>
    implements _$HistoryRequestedCopyWith<$Res> {
  __$HistoryRequestedCopyWithImpl(this._self, this._then);

  final _HistoryRequested _self;
  final $Res Function(_HistoryRequested) _then;

/// Create a copy of MoodEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,}) {
  return _then(_HistoryRequested(
null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _EntryAdded implements MoodEvent {
  const _EntryAdded(this.entry);
  

 final  MoodEntry entry;

/// Create a copy of MoodEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EntryAddedCopyWith<_EntryAdded> get copyWith => __$EntryAddedCopyWithImpl<_EntryAdded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EntryAdded&&(identical(other.entry, entry) || other.entry == entry));
}


@override
int get hashCode => Object.hash(runtimeType,entry);

@override
String toString() {
  return 'MoodEvent.entryAdded(entry: $entry)';
}


}

/// @nodoc
abstract mixin class _$EntryAddedCopyWith<$Res> implements $MoodEventCopyWith<$Res> {
  factory _$EntryAddedCopyWith(_EntryAdded value, $Res Function(_EntryAdded) _then) = __$EntryAddedCopyWithImpl;
@useResult
$Res call({
 MoodEntry entry
});


$MoodEntryCopyWith<$Res> get entry;

}
/// @nodoc
class __$EntryAddedCopyWithImpl<$Res>
    implements _$EntryAddedCopyWith<$Res> {
  __$EntryAddedCopyWithImpl(this._self, this._then);

  final _EntryAdded _self;
  final $Res Function(_EntryAdded) _then;

/// Create a copy of MoodEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? entry = null,}) {
  return _then(_EntryAdded(
null == entry ? _self.entry : entry // ignore: cast_nullable_to_non_nullable
as MoodEntry,
  ));
}

/// Create a copy of MoodEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoodEntryCopyWith<$Res> get entry {
  
  return $MoodEntryCopyWith<$Res>(_self.entry, (value) {
    return _then(_self.copyWith(entry: value));
  });
}
}

/// @nodoc


class _EntryDeleted implements MoodEvent {
  const _EntryDeleted(this.entryId, this.userId);
  

 final  String entryId;
 final  String userId;

/// Create a copy of MoodEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EntryDeletedCopyWith<_EntryDeleted> get copyWith => __$EntryDeletedCopyWithImpl<_EntryDeleted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EntryDeleted&&(identical(other.entryId, entryId) || other.entryId == entryId)&&(identical(other.userId, userId) || other.userId == userId));
}


@override
int get hashCode => Object.hash(runtimeType,entryId,userId);

@override
String toString() {
  return 'MoodEvent.entryDeleted(entryId: $entryId, userId: $userId)';
}


}

/// @nodoc
abstract mixin class _$EntryDeletedCopyWith<$Res> implements $MoodEventCopyWith<$Res> {
  factory _$EntryDeletedCopyWith(_EntryDeleted value, $Res Function(_EntryDeleted) _then) = __$EntryDeletedCopyWithImpl;
@useResult
$Res call({
 String entryId, String userId
});




}
/// @nodoc
class __$EntryDeletedCopyWithImpl<$Res>
    implements _$EntryDeletedCopyWith<$Res> {
  __$EntryDeletedCopyWithImpl(this._self, this._then);

  final _EntryDeleted _self;
  final $Res Function(_EntryDeleted) _then;

/// Create a copy of MoodEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? entryId = null,Object? userId = null,}) {
  return _then(_EntryDeleted(
null == entryId ? _self.entryId : entryId // ignore: cast_nullable_to_non_nullable
as String,null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
