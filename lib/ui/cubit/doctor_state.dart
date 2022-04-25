part of 'doctor_cubit.dart';

class DoctorState extends Equatable {
  const DoctorState({
    this.resourceStatus,
    this.result,
    this.index
  });

  final ResourceStatus? resourceStatus;
  final List<DoctorResult>? result;
  final num? index;

  DoctorState copyWith(
      {ResourceStatus? resourceStatus,
        List<DoctorResult>? result,
        num? index
      }) {
    return DoctorState(
      resourceStatus: resourceStatus ?? this.resourceStatus,
      result: result ?? this.result,
      index: index ?? this.index,
    );
  }

  @override
  List<Object?> get props => [resourceStatus, result, index];

  Map<String, dynamic> toMap(){
    return {
      'doctorResponse' : result
    };
  }

  String toJson() => json.encode(toMap());

  factory DoctorState.fromMap(Map<String, dynamic> map){
    return DoctorState(result: DoctorResult.fromListJson(map['doctorResponse']));
  }

  factory DoctorState.fromJson(String source) =>
      DoctorState.fromMap(json.decode(source));
}
