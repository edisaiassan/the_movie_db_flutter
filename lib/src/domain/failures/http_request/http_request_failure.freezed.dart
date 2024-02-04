// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'http_request_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$HttpRequestFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function() network,
    required TResult Function() unauthorized,
    required TResult Function() unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notFound,
    TResult? Function()? network,
    TResult? Function()? unauthorized,
    TResult? Function()? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function()? network,
    TResult Function()? unauthorized,
    TResult Function()? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HttpRequestFailureNotFound value) notFound,
    required TResult Function(HttpRequestFailureNetwork value) network,
    required TResult Function(HttpRequestUnauthorized value) unauthorized,
    required TResult Function(HttpRequestFailureUnknown value) unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HttpRequestFailureNotFound value)? notFound,
    TResult? Function(HttpRequestFailureNetwork value)? network,
    TResult? Function(HttpRequestUnauthorized value)? unauthorized,
    TResult? Function(HttpRequestFailureUnknown value)? unknown,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HttpRequestFailureNotFound value)? notFound,
    TResult Function(HttpRequestFailureNetwork value)? network,
    TResult Function(HttpRequestUnauthorized value)? unauthorized,
    TResult Function(HttpRequestFailureUnknown value)? unknown,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HttpRequestFailureCopyWith<$Res> {
  factory $HttpRequestFailureCopyWith(
          HttpRequestFailure value, $Res Function(HttpRequestFailure) then) =
      _$HttpRequestFailureCopyWithImpl<$Res, HttpRequestFailure>;
}

/// @nodoc
class _$HttpRequestFailureCopyWithImpl<$Res, $Val extends HttpRequestFailure>
    implements $HttpRequestFailureCopyWith<$Res> {
  _$HttpRequestFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$HttpRequestFailureNotFoundImplCopyWith<$Res> {
  factory _$$HttpRequestFailureNotFoundImplCopyWith(
          _$HttpRequestFailureNotFoundImpl value,
          $Res Function(_$HttpRequestFailureNotFoundImpl) then) =
      __$$HttpRequestFailureNotFoundImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HttpRequestFailureNotFoundImplCopyWithImpl<$Res>
    extends _$HttpRequestFailureCopyWithImpl<$Res,
        _$HttpRequestFailureNotFoundImpl>
    implements _$$HttpRequestFailureNotFoundImplCopyWith<$Res> {
  __$$HttpRequestFailureNotFoundImplCopyWithImpl(
      _$HttpRequestFailureNotFoundImpl _value,
      $Res Function(_$HttpRequestFailureNotFoundImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$HttpRequestFailureNotFoundImpl implements HttpRequestFailureNotFound {
  _$HttpRequestFailureNotFoundImpl();

  @override
  String toString() {
    return 'HttpRequestFailure.notFound()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HttpRequestFailureNotFoundImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function() network,
    required TResult Function() unauthorized,
    required TResult Function() unknown,
  }) {
    return notFound();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notFound,
    TResult? Function()? network,
    TResult? Function()? unauthorized,
    TResult? Function()? unknown,
  }) {
    return notFound?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function()? network,
    TResult Function()? unauthorized,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HttpRequestFailureNotFound value) notFound,
    required TResult Function(HttpRequestFailureNetwork value) network,
    required TResult Function(HttpRequestUnauthorized value) unauthorized,
    required TResult Function(HttpRequestFailureUnknown value) unknown,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HttpRequestFailureNotFound value)? notFound,
    TResult? Function(HttpRequestFailureNetwork value)? network,
    TResult? Function(HttpRequestUnauthorized value)? unauthorized,
    TResult? Function(HttpRequestFailureUnknown value)? unknown,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HttpRequestFailureNotFound value)? notFound,
    TResult Function(HttpRequestFailureNetwork value)? network,
    TResult Function(HttpRequestUnauthorized value)? unauthorized,
    TResult Function(HttpRequestFailureUnknown value)? unknown,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class HttpRequestFailureNotFound implements HttpRequestFailure {
  factory HttpRequestFailureNotFound() = _$HttpRequestFailureNotFoundImpl;
}

/// @nodoc
abstract class _$$HttpRequestFailureNetworkImplCopyWith<$Res> {
  factory _$$HttpRequestFailureNetworkImplCopyWith(
          _$HttpRequestFailureNetworkImpl value,
          $Res Function(_$HttpRequestFailureNetworkImpl) then) =
      __$$HttpRequestFailureNetworkImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HttpRequestFailureNetworkImplCopyWithImpl<$Res>
    extends _$HttpRequestFailureCopyWithImpl<$Res,
        _$HttpRequestFailureNetworkImpl>
    implements _$$HttpRequestFailureNetworkImplCopyWith<$Res> {
  __$$HttpRequestFailureNetworkImplCopyWithImpl(
      _$HttpRequestFailureNetworkImpl _value,
      $Res Function(_$HttpRequestFailureNetworkImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$HttpRequestFailureNetworkImpl implements HttpRequestFailureNetwork {
  _$HttpRequestFailureNetworkImpl();

  @override
  String toString() {
    return 'HttpRequestFailure.network()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HttpRequestFailureNetworkImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function() network,
    required TResult Function() unauthorized,
    required TResult Function() unknown,
  }) {
    return network();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notFound,
    TResult? Function()? network,
    TResult? Function()? unauthorized,
    TResult? Function()? unknown,
  }) {
    return network?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function()? network,
    TResult Function()? unauthorized,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HttpRequestFailureNotFound value) notFound,
    required TResult Function(HttpRequestFailureNetwork value) network,
    required TResult Function(HttpRequestUnauthorized value) unauthorized,
    required TResult Function(HttpRequestFailureUnknown value) unknown,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HttpRequestFailureNotFound value)? notFound,
    TResult? Function(HttpRequestFailureNetwork value)? network,
    TResult? Function(HttpRequestUnauthorized value)? unauthorized,
    TResult? Function(HttpRequestFailureUnknown value)? unknown,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HttpRequestFailureNotFound value)? notFound,
    TResult Function(HttpRequestFailureNetwork value)? network,
    TResult Function(HttpRequestUnauthorized value)? unauthorized,
    TResult Function(HttpRequestFailureUnknown value)? unknown,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class HttpRequestFailureNetwork implements HttpRequestFailure {
  factory HttpRequestFailureNetwork() = _$HttpRequestFailureNetworkImpl;
}

/// @nodoc
abstract class _$$HttpRequestUnauthorizedImplCopyWith<$Res> {
  factory _$$HttpRequestUnauthorizedImplCopyWith(
          _$HttpRequestUnauthorizedImpl value,
          $Res Function(_$HttpRequestUnauthorizedImpl) then) =
      __$$HttpRequestUnauthorizedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HttpRequestUnauthorizedImplCopyWithImpl<$Res>
    extends _$HttpRequestFailureCopyWithImpl<$Res,
        _$HttpRequestUnauthorizedImpl>
    implements _$$HttpRequestUnauthorizedImplCopyWith<$Res> {
  __$$HttpRequestUnauthorizedImplCopyWithImpl(
      _$HttpRequestUnauthorizedImpl _value,
      $Res Function(_$HttpRequestUnauthorizedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$HttpRequestUnauthorizedImpl implements HttpRequestUnauthorized {
  _$HttpRequestUnauthorizedImpl();

  @override
  String toString() {
    return 'HttpRequestFailure.unauthorized()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HttpRequestUnauthorizedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function() network,
    required TResult Function() unauthorized,
    required TResult Function() unknown,
  }) {
    return unauthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notFound,
    TResult? Function()? network,
    TResult? Function()? unauthorized,
    TResult? Function()? unknown,
  }) {
    return unauthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function()? network,
    TResult Function()? unauthorized,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HttpRequestFailureNotFound value) notFound,
    required TResult Function(HttpRequestFailureNetwork value) network,
    required TResult Function(HttpRequestUnauthorized value) unauthorized,
    required TResult Function(HttpRequestFailureUnknown value) unknown,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HttpRequestFailureNotFound value)? notFound,
    TResult? Function(HttpRequestFailureNetwork value)? network,
    TResult? Function(HttpRequestUnauthorized value)? unauthorized,
    TResult? Function(HttpRequestFailureUnknown value)? unknown,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HttpRequestFailureNotFound value)? notFound,
    TResult Function(HttpRequestFailureNetwork value)? network,
    TResult Function(HttpRequestUnauthorized value)? unauthorized,
    TResult Function(HttpRequestFailureUnknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class HttpRequestUnauthorized implements HttpRequestFailure {
  factory HttpRequestUnauthorized() = _$HttpRequestUnauthorizedImpl;
}

/// @nodoc
abstract class _$$HttpRequestFailureUnknownImplCopyWith<$Res> {
  factory _$$HttpRequestFailureUnknownImplCopyWith(
          _$HttpRequestFailureUnknownImpl value,
          $Res Function(_$HttpRequestFailureUnknownImpl) then) =
      __$$HttpRequestFailureUnknownImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$HttpRequestFailureUnknownImplCopyWithImpl<$Res>
    extends _$HttpRequestFailureCopyWithImpl<$Res,
        _$HttpRequestFailureUnknownImpl>
    implements _$$HttpRequestFailureUnknownImplCopyWith<$Res> {
  __$$HttpRequestFailureUnknownImplCopyWithImpl(
      _$HttpRequestFailureUnknownImpl _value,
      $Res Function(_$HttpRequestFailureUnknownImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$HttpRequestFailureUnknownImpl implements HttpRequestFailureUnknown {
  _$HttpRequestFailureUnknownImpl();

  @override
  String toString() {
    return 'HttpRequestFailure.unknown()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HttpRequestFailureUnknownImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() notFound,
    required TResult Function() network,
    required TResult Function() unauthorized,
    required TResult Function() unknown,
  }) {
    return unknown();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? notFound,
    TResult? Function()? network,
    TResult? Function()? unauthorized,
    TResult? Function()? unknown,
  }) {
    return unknown?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? notFound,
    TResult Function()? network,
    TResult Function()? unauthorized,
    TResult Function()? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(HttpRequestFailureNotFound value) notFound,
    required TResult Function(HttpRequestFailureNetwork value) network,
    required TResult Function(HttpRequestUnauthorized value) unauthorized,
    required TResult Function(HttpRequestFailureUnknown value) unknown,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(HttpRequestFailureNotFound value)? notFound,
    TResult? Function(HttpRequestFailureNetwork value)? network,
    TResult? Function(HttpRequestUnauthorized value)? unauthorized,
    TResult? Function(HttpRequestFailureUnknown value)? unknown,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(HttpRequestFailureNotFound value)? notFound,
    TResult Function(HttpRequestFailureNetwork value)? network,
    TResult Function(HttpRequestUnauthorized value)? unauthorized,
    TResult Function(HttpRequestFailureUnknown value)? unknown,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class HttpRequestFailureUnknown implements HttpRequestFailure {
  factory HttpRequestFailureUnknown() = _$HttpRequestFailureUnknownImpl;
}
