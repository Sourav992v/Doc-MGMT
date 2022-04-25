import 'package:doctor_management/ui/cubit/doctor_cubit.dart';
import 'package:doctor_management/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  bool _isEditable = false;

  toggle(){
    setState(() {
      _isEditable = !_isEditable;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<DoctorCubit, DoctorState>(
  builder: (context, state) {
    return Stack(
          children: [ Container(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height,
                maxWidth: MediaQuery.of(context).size.width),
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                kColorPrimaryDark,
                kColorPrimary,
              ], begin: Alignment.topLeft, end: Alignment.centerRight),
            ),
            child: Column(
              children: [
                const SizedBox(height: 56.0,),
                Expanded(
                  flex:2,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${state.result?[state.index?.toInt() ?? 0].firstName} ${state.result?[state.index?.toInt() ?? 0].lastName}'),
                        ElevatedButton(
                          onPressed: () async {
                            toggle();
                          },
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(_isEditable ? 'SAVE':
                              'EDIT PROFILE',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0))),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex:8,
                  child: Container(
                    color: Colors.grey,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                          child: Text('PERSONAL DETAILS',
                            textAlign: TextAlign.center,),
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey,
                          padding: const EdgeInsets.symmetric(vertical:4.0,horizontal: 8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('FIRST NAME',
                                  textAlign: TextAlign.center,),
                                const SizedBox(height: 4.0,),
                                SizedBox(
                                  height: 24.0,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: _isEditable ? '':"${state.result?[state.index?.toInt() ?? 0].firstName}",
                                      hintStyle: TextStyle(color: Colors.black),
                                    ),
                                    enabled: _isEditable,
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),

                        Container(

                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(vertical:4.0,horizontal: 8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('LAST NAME',
                                  textAlign: TextAlign.center,),
                                SizedBox(height: 4.0,),

                                SizedBox(
                                  height: 24.0,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: _isEditable ? '':"${state.result?[state.index?.toInt() ?? 0].lastName}",
                                      hintStyle: TextStyle(color: Colors.black),
                                    ),
                                    enabled: _isEditable,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(

                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(vertical:4.0,horizontal: 8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('GENDER',
                                  textAlign: TextAlign.center,),
                                SizedBox(height: 4.0,),
                                Text('NA',
                                  textAlign: TextAlign.center,),
                              ],
                            ),
                          ),
                        ),
                        Container(

                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(vertical:4.0,horizontal: 8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('CONTACT NUMBER',
                                  textAlign: TextAlign.center,),
                                SizedBox(height: 4.0,),
                                Text('${state.result?[state.index?.toInt() ?? 0].primaryContactNo}',
                                  textAlign: TextAlign.center,),
                              ],
                            ),
                          ),
                        ),

                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                          child: Text('DATE OF BIRTH',
                            textAlign: TextAlign.center,),
                        ),
                        Expanded(
                          child: GridView.count(
                            primary: false,
                            shrinkWrap: false,
                            childAspectRatio: 1.8,
                            crossAxisSpacing: 2,
                            mainAxisSpacing: 2,
                            crossAxisCount: 3,
                            children: [
                              Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Icon(Icons.calendar_today_sharp, size: 12.0, color: Colors.grey,),
                                        Text('Day')
                                      ],
                                    ),
                                    const Text('28')

                                  ],
                                ),
                              ),
                              Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(

                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Icon(Icons.calendar_today_sharp, size: 12.0, color: Colors.grey,),
                                        Text('Month')
                                      ],
                                    ),
                                    const Text('June')

                                  ],
                                ),
                              ),
                              Card(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(

                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: const [
                                        Icon(Icons.calendar_today_sharp, size: 12.0, color: Colors.grey,),
                                        Text('Year')
                                      ],
                                    ),
                                    const Text('1995')

                                  ],
                                ),
                              ),

                              Card(
                                child: Row(

                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.accessibility_sharp, size: 12.0, color: Colors.grey,),
                                    Text('BLOOD GROUP')
                                  ],
                                ),
                              ),
                              Card(
                                child: Row(

                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.height, size: 12.0, color: Colors.grey,),
                                    Text('HEIGHT')
                                  ],
                                ),
                              ),
                              Card(
                                child: Row(

                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.line_weight, size: 12.0, color: Colors.grey,),
                                    Text('WEIGHT')
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),


              ],
            ),
          ),
            Positioned(
              top: 32.0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40))
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(40.0),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1584432810601-6c7f27d2362b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=783&q=80',
                      height: 40,
                      width: 40,
                      fit: BoxFit.contain,
                    ),
                  ),
                )),

            Positioned(
              top: 24.0,
                left: 8.0,
                child: InkWell(
                  onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back, color: kColorAccent,size: 24.0,)))
    ]
        );
  },
),
      ),
    );
  }
}
