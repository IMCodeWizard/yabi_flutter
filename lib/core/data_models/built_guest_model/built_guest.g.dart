// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'built_guest.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BuiltGuest> _$builtGuestSerializer = new _$BuiltGuestSerializer();

class _$BuiltGuestSerializer implements StructuredSerializer<BuiltGuest> {
  @override
  final Iterable<Type> types = const [BuiltGuest, _$BuiltGuest];
  @override
  final String wireName = 'BuiltGuest';

  @override
  Iterable<Object?> serialize(Serializers serializers, BuiltGuest object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'name',
      serializers.serialize(object.name, specifiedType: const FullType(String)),
      'email',
      serializers.serialize(object.email,
          specifiedType: const FullType(String)),
      'phone',
      serializers.serialize(object.phone,
          specifiedType: const FullType(String)),
    ];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.created;
    if (value != null) {
      result
        ..add('created')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    return result;
  }

  @override
  BuiltGuest deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BuiltGuestBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'phone':
          result.phone = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'created':
          result.created = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
      }
    }

    return result.build();
  }
}

class _$BuiltGuest extends BuiltGuest {
  @override
  final String? id;
  @override
  final String name;
  @override
  final String email;
  @override
  final String phone;
  @override
  final DateTime? created;

  factory _$BuiltGuest([void Function(BuiltGuestBuilder)? updates]) =>
      (new BuiltGuestBuilder()..update(updates))._build();

  _$BuiltGuest._(
      {this.id,
      required this.name,
      required this.email,
      required this.phone,
      this.created})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(name, r'BuiltGuest', 'name');
    BuiltValueNullFieldError.checkNotNull(email, r'BuiltGuest', 'email');
    BuiltValueNullFieldError.checkNotNull(phone, r'BuiltGuest', 'phone');
  }

  @override
  BuiltGuest rebuild(void Function(BuiltGuestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BuiltGuestBuilder toBuilder() => new BuiltGuestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BuiltGuest &&
        id == other.id &&
        name == other.name &&
        email == other.email &&
        phone == other.phone &&
        created == other.created;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, phone.hashCode);
    _$hash = $jc(_$hash, created.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BuiltGuest')
          ..add('id', id)
          ..add('name', name)
          ..add('email', email)
          ..add('phone', phone)
          ..add('created', created))
        .toString();
  }
}

class BuiltGuestBuilder implements Builder<BuiltGuest, BuiltGuestBuilder> {
  _$BuiltGuest? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _phone;
  String? get phone => _$this._phone;
  set phone(String? phone) => _$this._phone = phone;

  DateTime? _created;
  DateTime? get created => _$this._created;
  set created(DateTime? created) => _$this._created = created;

  BuiltGuestBuilder();

  BuiltGuestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _email = $v.email;
      _phone = $v.phone;
      _created = $v.created;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BuiltGuest other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BuiltGuest;
  }

  @override
  void update(void Function(BuiltGuestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BuiltGuest build() => _build();

  _$BuiltGuest _build() {
    final _$result = _$v ??
        new _$BuiltGuest._(
            id: id,
            name: BuiltValueNullFieldError.checkNotNull(
                name, r'BuiltGuest', 'name'),
            email: BuiltValueNullFieldError.checkNotNull(
                email, r'BuiltGuest', 'email'),
            phone: BuiltValueNullFieldError.checkNotNull(
                phone, r'BuiltGuest', 'phone'),
            created: created);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
