import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';

import '../../data_models/built_server_result_model/built_server_result.dart';
import '../../data_models/built_guest_model/built_guest.dart';
import '../../utils/built_value_converter.dart';
import '../../utils/constants.dart';

part 'guest_api_service.chopper.dart';


@ChopperApi()
abstract class GuestApiService extends ChopperService {

  @Get(path: 'read/')
  Future<Response<BuiltList<BuiltGuest>>> getGuests();

  @Post(path: 'single_read/')
  Future<Response<BuiltGuest>> getGuest(@Body() String data);

  @Post(path: 'create/')
  Future<Response<BuiltServerResult>> createGuest(@Body() BuiltGuest data);

  @Post(path: 'update/')
  Future<Response<BuiltServerResult>> updateGuest(@Body() BuiltGuest data);

  @Post(path: '/delete/')
  Future<Response<BuiltServerResult>> deleteGuest(@Body() BuiltGuest data);


  static GuestApiService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse(baseUrl),
      services: [
        _$GuestApiService(),
      ],
      interceptors: [
        HttpLoggingInterceptor(),
      ],
      converter: BuiltValueConverter(),
    );
    return _$GuestApiService(client);
  }

}