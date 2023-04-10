import 'dart:async';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:chopper/chopper.dart';
import 'package:yabi_test/core/utils/serializers.dart';

class BuiltValueConverter extends JsonConverter {
  @override
  Request convertRequest(Request request) {
    return super.convertRequest(
      request.copyWith(
        body: serializers.serialize(request.body),
      ),
    );
  }

  @override
  FutureOr<Response<ResultType>> convertResponse<ResultType, Item>(Response response) async {
    final Response dynamicResponse = await super.convertResponse(response);
    final body = _convertToCustomObject<Item>(dynamicResponse.body['body'] ?? dynamicResponse.body);
    return dynamicResponse.copyWith<ResultType>(body: body);
  }

  dynamic _convertToCustomObject<SingleItemType>(dynamic element) {
    if (element is SingleItemType) return element;

    if (element is List) {
      return _deserializeListOf<SingleItemType>(element);
    } else {
      return _deserialize<SingleItemType>(element);
    }
  }

  T? _deserialize<T>(dynamic value) {
    final serializer = serializers.serializerForType(T) as Serializer<T>?;
    if (serializer == null) {
      throw Exception('No serializer for type $T');
    }

    return serializers.deserializeWith<T>(serializer, value);
  }

  BuiltList<T> _deserializeListOf<T>(Iterable value) => BuiltList(value.map((value) => _deserialize<T>(value)).toList(growable: false));
}
