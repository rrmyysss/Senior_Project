// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'music_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MusicState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MusicState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MusicState()';
}


}

/// @nodoc
class $MusicStateCopyWith<$Res>  {
$MusicStateCopyWith(MusicState _, $Res Function(MusicState) __);
}


/// Adds pattern-matching-related methods to [MusicState].
extension MusicStatePatterns on MusicState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _TracksLoaded value)?  tracksLoaded,TResult Function( _SearchResultsLoaded value)?  searchResultsLoaded,TResult Function( _Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _TracksLoaded() when tracksLoaded != null:
return tracksLoaded(_that);case _SearchResultsLoaded() when searchResultsLoaded != null:
return searchResultsLoaded(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _TracksLoaded value)  tracksLoaded,required TResult Function( _SearchResultsLoaded value)  searchResultsLoaded,required TResult Function( _Failure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _TracksLoaded():
return tracksLoaded(_that);case _SearchResultsLoaded():
return searchResultsLoaded(_that);case _Failure():
return failure(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _TracksLoaded value)?  tracksLoaded,TResult? Function( _SearchResultsLoaded value)?  searchResultsLoaded,TResult? Function( _Failure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _TracksLoaded() when tracksLoaded != null:
return tracksLoaded(_that);case _SearchResultsLoaded() when searchResultsLoaded != null:
return searchResultsLoaded(_that);case _Failure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<MusicTrack> tracks)?  tracksLoaded,TResult Function( List<YouTubeSearchResult> results)?  searchResultsLoaded,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _TracksLoaded() when tracksLoaded != null:
return tracksLoaded(_that.tracks);case _SearchResultsLoaded() when searchResultsLoaded != null:
return searchResultsLoaded(_that.results);case _Failure() when failure != null:
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<MusicTrack> tracks)  tracksLoaded,required TResult Function( List<YouTubeSearchResult> results)  searchResultsLoaded,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _TracksLoaded():
return tracksLoaded(_that.tracks);case _SearchResultsLoaded():
return searchResultsLoaded(_that.results);case _Failure():
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<MusicTrack> tracks)?  tracksLoaded,TResult? Function( List<YouTubeSearchResult> results)?  searchResultsLoaded,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _TracksLoaded() when tracksLoaded != null:
return tracksLoaded(_that.tracks);case _SearchResultsLoaded() when searchResultsLoaded != null:
return searchResultsLoaded(_that.results);case _Failure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements MusicState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MusicState.initial()';
}


}




/// @nodoc


class _Loading implements MusicState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MusicState.loading()';
}


}




/// @nodoc


class _TracksLoaded implements MusicState {
  const _TracksLoaded(final  List<MusicTrack> tracks): _tracks = tracks;
  

 final  List<MusicTrack> _tracks;
 List<MusicTrack> get tracks {
  if (_tracks is EqualUnmodifiableListView) return _tracks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tracks);
}


/// Create a copy of MusicState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TracksLoadedCopyWith<_TracksLoaded> get copyWith => __$TracksLoadedCopyWithImpl<_TracksLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TracksLoaded&&const DeepCollectionEquality().equals(other._tracks, _tracks));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tracks));

@override
String toString() {
  return 'MusicState.tracksLoaded(tracks: $tracks)';
}


}

/// @nodoc
abstract mixin class _$TracksLoadedCopyWith<$Res> implements $MusicStateCopyWith<$Res> {
  factory _$TracksLoadedCopyWith(_TracksLoaded value, $Res Function(_TracksLoaded) _then) = __$TracksLoadedCopyWithImpl;
@useResult
$Res call({
 List<MusicTrack> tracks
});




}
/// @nodoc
class __$TracksLoadedCopyWithImpl<$Res>
    implements _$TracksLoadedCopyWith<$Res> {
  __$TracksLoadedCopyWithImpl(this._self, this._then);

  final _TracksLoaded _self;
  final $Res Function(_TracksLoaded) _then;

/// Create a copy of MusicState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tracks = null,}) {
  return _then(_TracksLoaded(
null == tracks ? _self._tracks : tracks // ignore: cast_nullable_to_non_nullable
as List<MusicTrack>,
  ));
}


}

/// @nodoc


class _SearchResultsLoaded implements MusicState {
  const _SearchResultsLoaded(final  List<YouTubeSearchResult> results): _results = results;
  

 final  List<YouTubeSearchResult> _results;
 List<YouTubeSearchResult> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of MusicState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SearchResultsLoadedCopyWith<_SearchResultsLoaded> get copyWith => __$SearchResultsLoadedCopyWithImpl<_SearchResultsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SearchResultsLoaded&&const DeepCollectionEquality().equals(other._results, _results));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'MusicState.searchResultsLoaded(results: $results)';
}


}

/// @nodoc
abstract mixin class _$SearchResultsLoadedCopyWith<$Res> implements $MusicStateCopyWith<$Res> {
  factory _$SearchResultsLoadedCopyWith(_SearchResultsLoaded value, $Res Function(_SearchResultsLoaded) _then) = __$SearchResultsLoadedCopyWithImpl;
@useResult
$Res call({
 List<YouTubeSearchResult> results
});




}
/// @nodoc
class __$SearchResultsLoadedCopyWithImpl<$Res>
    implements _$SearchResultsLoadedCopyWith<$Res> {
  __$SearchResultsLoadedCopyWithImpl(this._self, this._then);

  final _SearchResultsLoaded _self;
  final $Res Function(_SearchResultsLoaded) _then;

/// Create a copy of MusicState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? results = null,}) {
  return _then(_SearchResultsLoaded(
null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<YouTubeSearchResult>,
  ));
}


}

/// @nodoc


class _Failure implements MusicState {
  const _Failure(this.failure);
  

 final  Failure failure;

/// Create a copy of MusicState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FailureCopyWith<_Failure> get copyWith => __$FailureCopyWithImpl<_Failure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Failure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'MusicState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $MusicStateCopyWith<$Res> {
  factory _$FailureCopyWith(_Failure value, $Res Function(_Failure) _then) = __$FailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});


$FailureCopyWith<$Res> get failure;

}
/// @nodoc
class __$FailureCopyWithImpl<$Res>
    implements _$FailureCopyWith<$Res> {
  __$FailureCopyWithImpl(this._self, this._then);

  final _Failure _self;
  final $Res Function(_Failure) _then;

/// Create a copy of MusicState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_Failure(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of MusicState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FailureCopyWith<$Res> get failure {
  
  return $FailureCopyWith<$Res>(_self.failure, (value) {
    return _then(_self.copyWith(failure: value));
  });
}
}

// dart format on
