import 'package:doctor_management/utils/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(Icons.menu_outlined, color: kColorPrimary,),
        title: const Text('BIMA DOCTOR',style: TextStyle(color: kColorPrimary,),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Transform.scale(scale: 2, child: Icon(Icons.message, color: kColorPrimaryDark,size: 40,),),
          )
        ],
      ),
    );
  }
}
