import 'package:doctor_management/ui/cubit/doctor_cubit.dart';
import 'package:doctor_management/ui/details_screen/details_screen.dart';
import 'package:doctor_management/ui/login/login_screen.dart';
import 'package:doctor_management/utils/constants.dart';
import 'package:doctor_management/utils/enums.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<DoctorCubit>().getResult();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(

        child:  ListView(
          children: [
            DrawerHeader(child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 40,
              child: Image.asset('assets/images/ic_bima.png'),
            )),
            Container(
              margin: const EdgeInsets.only(left: 8.0),
              child: ListTile(
                onTap: (){
                  auth.signOut();
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const LoginScreen()), (route) => false);
                },
                title: const Text('Logout', style: TextStyle(fontWeight: FontWeight.bold),),
              ),
            )
          ],
        ),
      ),

      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: kColorPrimaryDark),
        title: const Text(
          'BIMA DOCTOR',
          style: TextStyle(
            color: kColorPrimary,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Transform.scale(
              scale: 4,
              child: IconButton(icon: Image.asset('assets/images/ic_bima.png'), onPressed: () {  },)
            ),
          )
        ],
      ),
      body: BlocBuilder<DoctorCubit, DoctorState>(
        builder: (context, state) {
          if (state.resourceStatus == ResourceStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return state.resourceStatus == ResourceStatus.failure
              ? const Center(
                  child: Text('Error'),
                )
              : SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: state.result?.length ?? 0,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext buildContext, int index) {
                        return InkWell(
                          onTap: (){
                            context.read<DoctorCubit>().setIndex(index);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => const DetailsScreen()));
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 92,
                            child: Card(
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(40))
                                      ),
                                      child: CircleAvatar(
                                        radius: 24,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(40.0),
                                          child: Image.network(
                                            '${state.result?[index].profilePic}',
                                            errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                                              return Text('Not Found', style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),);
                                            },
                                            //'https://images.unsplash.com/photo-1584432810601-6c7f27d2362b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=783&q=80',
                                            height: 48,
                                            width: 48,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              'Dr. ${state.result?[index].firstName} ${state.result?[index].lastName}'),
                                          Text(
                                              '${state.result?[index].specialization}'),
                                          Flexible(
                                            child: RichText(
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              strutStyle: const StrutStyle(fontSize: 12.0),
                                              text: TextSpan(
                                                  style: const TextStyle(color: Colors.black),
                                                  text: '${state.result?[index].description}'),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                      flex: 1,
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        color: kColorPrimary,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                );
        },
      ),
    );
  }
}
