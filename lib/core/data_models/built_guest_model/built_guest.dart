import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'built_guest.g.dart';


abstract class BuiltGuest implements Built<BuiltGuest, BuiltGuestBuilder> {

  String? get id;
  String get name;
  String get email;
  String get phone;
  DateTime? get created;

  BuiltGuest._();

  factory BuiltGuest([Function(BuiltGuestBuilder b) updates]) = _$BuiltGuest;

  static Serializer<BuiltGuest> get serializer => _$builtGuestSerializer;
}