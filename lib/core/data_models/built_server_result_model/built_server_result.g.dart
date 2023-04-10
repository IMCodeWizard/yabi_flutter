// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'built_server_result.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BuiltServerResult> _$builtServerResultSerializer =
    new _$BuiltServerResultSerializer();

class _$BuiltServerResultSerializer
    implements StructuredSerializer<BuiltServerResult> {
  @override
  final Iterable<Type> types = const [BuiltServerResult, _$BuiltServerResult];
  @override
  final String wireName = 'BuiltServerResult';

  @override
  Iterable<Object?> serialize(Serializers serializers, BuiltServerResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  BuiltServerResult deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BuiltServerResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$BuiltServerResult extends BuiltServerResult {
  @override
  final String message;

  factory _$BuiltServerResult(
          [void Function(BuiltServerResultBuilder)? updates]) =>
      (new BuiltServerResultBuilder()..update(updates))._build();

  _$BuiltServerResult._({required this.message}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        message, r'BuiltServerResult', 'message');
  }

  @override
  BuiltServerResult rebuild(void Function(BuiltServerResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BuiltServerResultBuilder toBuilder() =>
      new BuiltServerResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuiltServerResult && message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BuiltServerResult')
          ..add('message', message))
        .toString();
  }
}

class BuiltServerResultBuilder
    implements Builder<BuiltServerResult, BuiltServerResultBuilder> {
  _$BuiltServerResult? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  BuiltServerResultBuilder();

  BuiltServerResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuiltServerResult other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BuiltServerResult;
  }

  @override
  void update(void Function(BuiltServerResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BuiltServerResult build() => _build();

  _$BuiltServerResult _build() {
    final _$result = _$v ??
        new _$BuiltServerResult._(
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'BuiltServerResult', 'message'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
