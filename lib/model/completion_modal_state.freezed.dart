// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'completion_modal_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CompletionModalState {
  int get option => throw _privateConstructorUsedError;
  dynamic get isCompletionRequesting => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CompletionModalStateCopyWith<CompletionModalState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompletionModalStateCopyWith<$Res> {
  factory $CompletionModalStateCopyWith(CompletionModalState value,
          $Res Function(CompletionModalState) then) =
      _$CompletionModalStateCopyWithImpl<$Res, CompletionModalState>;
  @useResult
  $Res call({int option, dynamic isCompletionRequesting});
}

/// @nodoc
class _$CompletionModalStateCopyWithImpl<$Res,
        $Val extends CompletionModalState>
    implements $CompletionModalStateCopyWith<$Res> {
  _$CompletionModalStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? option = null,
    Object? isCompletionRequesting = null,
  }) {
    return _then(_value.copyWith(
      option: null == option
          ? _value.option
          : option // ignore: cast_nullable_to_non_nullable
              as int,
      isCompletionRequesting: null == isCompletionRequesting
          ? _value.isCompletionRequesting
          : isCompletionRequesting // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CompletionModalStateCopyWith<$Res>
    implements $CompletionModalStateCopyWith<$Res> {
  factory _$$_CompletionModalStateCopyWith(_$_CompletionModalState value,
          $Res Function(_$_CompletionModalState) then) =
      __$$_CompletionModalStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int option, dynamic isCompletionRequesting});
}

/// @nodoc
class __$$_CompletionModalStateCopyWithImpl<$Res>
    extends _$CompletionModalStateCopyWithImpl<$Res, _$_CompletionModalState>
    implements _$$_CompletionModalStateCopyWith<$Res> {
  __$$_CompletionModalStateCopyWithImpl(_$_CompletionModalState _value,
      $Res Function(_$_CompletionModalState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? option = null,
    Object? isCompletionRequesting = null,
  }) {
    return _then(_$_CompletionModalState(
      option: null == option
          ? _value.option
          : option // ignore: cast_nullable_to_non_nullable
              as int,
      isCompletionRequesting: null == isCompletionRequesting
          ? _value.isCompletionRequesting
          : isCompletionRequesting,
    ));
  }
}

/// @nodoc

class _$_CompletionModalState implements _CompletionModalState {
  const _$_CompletionModalState(
      {this.option = -1, this.isCompletionRequesting = false});

  @override
  @JsonKey()
  final int option;
  @override
  @JsonKey()
  final dynamic isCompletionRequesting;

  @override
  String toString() {
    return 'CompletionModalState(option: $option, isCompletionRequesting: $isCompletionRequesting)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CompletionModalState &&
            (identical(other.option, option) || other.option == option) &&
            const DeepCollectionEquality()
                .equals(other.isCompletionRequesting, isCompletionRequesting));
  }

  @override
  int get hashCode => Object.hash(runtimeType, option,
      const DeepCollectionEquality().hash(isCompletionRequesting));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CompletionModalStateCopyWith<_$_CompletionModalState> get copyWith =>
      __$$_CompletionModalStateCopyWithImpl<_$_CompletionModalState>(
          this, _$identity);
}

abstract class _CompletionModalState implements CompletionModalState {
  const factory _CompletionModalState(
      {final int option,
      final dynamic isCompletionRequesting}) = _$_CompletionModalState;

  @override
  int get option;
  @override
  dynamic get isCompletionRequesting;
  @override
  @JsonKey(ignore: true)
  _$$_CompletionModalStateCopyWith<_$_CompletionModalState> get copyWith =>
      throw _privateConstructorUsedError;
}
