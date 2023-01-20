import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weighttask/cubit/homecubit/home_cubit.dart';
import 'package:weighttask/modules/screens/Login/log_in.dart';
import 'package:weighttask/modules/screens/show_data/show_data.dart';

import '../../widget/button.dart';
import '../../widget/text_field.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  DateTime now = DateTime.now();

  static String homeid = 'HomeId';
  TextEditingController weightcontrollar = TextEditingController();
  TextEditingController datacontrollar = TextEditingController();
  var formkey = GlobalKey<FormState>();
  bool check = false;



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if(state is HomeLoading)
            {
              check=true;
              datacontrollar.text=now.hour.toString()+":"+now.minute.toString()+":"+now.second.toString();

            }
          if (state is HomeSucess) {
            Fluttertoast.showToast(msg: "Sucess");
            weightcontrollar.text='';


          }
        },
        builder: (context, state) {
          datacontrollar.text=now.hour.toString()+":"+now.minute.toString()+":"+now.second.toString();
          return Scaffold(
              body: Padding(
            padding: EdgeInsets.all(10),
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child:
                        Image(image: AssetImage('assets/images/editing.png')),
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  defaultFormField(
                    controller: weightcontrollar,
                    type: TextInputType.text,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'please enter your weight ';
                      }
                    },
                    label: 'Weight Address',
                    prefix: Icons.monitor_weight_outlined,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  defaultFormField(
                    controller: datacontrollar,
                    type: TextInputType.visiblePassword,
                    suffixPressed: () {},
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'Date';
                      }
                    },
                    label: 'Date',
                    prefix: Icons.lock_outline,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                   defaultButton(
                    function: () {
                      if (formkey.currentState!.validate()) {
                        HomeCubit.get(context).putdata(
                          weight: weightcontrollar.text,
                          data: now.hour.toString()+now.minute.toString()+now.second.toString(),
                        );
                      }
                    },
                    text: 'Save Data',
                    isUpperCase: true,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  defaultButton(
                    function: () {
                      Navigator.pushNamed(context, ShowData.showId);

                    },
                    text: 'Show Data',
                    isUpperCase: true,
                  ),
                  SizedBox(
                    height: 30.0,
                  ),
                  defaultButton(
                    function: () {
                      FirebaseAuth.instance.signOut().then(
                              (value) =>  Navigator.pushNamed(context, LoginScreen.logid)
                      );


                    },
                    text: 'Sign out',
                    isUpperCase: true,
                  ),
                ],
              ),
            ),
          ));
        },
      ),
    );
  }
}
