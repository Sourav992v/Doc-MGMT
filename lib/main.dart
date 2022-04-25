import 'package:doctor_management/ui/cubit/doctor_cubit.dart';
import 'package:doctor_management/ui/repository/repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_services_binding/flutter_services_binding.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';


import 'ui/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  FlutterServicesBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),);
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  HydratedBlocOverrides.runZoned(() =>
  runApp(const DoctorManagementApp()),
    storage: storage
  );
}

class DoctorManagementApp extends StatelessWidget {
  const DoctorManagementApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Repository repository = Repository();
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider.value(value: repository)
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<DoctorCubit>(create: (context) => DoctorCubit(repository: repository))
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),

         home: const LoginScreen()
         ,
        ),
      ),
    );
  }
}

