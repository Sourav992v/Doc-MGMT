import 'package:doctor_management/ui/cubit/doctor_cubit.dart';
import 'package:doctor_management/ui/repository/repository.dart';
import 'package:doctor_management/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_services_binding/flutter_services_binding.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:logging/logging.dart';
import 'package:path_provider/path_provider.dart';


import 'ui/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  FlutterServicesBinding.ensureInitialized();
  HydratedStorage storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),);
  await Firebase.initializeApp();
  HydratedBlocOverrides.runZoned(() =>
  runApp(const DoctorManagementApp()),
    storage: storage
  );
  _setUpLogging();
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
            primaryColor: kColorPrimary,
            primaryColorDark: kColorPrimaryDark,
            fontFamily: 'Roboto',
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                primary: kColorPrimary,
              ),
            ),
          ),

         home: const LoginScreen()
         ,
        ),
      ),
    );
  }
}
void _setUpLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}

