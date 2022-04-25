// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bima_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$BimaService extends BimaService {
  _$BimaService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = BimaService;

  @override
  Future<Response<BuiltList<DoctorResult>>> getResult() {
    final $url = 'contacts';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<BuiltList<DoctorResult>, DoctorResult>($request);
  }
}
