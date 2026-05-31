// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mood_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MoodState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoodState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MoodState()';
}


}

/// @nodoc
class $MoodStateCopyWith<$Res>  {
$MoodStateCopyWith(MoodState _, $Res Function(MoodState) __);
}


/// Adds pattern-matching-related methods to [MoodState].
extension MoodStatePatterns on MoodState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _HistoryLoaded value)?  historyLoaded,TResult Function( _OperationSuccess value)?  operationSuccess,TResult Function( _Failure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _HistoryLoaded() when historyLoaded != null:
return historyLoaded(_that);case _OperationSuccess() when operationSuccess != null:
return operationSuccess(_that);case _Failure() when failure != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _HistoryLoaded value)  historyLoaded,required TResult Function( _OperationSuccess value)  operationSuccess,required TResult Function( _Failure value)  failure,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _HistoryLoaded():
return historyLoaded(_that);case _OperationSuccess():
return operationSuccess(_that);case _Failure():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _HistoryLoaded value)?  historyLoaded,TResult? Function( _OperationSuccess value)?  operationSuccess,TResult? Function( _Failure value)?  failure,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _HistoryLoaded() when historyLoaded != null:
return historyLoaded(_that);case _OperationSuccess() when operationSuccess != null:
return operationSuccess(_that);case _Failure() when failure != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<MoodEntry> entries)?  historyLoaded,TResult Function( String message)?  operationSuccess,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _HistoryLoaded() when historyLoaded != null:
return historyLoaded(_that.entries);case _OperationSuccess() when operationSuccess != null:
return operationSuccess(_that.message);case _Failure() when failure != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<MoodEntry> entries)  historyLoaded,required TResult Function( String message)  operationSuccess,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _HistoryLoaded():
return historyLoaded(_that.entries);case _OperationSuccess():
return operationSuccess(_that.message);case _Failure():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<MoodEntry> entries)?  historyLoaded,TResult? Function( String message)?  operationSuccess,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _HistoryLoaded() when historyLoaded != null:
return historyLoaded(_that.entries);case _OperationSuccess() when operationSuccess != null:
return operationSuccess(_that.message);case _Failure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements MoodState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MoodState.initial()';
}


}




/// @nodoc


class _Loading implements MoodState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MoodState.loading()';
}


}




/// @nodoc


class _HistoryLoaded implements MoodState {
  const _HistoryLoaded(final  List<MoodEntry> entries): _entries = entries;
  

 final  List<MoodEntry> _entries;
 List<MoodEntry> get entries {
  if (_entries is EqualUnmodifiableListView) return _entries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entries);
}


/// Create a copy of MoodState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryLoadedCopyWith<_HistoryLoaded> get copyWith => __$HistoryLoadedCopyWithImpl<_HistoryLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryLoaded&&const DeepCollectionEquality().equals(other._entries, _entries));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_entries));

@override
String toString() {
  return 'MoodState.historyLoaded(entries: $entries)';
}


}

/// @nodoc
abstract mixin class _$HistoryLoadedCopyWith<$Res> implements $MoodStateCopyWith<$Res> {
  factory _$HistoryLoadedCopyWith(_HistoryLoaded value, $Res Function(_HistoryLoaded) _then) = __$HistoryLoadedCopyWithImpl;
@useResult
$Res call({
 List<MoodEntry> entries
});




}
/// @nodoc
class __$HistoryLoadedCopyWithImpl<$Res>
    implements _$HistoryLoadedCopyWith<$Res> {
  __$HistoryLoadedCopyWithImpl(this._self, this._then);

  final _HistoryLoaded _self;
  final $Res Function(_HistoryLoaded) _then;

/// Create a copy of MoodState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? entries = null,}) {
  return _then(_HistoryLoaded(
null == entries ? _self._entries : entries // ignore: cast_nullable_to_non_nullable
as List<MoodEntry>,
  ));
}


}

/// @nodoc


class _OperationSuccess implements MoodState {
  const _OperationSuccess(this.message);
  

 final  String message;

/// Create a copy of MoodState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OperationSuccessCopyWith<_OperationSuccess> get copyWith => __$OperationSuccessCopyWithImpl<_OperationSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OperationSuccess&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MoodState.operationSuccess(message: $message)';
}


}

/// @nodoc
abstract mixin class _$OperationSuccessCopyWith<$Res> implements $MoodStateCopyWith<$Res> {
  factory _$OperationSuccessCopyWith(_OperationSuccess value, $Res Function(_OperationSuccess) _then) = __$OperationSuccessCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$OperationSuccessCopyWithImpl<$Res>
    implements _$OperationSuccessCopyWith<$Res> {
  __$OperationSuccessCopyWithImpl(this._self, this._then);

  final _OperationSuccess _self;
  final $Res Function(_OperationSuccess) _then;

/// Create a copy of MoodState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_OperationSuccess(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Failure implements MoodState {
  const _Failure(this.failure);
  

 final  Failure failure;

/// Create a copy of MoodState
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
  return 'MoodState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$FailureCopyWith<$Res> implements $MoodStateCopyWith<$Res> {
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

/// Create a copy of MoodState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(_Failure(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}

/// Create a copy of MoodState
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
