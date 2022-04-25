// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'doctor_result.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<DoctorResult> _$doctorResultSerializer =
    new _$DoctorResultSerializer();

class _$DoctorResultSerializer implements StructuredSerializer<DoctorResult> {
  @override
  final Iterable<Type> types = const [DoctorResult, _$DoctorResult];
  @override
  final String wireName = 'DoctorResult';

  @override
  Iterable<Object?> serialize(Serializers serializers, DoctorResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(num)));
    }
    value = object.firstName;
    if (value != null) {
      result
        ..add('first_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lastName;
    if (value != null) {
      result
        ..add('last_name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.profilePic;
    if (value != null) {
      result
        ..add('profile_pic')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.favorite;
    if (value != null) {
      result
        ..add('favorite')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.primaryContactNo;
    if (value != null) {
      result
        ..add('primary_contact_no')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.rating;
    if (value != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.emailAddress;
    if (value != null) {
      result
        ..add('email_address')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.qualification;
    if (value != null) {
      result
        ..add('qualification')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.specialization;
    if (value != null) {
      result
        ..add('specialization')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.languagesKnown;
    if (value != null) {
      result
        ..add('languagesKnown')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  DoctorResult deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new DoctorResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num?;
          break;
        case 'first_name':
          result.firstName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'last_name':
          result.lastName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'profile_pic':
          result.profilePic = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'favorite':
          result.favorite = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'primary_contact_no':
          result.primaryContactNo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'email_address':
          result.emailAddress = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'qualification':
          result.qualification = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'specialization':
          result.specialization = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'languagesKnown':
          result.languagesKnown = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$DoctorResult extends DoctorResult {
  @override
  final num? id;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? profilePic;
  @override
  final bool? favorite;
  @override
  final String? primaryContactNo;
  @override
  final String? rating;
  @override
  final String? emailAddress;
  @override
  final String? qualification;
  @override
  final String? description;
  @override
  final String? specialization;
  @override
  final String? languagesKnown;

  factory _$DoctorResult([void Function(DoctorResultBuilder)? updates]) =>
      (new DoctorResultBuilder()..update(updates)).build();

  _$DoctorResult._(
      {this.id,
      this.firstName,
      this.lastName,
      this.profilePic,
      this.favorite,
      this.primaryContactNo,
      this.rating,
      this.emailAddress,
      this.qualification,
      this.description,
      this.specialization,
      this.languagesKnown})
      : super._();

  @override
  DoctorResult rebuild(void Function(DoctorResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  DoctorResultBuilder toBuilder() => new DoctorResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is DoctorResult &&
        id == other.id &&
        firstName == other.firstName &&
        lastName == other.lastName &&
        profilePic == other.profilePic &&
        favorite == other.favorite &&
        primaryContactNo == other.primaryContactNo &&
        rating == other.rating &&
        emailAddress == other.emailAddress &&
        qualification == other.qualification &&
        description == other.description &&
        specialization == other.specialization &&
        languagesKnown == other.languagesKnown;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, id.hashCode),
                                                firstName.hashCode),
                                            lastName.hashCode),
                                        profilePic.hashCode),
                                    favorite.hashCode),
                                primaryContactNo.hashCode),
                            rating.hashCode),
                        emailAddress.hashCode),
                    qualification.hashCode),
                description.hashCode),
            specialization.hashCode),
        languagesKnown.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('DoctorResult')
          ..add('id', id)
          ..add('firstName', firstName)
          ..add('lastName', lastName)
          ..add('profilePic', profilePic)
          ..add('favorite', favorite)
          ..add('primaryContactNo', primaryContactNo)
          ..add('rating', rating)
          ..add('emailAddress', emailAddress)
          ..add('qualification', qualification)
          ..add('description', description)
          ..add('specialization', specialization)
          ..add('languagesKnown', languagesKnown))
        .toString();
  }
}

class DoctorResultBuilder
    implements Builder<DoctorResult, DoctorResultBuilder> {
  _$DoctorResult? _$v;

  num? _id;
  num? get id => _$this._id;
  set id(num? id) => _$this._id = id;

  String? _firstName;
  String? get firstName => _$this._firstName;
  set firstName(String? firstName) => _$this._firstName = firstName;

  String? _lastName;
  String? get lastName => _$this._lastName;
  set lastName(String? lastName) => _$this._lastName = lastName;

  String? _profilePic;
  String? get profilePic => _$this._profilePic;
  set profilePic(String? profilePic) => _$this._profilePic = profilePic;

  bool? _favorite;
  bool? get favorite => _$this._favorite;
  set favorite(bool? favorite) => _$this._favorite = favorite;

  String? _primaryContactNo;
  String? get primaryContactNo => _$this._primaryContactNo;
  set primaryContactNo(String? primaryContactNo) =>
      _$this._primaryContactNo = primaryContactNo;

  String? _rating;
  String? get rating => _$this._rating;
  set rating(String? rating) => _$this._rating = rating;

  String? _emailAddress;
  String? get emailAddress => _$this._emailAddress;
  set emailAddress(String? emailAddress) => _$this._emailAddress = emailAddress;

  String? _qualification;
  String? get qualification => _$this._qualification;
  set qualification(String? qualification) =>
      _$this._qualification = qualification;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _specialization;
  String? get specialization => _$this._specialization;
  set specialization(String? specialization) =>
      _$this._specialization = specialization;

  String? _languagesKnown;
  String? get languagesKnown => _$this._languagesKnown;
  set languagesKnown(String? languagesKnown) =>
      _$this._languagesKnown = languagesKnown;

  DoctorResultBuilder();

  DoctorResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _firstName = $v.firstName;
      _lastName = $v.lastName;
      _profilePic = $v.profilePic;
      _favorite = $v.favorite;
      _primaryContactNo = $v.primaryContactNo;
      _rating = $v.rating;
      _emailAddress = $v.emailAddress;
      _qualification = $v.qualification;
      _description = $v.description;
      _specialization = $v.specialization;
      _languagesKnown = $v.languagesKnown;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(DoctorResult other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$DoctorResult;
  }

  @override
  void update(void Function(DoctorResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$DoctorResult build() {
    final _$result = _$v ??
        new _$DoctorResult._(
            id: id,
            firstName: firstName,
            lastName: lastName,
            profilePic: profilePic,
            favorite: favorite,
            primaryContactNo: primaryContactNo,
            rating: rating,
            emailAddress: emailAddress,
            qualification: qualification,
            description: description,
            specialization: specialization,
            languagesKnown: languagesKnown);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
