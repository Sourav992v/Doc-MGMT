import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:doctor_management/business_logic/model/doctor_result.dart';
import 'package:doctor_management/ui/repository/repository.dart';
import 'package:doctor_management/utils/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'doctor_state.dart';

class DoctorCubit extends HydratedCubit<DoctorState>  {

  final Repository _repository;

  DoctorCubit({
    required Repository repository
}): _repository = repository, super(const DoctorState());

  void setIndex(index) => emit(state.copyWith(index: index));

  getResult(){
    emit(state.copyWith(resourceStatus: ResourceStatus.loading));
    _repository.getDoctorList().then((value) {
      if(value?.length != null){
        emit(state.copyWith(resourceStatus: ResourceStatus.success, result: value));
      }else{
        emit(state.copyWith(resourceStatus: ResourceStatus.failure, result: value));
      }
    });
  }

  @override
  DoctorState? fromJson(Map<String, dynamic> json) {
    return DoctorState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(DoctorState state) {
    return state.toMap();
  }

}
