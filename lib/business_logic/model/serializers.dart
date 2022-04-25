import 'package:doctor_management/business_logic/model/doctor_result.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/serializer.dart';

part 'serializers.g.dart';

@SerializersFor([
  DoctorResult
])

final Serializers serializers =
(_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();