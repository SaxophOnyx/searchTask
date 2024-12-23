// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_error_handler_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppErrorHandlerState {
  bool get hasConnection => throw _privateConstructorUsedError;

  /// Create a copy of AppErrorHandlerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppErrorHandlerStateCopyWith<AppErrorHandlerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppErrorHandlerStateCopyWith<$Res> {
  factory $AppErrorHandlerStateCopyWith(AppErrorHandlerState value,
          $Res Function(AppErrorHandlerState) then) =
      _$AppErrorHandlerStateCopyWithImpl<$Res, AppErrorHandlerState>;
  @useResult
  $Res call({bool hasConnection});
}

/// @nodoc
class _$AppErrorHandlerStateCopyWithImpl<$Res,
        $Val extends AppErrorHandlerState>
    implements $AppErrorHandlerStateCopyWith<$Res> {
  _$AppErrorHandlerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppErrorHandlerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasConnection = null,
  }) {
    return _then(_value.copyWith(
      hasConnection: null == hasConnection
          ? _value.hasConnection
          : hasConnection // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppErrorHandlerStateImplCopyWith<$Res>
    implements $AppErrorHandlerStateCopyWith<$Res> {
  factory _$$AppErrorHandlerStateImplCopyWith(_$AppErrorHandlerStateImpl value,
          $Res Function(_$AppErrorHandlerStateImpl) then) =
      __$$AppErrorHandlerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool hasConnection});
}

/// @nodoc
class __$$AppErrorHandlerStateImplCopyWithImpl<$Res>
    extends _$AppErrorHandlerStateCopyWithImpl<$Res, _$AppErrorHandlerStateImpl>
    implements _$$AppErrorHandlerStateImplCopyWith<$Res> {
  __$$AppErrorHandlerStateImplCopyWithImpl(_$AppErrorHandlerStateImpl _value,
      $Res Function(_$AppErrorHandlerStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppErrorHandlerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasConnection = null,
  }) {
    return _then(_$AppErrorHandlerStateImpl(
      hasConnection: null == hasConnection
          ? _value.hasConnection
          : hasConnection // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AppErrorHandlerStateImpl implements _AppErrorHandlerState {
  const _$AppErrorHandlerStateImpl({required this.hasConnection});

  @override
  final bool hasConnection;

  @override
  String toString() {
    return 'AppErrorHandlerState(hasConnection: $hasConnection)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppErrorHandlerStateImpl &&
            (identical(other.hasConnection, hasConnection) ||
                other.hasConnection == hasConnection));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hasConnection);

  /// Create a copy of AppErrorHandlerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppErrorHandlerStateImplCopyWith<_$AppErrorHandlerStateImpl>
      get copyWith =>
          __$$AppErrorHandlerStateImplCopyWithImpl<_$AppErrorHandlerStateImpl>(
              this, _$identity);
}

abstract class _AppErrorHandlerState implements AppErrorHandlerState {
  const factory _AppErrorHandlerState({required final bool hasConnection}) =
      _$AppErrorHandlerStateImpl;

  @override
  bool get hasConnection;

  /// Create a copy of AppErrorHandlerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppErrorHandlerStateImplCopyWith<_$AppErrorHandlerStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
