import 'dart:io';

import 'package:built_collection/built_collection.dart';
import 'package:chopper/chopper.dart';
import 'package:doctor_management/business_logic/model/doctor_result.dart';
import 'package:doctor_management/utils/constants.dart';
import 'package:http/io_client.dart' as http;

import 'built_value_converter.dart';

part 'bima_service.chopper.dart';

@ChopperApi()
abstract class BimaService extends ChopperService {
  static BimaService create() {
    final client = ChopperClient(
        client: http.IOClient(
          HttpClient()..connectionTimeout = const Duration(seconds: 10),
        ),
        baseUrl: baseUrl,
        interceptors: [HttpLoggingInterceptor()],
        converter: BuiltValueConverter(),
        errorConverter: BuiltValueConverter(),
        services: [
          _$BimaService(),
        ]);
    return _$BimaService(client);
  }

  @Get(path: 'contacts')
  Future<Response<BuiltList<DoctorResult>>> getResult();
}
