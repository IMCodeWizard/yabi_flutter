// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$GuestApiService extends GuestApiService {
  _$GuestApiService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = GuestApiService;

  @override
  Future<Response<BuiltList<BuiltGuest>>> getGuests() {
    final Uri $url = Uri.parse('read/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<BuiltList<BuiltGuest>, BuiltGuest>($request);
  }

  @override
  Future<Response<BuiltGuest>> getGuest(String data) {
    final Uri $url = Uri.parse('single_read/');
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<BuiltGuest, BuiltGuest>($request);
  }

  @override
  Future<Response<BuiltServerResult>> createGuest(BuiltGuest data) {
    final Uri $url = Uri.parse('create/');
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<BuiltServerResult, BuiltServerResult>($request);
  }

  @override
  Future<Response<BuiltServerResult>> updateGuest(BuiltGuest data) {
    final Uri $url = Uri.parse('update/');
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<BuiltServerResult, BuiltServerResult>($request);
  }

  @override
  Future<Response<BuiltServerResult>> deleteGuest(BuiltGuest data) {
    final Uri $url = Uri.parse('/delete/');
    final $body = data;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<BuiltServerResult, BuiltServerResult>($request);
  }
}
