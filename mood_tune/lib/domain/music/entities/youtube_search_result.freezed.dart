// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'youtube_search_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$YouTubeSearchResult {

 String get videoId; String get title; String get channelName; String get thumbnailUrl; String get duration; int? get viewCount;
/// Create a copy of YouTubeSearchResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$YouTubeSearchResultCopyWith<YouTubeSearchResult> get copyWith => _$YouTubeSearchResultCopyWithImpl<YouTubeSearchResult>(this as YouTubeSearchResult, _$identity);

  /// Serializes this YouTubeSearchResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is YouTubeSearchResult&&(identical(other.videoId, videoId) || other.videoId == videoId)&&(identical(other.title, title) || other.title == title)&&(identical(other.channelName, channelName) || other.channelName == channelName)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,videoId,title,channelName,thumbnailUrl,duration,viewCount);

@override
String toString() {
  return 'YouTubeSearchResult(videoId: $videoId, title: $title, channelName: $channelName, thumbnailUrl: $thumbnailUrl, duration: $duration, viewCount: $viewCount)';
}


}

/// @nodoc
abstract mixin class $YouTubeSearchResultCopyWith<$Res>  {
  factory $YouTubeSearchResultCopyWith(YouTubeSearchResult value, $Res Function(YouTubeSearchResult) _then) = _$YouTubeSearchResultCopyWithImpl;
@useResult
$Res call({
 String videoId, String title, String channelName, String thumbnailUrl, String duration, int? viewCount
});




}
/// @nodoc
class _$YouTubeSearchResultCopyWithImpl<$Res>
    implements $YouTubeSearchResultCopyWith<$Res> {
  _$YouTubeSearchResultCopyWithImpl(this._self, this._then);

  final YouTubeSearchResult _self;
  final $Res Function(YouTubeSearchResult) _then;

/// Create a copy of YouTubeSearchResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? videoId = null,Object? title = null,Object? channelName = null,Object? thumbnailUrl = null,Object? duration = null,Object? viewCount = freezed,}) {
  return _then(_self.copyWith(
videoId: null == videoId ? _self.videoId : videoId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,channelName: null == channelName ? _self.channelName : channelName // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,viewCount: freezed == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [YouTubeSearchResult].
extension YouTubeSearchResultPatterns on YouTubeSearchResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _YouTubeSearchResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _YouTubeSearchResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _YouTubeSearchResult value)  $default,){
final _that = this;
switch (_that) {
case _YouTubeSearchResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _YouTubeSearchResult value)?  $default,){
final _that = this;
switch (_that) {
case _YouTubeSearchResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String videoId,  String title,  String channelName,  String thumbnailUrl,  String duration,  int? viewCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _YouTubeSearchResult() when $default != null:
return $default(_that.videoId,_that.title,_that.channelName,_that.thumbnailUrl,_that.duration,_that.viewCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String videoId,  String title,  String channelName,  String thumbnailUrl,  String duration,  int? viewCount)  $default,) {final _that = this;
switch (_that) {
case _YouTubeSearchResult():
return $default(_that.videoId,_that.title,_that.channelName,_that.thumbnailUrl,_that.duration,_that.viewCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String videoId,  String title,  String channelName,  String thumbnailUrl,  String duration,  int? viewCount)?  $default,) {final _that = this;
switch (_that) {
case _YouTubeSearchResult() when $default != null:
return $default(_that.videoId,_that.title,_that.channelName,_that.thumbnailUrl,_that.duration,_that.viewCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _YouTubeSearchResult implements YouTubeSearchResult {
  const _YouTubeSearchResult({required this.videoId, required this.title, required this.channelName, required this.thumbnailUrl, required this.duration, this.viewCount});
  factory _YouTubeSearchResult.fromJson(Map<String, dynamic> json) => _$YouTubeSearchResultFromJson(json);

@override final  String videoId;
@override final  String title;
@override final  String channelName;
@override final  String thumbnailUrl;
@override final  String duration;
@override final  int? viewCount;

/// Create a copy of YouTubeSearchResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$YouTubeSearchResultCopyWith<_YouTubeSearchResult> get copyWith => __$YouTubeSearchResultCopyWithImpl<_YouTubeSearchResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$YouTubeSearchResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _YouTubeSearchResult&&(identical(other.videoId, videoId) || other.videoId == videoId)&&(identical(other.title, title) || other.title == title)&&(identical(other.channelName, channelName) || other.channelName == channelName)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.viewCount, viewCount) || other.viewCount == viewCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,videoId,title,channelName,thumbnailUrl,duration,viewCount);

@override
String toString() {
  return 'YouTubeSearchResult(videoId: $videoId, title: $title, channelName: $channelName, thumbnailUrl: $thumbnailUrl, duration: $duration, viewCount: $viewCount)';
}


}

/// @nodoc
abstract mixin class _$YouTubeSearchResultCopyWith<$Res> implements $YouTubeSearchResultCopyWith<$Res> {
  factory _$YouTubeSearchResultCopyWith(_YouTubeSearchResult value, $Res Function(_YouTubeSearchResult) _then) = __$YouTubeSearchResultCopyWithImpl;
@override @useResult
$Res call({
 String videoId, String title, String channelName, String thumbnailUrl, String duration, int? viewCount
});




}
/// @nodoc
class __$YouTubeSearchResultCopyWithImpl<$Res>
    implements _$YouTubeSearchResultCopyWith<$Res> {
  __$YouTubeSearchResultCopyWithImpl(this._self, this._then);

  final _YouTubeSearchResult _self;
  final $Res Function(_YouTubeSearchResult) _then;

/// Create a copy of YouTubeSearchResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? videoId = null,Object? title = null,Object? channelName = null,Object? thumbnailUrl = null,Object? duration = null,Object? viewCount = freezed,}) {
  return _then(_YouTubeSearchResult(
videoId: null == videoId ? _self.videoId : videoId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,channelName: null == channelName ? _self.channelName : channelName // ignore: cast_nullable_to_non_nullable
as String,thumbnailUrl: null == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as String,viewCount: freezed == viewCount ? _self.viewCount : viewCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
