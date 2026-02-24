// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_track.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MusicTrack {

 String get id; String get title; String get artist; String get youtubeVideoId; String get youtubeUrl; String get thumbnailUrl; String get channelName; MoodTag get moodTag; TrackSource get source; String? get genre; int? get durationMs; String? get previewUrl; int? get popularity;
/// Create a copy of MusicTrack
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MusicTrackCopyWith<MusicTrack> get copyWith => _$MusicTrackCopyWithImpl<MusicTrack>(this as MusicTrack, _$identity);

  /// Serializes this MusicTrack to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicTrack&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.youtubeVideoId, youtubeVideoId) || other.youtubeVideoId == youtubeVideoId)&&(identical(other.youtubeUrl, youtubeUrl) || other.youtubeUrl == youtubeUrl)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.channelName, channelName) || other.channelName == channelName)&&(identical(other.moodTag, moodTag) || other.moodTag == moodTag)&&(identical(other.source, source) || other.source == source)&&(identical(other.genre, genre) || other.genre == genre)&&(identical(other.durationMs, durationMs) || other.durationMs == durationMs)&&(identical(other.previewUrl, previewUrl) || other.previewUrl == previewUrl)&&(identical(other.popularity, popularity) || other.popularity == popularity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,artist,youtubeVideoId,youtubeUrl,thumbnailUrl,channelName,moodTag,source,genre,durationMs,previewUrl,popularity);

@override
String toString() {
  return 'MusicTrack(id: $id, title: $title, artist: $artist, youtubeVideoId: $youtubeVideoId, youtubeUrl: $youtubeUrl, thumbnailUrl: $thumbnailUrl, channelName: $channelName, moodTag: $moodTag, source: $source, genre: $genre, durationMs: $durationMs, previewUrl: $previewUrl, popularity: $popularity)';
}


}

/// @nodoc
abstract mixin class $MusicTrackCopyWith<$Res>  {
  factory $MusicTrackCopyWith(MusicTrack value, $Res Function(MusicTrack) _then) = _$MusicTrackCopyWithImpl;
@useResult
$Res call({
 String id, String title, String artist, String youtubeVideoId, String youtubeUrl, String thumbnailUrl, String channelName, MoodTag moodTag, TrackSource source, String? genre, int? durationMs, String? previewUrl, int? popularity
});




}
/// @nodoc
class _$MusicTrackCopyWithImpl<$Res>
    implements $MusicTrackCopyWith<$Res> {
  _$MusicTrackCopyWithImpl(this._self, this._then);

  final MusicTrack _self;
  final $Res Function(MusicTrack) _then;

/// Create a copy of MusicTrack
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? artist = null,Object? youtubeVideoId = null,Object? youtubeUrl = null,Object? thumbnailUrl = null,Object? channelName = null,Object? moodTag = null,Object? source = null,Object? genre = freezed,Object? durationMs = freezed,Object? previewUrl = freezed,Object? popularity = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,artist: null == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String,youtubeVideoId: null == youtubeVideoId ? _self.youtubeVideoId : youtubeVideoId // ignore: cast_nullable_to_non_nullable
as String,youtubeUrl: null == youtubeUrl ? _self.youtubeUrl : youtubeUrl // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,channelName: null == channelName ? _self.channelName : channelName // ignore: cast_nullable_to_non_nullable
as String,moodTag: null == moodTag ? _self.moodTag : moodTag // ignore: cast_nullable_to_non_nullable
as MoodTag,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as TrackSource,genre: freezed == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as String?,durationMs: freezed == durationMs ? _self.durationMs : durationMs // ignore: cast_nullable_to_non_nullable
as int?,previewUrl: freezed == previewUrl ? _self.previewUrl : previewUrl // ignore: cast_nullable_to_non_nullable
as String?,popularity: freezed == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [MusicTrack].
extension MusicTrackPatterns on MusicTrack {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MusicTrack value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MusicTrack() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MusicTrack value)  $default,){
final _that = this;
switch (_that) {
case _MusicTrack():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MusicTrack value)?  $default,){
final _that = this;
switch (_that) {
case _MusicTrack() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String artist,  String youtubeVideoId,  String youtubeUrl,  String thumbnailUrl,  String channelName,  MoodTag moodTag,  TrackSource source,  String? genre,  int? durationMs,  String? previewUrl,  int? popularity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MusicTrack() when $default != null:
return $default(_that.id,_that.title,_that.artist,_that.youtubeVideoId,_that.youtubeUrl,_that.thumbnailUrl,_that.channelName,_that.moodTag,_that.source,_that.genre,_that.durationMs,_that.previewUrl,_that.popularity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String artist,  String youtubeVideoId,  String youtubeUrl,  String thumbnailUrl,  String channelName,  MoodTag moodTag,  TrackSource source,  String? genre,  int? durationMs,  String? previewUrl,  int? popularity)  $default,) {final _that = this;
switch (_that) {
case _MusicTrack():
return $default(_that.id,_that.title,_that.artist,_that.youtubeVideoId,_that.youtubeUrl,_that.thumbnailUrl,_that.channelName,_that.moodTag,_that.source,_that.genre,_that.durationMs,_that.previewUrl,_that.popularity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String artist,  String youtubeVideoId,  String youtubeUrl,  String thumbnailUrl,  String channelName,  MoodTag moodTag,  TrackSource source,  String? genre,  int? durationMs,  String? previewUrl,  int? popularity)?  $default,) {final _that = this;
switch (_that) {
case _MusicTrack() when $default != null:
return $default(_that.id,_that.title,_that.artist,_that.youtubeVideoId,_that.youtubeUrl,_that.thumbnailUrl,_that.channelName,_that.moodTag,_that.source,_that.genre,_that.durationMs,_that.previewUrl,_that.popularity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MusicTrack implements MusicTrack {
  const _MusicTrack({required this.id, required this.title, required this.artist, required this.youtubeVideoId, required this.youtubeUrl, required this.thumbnailUrl, required this.channelName, required this.moodTag, required this.source, this.genre, this.durationMs, this.previewUrl, this.popularity});
  factory _MusicTrack.fromJson(Map<String, dynamic> json) => _$MusicTrackFromJson(json);

@override final  String id;
@override final  String title;
@override final  String artist;
@override final  String youtubeVideoId;
@override final  String youtubeUrl;
@override final  String thumbnailUrl;
@override final  String channelName;
@override final  MoodTag moodTag;
@override final  TrackSource source;
@override final  String? genre;
@override final  int? durationMs;
@override final  String? previewUrl;
@override final  int? popularity;

/// Create a copy of MusicTrack
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MusicTrackCopyWith<_MusicTrack> get copyWith => __$MusicTrackCopyWithImpl<_MusicTrack>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MusicTrackToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MusicTrack&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.artist, artist) || other.artist == artist)&&(identical(other.youtubeVideoId, youtubeVideoId) || other.youtubeVideoId == youtubeVideoId)&&(identical(other.youtubeUrl, youtubeUrl) || other.youtubeUrl == youtubeUrl)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.channelName, channelName) || other.channelName == channelName)&&(identical(other.moodTag, moodTag) || other.moodTag == moodTag)&&(identical(other.source, source) || other.source == source)&&(identical(other.genre, genre) || other.genre == genre)&&(identical(other.durationMs, durationMs) || other.durationMs == durationMs)&&(identical(other.previewUrl, previewUrl) || other.previewUrl == previewUrl)&&(identical(other.popularity, popularity) || other.popularity == popularity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,artist,youtubeVideoId,youtubeUrl,thumbnailUrl,channelName,moodTag,source,genre,durationMs,previewUrl,popularity);

@override
String toString() {
  return 'MusicTrack(id: $id, title: $title, artist: $artist, youtubeVideoId: $youtubeVideoId, youtubeUrl: $youtubeUrl, thumbnailUrl: $thumbnailUrl, channelName: $channelName, moodTag: $moodTag, source: $source, genre: $genre, durationMs: $durationMs, previewUrl: $previewUrl, popularity: $popularity)';
}


}

/// @nodoc
abstract mixin class _$MusicTrackCopyWith<$Res> implements $MusicTrackCopyWith<$Res> {
  factory _$MusicTrackCopyWith(_MusicTrack value, $Res Function(_MusicTrack) _then) = __$MusicTrackCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String artist, String youtubeVideoId, String youtubeUrl, String thumbnailUrl, String channelName, MoodTag moodTag, TrackSource source, String? genre, int? durationMs, String? previewUrl, int? popularity
});




}
/// @nodoc
class __$MusicTrackCopyWithImpl<$Res>
    implements _$MusicTrackCopyWith<$Res> {
  __$MusicTrackCopyWithImpl(this._self, this._then);

  final _MusicTrack _self;
  final $Res Function(_MusicTrack) _then;

/// Create a copy of MusicTrack
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? artist = null,Object? youtubeVideoId = null,Object? youtubeUrl = null,Object? thumbnailUrl = null,Object? channelName = null,Object? moodTag = null,Object? source = null,Object? genre = freezed,Object? durationMs = freezed,Object? previewUrl = freezed,Object? popularity = freezed,}) {
  return _then(_MusicTrack(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,artist: null == artist ? _self.artist : artist // ignore: cast_nullable_to_non_nullable
as String,youtubeVideoId: null == youtubeVideoId ? _self.youtubeVideoId : youtubeVideoId // ignore: cast_nullable_to_non_nullable
as String,youtubeUrl: null == youtubeUrl ? _self.youtubeUrl : youtubeUrl // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,channelName: null == channelName ? _self.channelName : channelName // ignore: cast_nullable_to_non_nullable
as String,moodTag: null == moodTag ? _self.moodTag : moodTag // ignore: cast_nullable_to_non_nullable
as MoodTag,source: null == source ? _self.source : source // ignore: cast_nullable_to_non_nullable
as TrackSource,genre: freezed == genre ? _self.genre : genre // ignore: cast_nullable_to_non_nullable
as String?,durationMs: freezed == durationMs ? _self.durationMs : durationMs // ignore: cast_nullable_to_non_nullable
as int?,previewUrl: freezed == previewUrl ? _self.previewUrl : previewUrl // ignore: cast_nullable_to_non_nullable
as String?,popularity: freezed == popularity ? _self.popularity : popularity // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
