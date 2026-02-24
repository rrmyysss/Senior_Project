// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MusicEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MusicEvent()';
}


}

/// @nodoc
class $MusicEventCopyWith<$Res>  {
$MusicEventCopyWith(MusicEvent _, $Res Function(MusicEvent) __);
}


/// Adds pattern-matching-related methods to [MusicEvent].
extension MusicEventPatterns on MusicEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _TracksRequestedByMood value)?  tracksRequestedByMood,TResult Function( _YoutubeSearchRequested value)?  youtubeSearchRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TracksRequestedByMood() when tracksRequestedByMood != null:
return tracksRequestedByMood(_that);case _YoutubeSearchRequested() when youtubeSearchRequested != null:
return youtubeSearchRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _TracksRequestedByMood value)  tracksRequestedByMood,required TResult Function( _YoutubeSearchRequested value)  youtubeSearchRequested,}){
final _that = this;
switch (_that) {
case _TracksRequestedByMood():
return tracksRequestedByMood(_that);case _YoutubeSearchRequested():
return youtubeSearchRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _TracksRequestedByMood value)?  tracksRequestedByMood,TResult? Function( _YoutubeSearchRequested value)?  youtubeSearchRequested,}){
final _that = this;
switch (_that) {
case _TracksRequestedByMood() when tracksRequestedByMood != null:
return tracksRequestedByMood(_that);case _YoutubeSearchRequested() when youtubeSearchRequested != null:
return youtubeSearchRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( MoodTag mood)?  tracksRequestedByMood,TResult Function( String query)?  youtubeSearchRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TracksRequestedByMood() when tracksRequestedByMood != null:
return tracksRequestedByMood(_that.mood);case _YoutubeSearchRequested() when youtubeSearchRequested != null:
return youtubeSearchRequested(_that.query);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( MoodTag mood)  tracksRequestedByMood,required TResult Function( String query)  youtubeSearchRequested,}) {final _that = this;
switch (_that) {
case _TracksRequestedByMood():
return tracksRequestedByMood(_that.mood);case _YoutubeSearchRequested():
return youtubeSearchRequested(_that.query);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( MoodTag mood)?  tracksRequestedByMood,TResult? Function( String query)?  youtubeSearchRequested,}) {final _that = this;
switch (_that) {
case _TracksRequestedByMood() when tracksRequestedByMood != null:
return tracksRequestedByMood(_that.mood);case _YoutubeSearchRequested() when youtubeSearchRequested != null:
return youtubeSearchRequested(_that.query);case _:
  return null;

}
}

}

/// @nodoc


class _TracksRequestedByMood implements MusicEvent {
  const _TracksRequestedByMood(this.mood);
  

 final  MoodTag mood;

/// Create a copy of MusicEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TracksRequestedByMoodCopyWith<_TracksRequestedByMood> get copyWith => __$TracksRequestedByMoodCopyWithImpl<_TracksRequestedByMood>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TracksRequestedByMood&&(identical(other.mood, mood) || other.mood == mood));
}


@override
int get hashCode => Object.hash(runtimeType,mood);

@override
String toString() {
  return 'MusicEvent.tracksRequestedByMood(mood: $mood)';
}


}

/// @nodoc
abstract mixin class _$TracksRequestedByMoodCopyWith<$Res> implements $MusicEventCopyWith<$Res> {
  factory _$TracksRequestedByMoodCopyWith(_TracksRequestedByMood value, $Res Function(_TracksRequestedByMood) _then) = __$TracksRequestedByMoodCopyWithImpl;
@useResult
$Res call({
 MoodTag mood
});




}
/// @nodoc
class __$TracksRequestedByMoodCopyWithImpl<$Res>
    implements _$TracksRequestedByMoodCopyWith<$Res> {
  __$TracksRequestedByMoodCopyWithImpl(this._self, this._then);

  final _TracksRequestedByMood _self;
  final $Res Function(_TracksRequestedByMood) _then;

/// Create a copy of MusicEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? mood = null,}) {
  return _then(_TracksRequestedByMood(
null == mood ? _self.mood : mood // ignore: cast_nullable_to_non_nullable
as MoodTag,
  ));
}


}

/// @nodoc


class _YoutubeSearchRequested implements MusicEvent {
  const _YoutubeSearchRequested(this.query);
  

 final  String query;

/// Create a copy of MusicEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$YoutubeSearchRequestedCopyWith<_YoutubeSearchRequested> get copyWith => __$YoutubeSearchRequestedCopyWithImpl<_YoutubeSearchRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _YoutubeSearchRequested&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'MusicEvent.youtubeSearchRequested(query: $query)';
}


}

/// @nodoc
abstract mixin class _$YoutubeSearchRequestedCopyWith<$Res> implements $MusicEventCopyWith<$Res> {
  factory _$YoutubeSearchRequestedCopyWith(_YoutubeSearchRequested value, $Res Function(_YoutubeSearchRequested) _then) = __$YoutubeSearchRequestedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class __$YoutubeSearchRequestedCopyWithImpl<$Res>
    implements _$YoutubeSearchRequestedCopyWith<$Res> {
  __$YoutubeSearchRequestedCopyWithImpl(this._self, this._then);

  final _YoutubeSearchRequested _self;
  final $Res Function(_YoutubeSearchRequested) _then;

/// Create a copy of MusicEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(_YoutubeSearchRequested(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
