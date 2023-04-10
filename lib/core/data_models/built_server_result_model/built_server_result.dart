import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'built_server_result.g.dart';

abstract class BuiltServerResult implements Built<BuiltServerResult, BuiltServerResultBuilder> {

  String get message;

  BuiltServerResult._();
  factory BuiltServerResult([Function(BuiltServerResultBuilder b) updates]) = _$BuiltServerResult;

  static Serializer<BuiltServerResult> get serializer => _$builtServerResultSerializer;
}