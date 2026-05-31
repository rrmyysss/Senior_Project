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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _TracksRequestedByMood value)?  tracksRequestedByMood,TResult Function( _TracksRequestedByMoodName value)?  tracksRequestedByMoodName,TResult Function( _YoutubeSearchRequested value)?  youtubeSearchRequested,TResult Function( _RecentlyPlayedRequested value)?  recentlyPlayedRequested,TResult Function( _RecentlyPlayedCleared value)?  recentlyPlayedCleared,TResult Function( _PlaylistRequested value)?  playlistRequested,TResult Function( _TrackPlayed value)?  trackPlayed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TracksRequestedByMood() when tracksRequestedByMood != null:
return tracksRequestedByMood(_that);case _TracksRequestedByMoodName() when tracksRequestedByMoodName != null:
return tracksRequestedByMoodName(_that);case _YoutubeSearchRequested() when youtubeSearchRequested != null:
return youtubeSearchRequested(_that);case _RecentlyPlayedRequested() when recentlyPlayedRequested != null:
return recentlyPlayedRequested(_that);case _RecentlyPlayedCleared() when recentlyPlayedCleared != null:
return recentlyPlayedCleared(_that);case _PlaylistRequested() when playlistRequested != null:
return playlistRequested(_that);case _TrackPlayed() when trackPlayed != null:
return trackPlayed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _TracksRequestedByMood value)  tracksRequestedByMood,required TResult Function( _TracksRequestedByMoodName value)  tracksRequestedByMoodName,required TResult Function( _YoutubeSearchRequested value)  youtubeSearchRequested,required TResult Function( _RecentlyPlayedRequested value)  recentlyPlayedRequested,required TResult Function( _RecentlyPlayedCleared value)  recentlyPlayedCleared,required TResult Function( _PlaylistRequested value)  playlistRequested,required TResult Function( _TrackPlayed value)  trackPlayed,}){
final _that = this;
switch (_that) {
case _TracksRequestedByMood():
return tracksRequestedByMood(_that);case _TracksRequestedByMoodName():
return tracksRequestedByMoodName(_that);case _YoutubeSearchRequested():
return youtubeSearchRequested(_that);case _RecentlyPlayedRequested():
return recentlyPlayedRequested(_that);case _RecentlyPlayedCleared():
return recentlyPlayedCleared(_that);case _PlaylistRequested():
return playlistRequested(_that);case _TrackPlayed():
return trackPlayed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _TracksRequestedByMood value)?  tracksRequestedByMood,TResult? Function( _TracksRequestedByMoodName value)?  tracksRequestedByMoodName,TResult? Function( _YoutubeSearchRequested value)?  youtubeSearchRequested,TResult? Function( _RecentlyPlayedRequested value)?  recentlyPlayedRequested,TResult? Function( _RecentlyPlayedCleared value)?  recentlyPlayedCleared,TResult? Function( _PlaylistRequested value)?  playlistRequested,TResult? Function( _TrackPlayed value)?  trackPlayed,}){
final _that = this;
switch (_that) {
case _TracksRequestedByMood() when tracksRequestedByMood != null:
return tracksRequestedByMood(_that);case _TracksRequestedByMoodName() when tracksRequestedByMoodName != null:
return tracksRequestedByMoodName(_that);case _YoutubeSearchRequested() when youtubeSearchRequested != null:
return youtubeSearchRequested(_that);case _RecentlyPlayedRequested() when recentlyPlayedRequested != null:
return recentlyPlayedRequested(_that);case _RecentlyPlayedCleared() when recentlyPlayedCleared != null:
return recentlyPlayedCleared(_that);case _PlaylistRequested() when playlistRequested != null:
return playlistRequested(_that);case _TrackPlayed() when trackPlayed != null:
return trackPlayed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( MoodTag mood)?  tracksRequestedByMood,TResult Function( String moodName)?  tracksRequestedByMoodName,TResult Function( String query)?  youtubeSearchRequested,TResult Function()?  recentlyPlayedRequested,TResult Function()?  recentlyPlayedCleared,TResult Function( String playlistId)?  playlistRequested,TResult Function( MusicTrack track)?  trackPlayed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TracksRequestedByMood() when tracksRequestedByMood != null:
return tracksRequestedByMood(_that.mood);case _TracksRequestedByMoodName() when tracksRequestedByMoodName != null:
return tracksRequestedByMoodName(_that.moodName);case _YoutubeSearchRequested() when youtubeSearchRequested != null:
return youtubeSearchRequested(_that.query);case _RecentlyPlayedRequested() when recentlyPlayedRequested != null:
return recentlyPlayedRequested();case _RecentlyPlayedCleared() when recentlyPlayedCleared != null:
return recentlyPlayedCleared();case _PlaylistRequested() when playlistRequested != null:
return playlistRequested(_that.playlistId);case _TrackPlayed() when trackPlayed != null:
return trackPlayed(_that.track);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( MoodTag mood)  tracksRequestedByMood,required TResult Function( String moodName)  tracksRequestedByMoodName,required TResult Function( String query)  youtubeSearchRequested,required TResult Function()  recentlyPlayedRequested,required TResult Function()  recentlyPlayedCleared,required TResult Function( String playlistId)  playlistRequested,required TResult Function( MusicTrack track)  trackPlayed,}) {final _that = this;
switch (_that) {
case _TracksRequestedByMood():
return tracksRequestedByMood(_that.mood);case _TracksRequestedByMoodName():
return tracksRequestedByMoodName(_that.moodName);case _YoutubeSearchRequested():
return youtubeSearchRequested(_that.query);case _RecentlyPlayedRequested():
return recentlyPlayedRequested();case _RecentlyPlayedCleared():
return recentlyPlayedCleared();case _PlaylistRequested():
return playlistRequested(_that.playlistId);case _TrackPlayed():
return trackPlayed(_that.track);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( MoodTag mood)?  tracksRequestedByMood,TResult? Function( String moodName)?  tracksRequestedByMoodName,TResult? Function( String query)?  youtubeSearchRequested,TResult? Function()?  recentlyPlayedRequested,TResult? Function()?  recentlyPlayedCleared,TResult? Function( String playlistId)?  playlistRequested,TResult? Function( MusicTrack track)?  trackPlayed,}) {final _that = this;
switch (_that) {
case _TracksRequestedByMood() when tracksRequestedByMood != null:
return tracksRequestedByMood(_that.mood);case _TracksRequestedByMoodName() when tracksRequestedByMoodName != null:
return tracksRequestedByMoodName(_that.moodName);case _YoutubeSearchRequested() when youtubeSearchRequested != null:
return youtubeSearchRequested(_that.query);case _RecentlyPlayedRequested() when recentlyPlayedRequested != null:
return recentlyPlayedRequested();case _RecentlyPlayedCleared() when recentlyPlayedCleared != null:
return recentlyPlayedCleared();case _PlaylistRequested() when playlistRequested != null:
return playlistRequested(_that.playlistId);case _TrackPlayed() when trackPlayed != null:
return trackPlayed(_that.track);case _:
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


class _TracksRequestedByMoodName implements MusicEvent {
  const _TracksRequestedByMoodName(this.moodName);
  

 final  String moodName;

/// Create a copy of MusicEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TracksRequestedByMoodNameCopyWith<_TracksRequestedByMoodName> get copyWith => __$TracksRequestedByMoodNameCopyWithImpl<_TracksRequestedByMoodName>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TracksRequestedByMoodName&&(identical(other.moodName, moodName) || other.moodName == moodName));
}


@override
int get hashCode => Object.hash(runtimeType,moodName);

@override
String toString() {
  return 'MusicEvent.tracksRequestedByMoodName(moodName: $moodName)';
}


}

/// @nodoc
abstract mixin class _$TracksRequestedByMoodNameCopyWith<$Res> implements $MusicEventCopyWith<$Res> {
  factory _$TracksRequestedByMoodNameCopyWith(_TracksRequestedByMoodName value, $Res Function(_TracksRequestedByMoodName) _then) = __$TracksRequestedByMoodNameCopyWithImpl;
@useResult
$Res call({
 String moodName
});




}
/// @nodoc
class __$TracksRequestedByMoodNameCopyWithImpl<$Res>
    implements _$TracksRequestedByMoodNameCopyWith<$Res> {
  __$TracksRequestedByMoodNameCopyWithImpl(this._self, this._then);

  final _TracksRequestedByMoodName _self;
  final $Res Function(_TracksRequestedByMoodName) _then;

/// Create a copy of MusicEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? moodName = null,}) {
  return _then(_TracksRequestedByMoodName(
null == moodName ? _self.moodName : moodName // ignore: cast_nullable_to_non_nullable
as String,
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

/// @nodoc


class _RecentlyPlayedRequested implements MusicEvent {
  const _RecentlyPlayedRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecentlyPlayedRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MusicEvent.recentlyPlayedRequested()';
}


}




/// @nodoc


class _RecentlyPlayedCleared implements MusicEvent {
  const _RecentlyPlayedCleared();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecentlyPlayedCleared);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MusicEvent.recentlyPlayedCleared()';
}


}




/// @nodoc


class _PlaylistRequested implements MusicEvent {
  const _PlaylistRequested(this.playlistId);
  

 final  String playlistId;

/// Create a copy of MusicEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaylistRequestedCopyWith<_PlaylistRequested> get copyWith => __$PlaylistRequestedCopyWithImpl<_PlaylistRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaylistRequested&&(identical(other.playlistId, playlistId) || other.playlistId == playlistId));
}


@override
int get hashCode => Object.hash(runtimeType,playlistId);

@override
String toString() {
  return 'MusicEvent.playlistRequested(playlistId: $playlistId)';
}


}

/// @nodoc
abstract mixin class _$PlaylistRequestedCopyWith<$Res> implements $MusicEventCopyWith<$Res> {
  factory _$PlaylistRequestedCopyWith(_PlaylistRequested value, $Res Function(_PlaylistRequested) _then) = __$PlaylistRequestedCopyWithImpl;
@useResult
$Res call({
 String playlistId
});




}
/// @nodoc
class __$PlaylistRequestedCopyWithImpl<$Res>
    implements _$PlaylistRequestedCopyWith<$Res> {
  __$PlaylistRequestedCopyWithImpl(this._self, this._then);

  final _PlaylistRequested _self;
  final $Res Function(_PlaylistRequested) _then;

/// Create a copy of MusicEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? playlistId = null,}) {
  return _then(_PlaylistRequested(
null == playlistId ? _self.playlistId : playlistId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _TrackPlayed implements MusicEvent {
  const _TrackPlayed(this.track);
  

 final  MusicTrack track;

/// Create a copy of MusicEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrackPlayedCopyWith<_TrackPlayed> get copyWith => __$TrackPlayedCopyWithImpl<_TrackPlayed>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrackPlayed&&(identical(other.track, track) || other.track == track));
}


@override
int get hashCode => Object.hash(runtimeType,track);

@override
String toString() {
  return 'MusicEvent.trackPlayed(track: $track)';
}


}

/// @nodoc
abstract mixin class _$TrackPlayedCopyWith<$Res> implements $MusicEventCopyWith<$Res> {
  factory _$TrackPlayedCopyWith(_TrackPlayed value, $Res Function(_TrackPlayed) _then) = __$TrackPlayedCopyWithImpl;
@useResult
$Res call({
 MusicTrack track
});


$MusicTrackCopyWith<$Res> get track;

}
/// @nodoc
class __$TrackPlayedCopyWithImpl<$Res>
    implements _$TrackPlayedCopyWith<$Res> {
  __$TrackPlayedCopyWithImpl(this._self, this._then);

  final _TrackPlayed _self;
  final $Res Function(_TrackPlayed) _then;

/// Create a copy of MusicEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? track = null,}) {
  return _then(_TrackPlayed(
null == track ? _self.track : track // ignore: cast_nullable_to_non_nullable
as MusicTrack,
  ));
}

/// Create a copy of MusicEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MusicTrackCopyWith<$Res> get track {
  
  return $MusicTrackCopyWith<$Res>(_self.track, (value) {
    return _then(_self.copyWith(track: value));
  });
}
}

// dart format on
