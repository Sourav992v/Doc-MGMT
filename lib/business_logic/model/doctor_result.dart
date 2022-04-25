import 'dart:convert';

import 'package:built_value/built_value.dart';

import 'serializers.dart';
import 'package:built_value/serializer.dart';

part 'doctor_result.g.dart';

abstract class DoctorResult
    implements Built<DoctorResult, DoctorResultBuilder> {
  @BuiltValueField(wireName: 'id')
  num? get id;

  @BuiltValueField(wireName: 'first_name')
  String? get firstName;

  @BuiltValueField(wireName: 'last_name')
  String? get lastName;

  @BuiltValueField(wireName: 'profile_pic')
  String? get profilePic;

  @BuiltValueField(wireName: 'favorite')
  bool? get favorite;

  @BuiltValueField(wireName: 'primary_contact_no')
  String? get primaryContactNo;

  @BuiltValueField(wireName: 'rating')
  String? get rating;

  @BuiltValueField(wireName: 'email_address')
  String? get emailAddress;

  @BuiltValueField(wireName: 'qualification')
  String? get qualification;

  @BuiltValueField(wireName: 'description')
  String? get description;

  @BuiltValueField(wireName: 'specialization')
  String? get specialization;

  @BuiltValueField(wireName: 'languagesKnown')
  String? get languagesKnown;

  DoctorResult._();


  static DoctorResult? fromJson(String jsonString) {
    return serializers
        .deserializeWith(DoctorResult.serializer, jsonDecode(jsonString))
        ?.rebuild((b) => b
          ..id ??= 0
          ..firstName ??= ''
          ..lastName ??= ''
          ..profilePic ??= ''
          ..favorite ??= false
          ..primaryContactNo ??= ''
          ..rating ??= ''
          ..emailAddress ??= ''
          ..qualification ??= ''
          ..description ??= ''
          ..specialization ??= ''
          ..languagesKnown ??= '');
  }

  static List<DoctorResult> fromListJson(String jsonString) {
    return jsonDecode(jsonString)
        .map<DoctorResult>((e) => fromJson(jsonEncode(e)))
        .toList();
  }

  String toJson() {
    return jsonEncode(serializers.serializeWith(DoctorResult.serializer, this));
  }

  factory DoctorResult([Function(DoctorResultBuilder b) updates]) =
      _$DoctorResult;

  static Serializer<DoctorResult> get serializer => _$doctorResultSerializer;
}
