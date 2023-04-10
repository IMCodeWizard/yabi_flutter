



import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';

import '../data_models/built_guest_model/built_guest.dart';
import '../data_models/built_server_result_model/built_server_result.dart';

part 'serializers.g.dart';

@SerializersFor([BuiltGuest, BuiltServerResult])
final Serializers serializers = (_$serializers.toBuilder()
  ..add(Iso8601DateTimeSerializer())
  ..addPlugin(StandardJsonPlugin())
).build();