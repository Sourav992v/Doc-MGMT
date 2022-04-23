import 'package:flutter/material.dart';

import 'ui/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const DoctorManagementApp());
}

class DoctorManagementApp extends StatelessWidget {
  const DoctorManagementApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

     home: const LoginScreen()
     ,
    );
  }
}

