import 'dart:io';

import 'package:doctor_management/business_logic/model/doctor_result.dart';
import 'package:doctor_management/business_logic/service/bima_service.dart';

class Repository {
  late BimaService service;
  
  Repository(){
    service = BimaService.create();
  }
  
  Future<List<DoctorResult>?> getDoctorList() async{
    List<DoctorResult>? doctorResult = [];
    try{
      final result = await InternetAddress.lookup('google.com');
      if(result.isNotEmpty && result[0].rawAddress.isNotEmpty){
        var response = await service.getResult();

        if(response.isSuccessful && response.body?.length != null){
          doctorResult = response.body?.toList();
        }else{
          return null;
        }
      }
    }on SocketException catch(e){
      print(e);
      return null;
    }
    return doctorResult;
  }
}