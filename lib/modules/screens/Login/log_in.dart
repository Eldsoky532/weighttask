import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weighttask/cubit/log_in/login_cubit.dart';
import 'package:weighttask/modules/screens/signup/sig_up.dart';

import '../../widget/button.dart';
import '../../widget/text_default.dart';
import '../../widget/text_field.dart';
import '../home/home_screen.dart';

class LoginScreen extends StatelessWidget {
   LoginScreen({Key? key}) : super(key: key);

   static String logid='Login';

   TextEditingController emailcontrollar = TextEditingController();
   TextEditingController passwordcontrollar = TextEditingController();
   var formkey = GlobalKey<FormState>();
   bool check=false;


  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginState>(
        listener: (context,state){
          if(state is SigninLoading)
            {
              check=true;
            }
          if(state is SigninScuess)
          {
            Fluttertoast.showToast(msg: "Sign in Sucess");
            Navigator.pushNamed(context, HomeScreen.homeid);
          }
        },
        builder: (context,state){
          return Scaffold(

            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'LOGIN',
                          style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Login now to browse our hot offers',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaultFormField(
                          controller: emailcontrollar,
                          type: TextInputType.emailAddress,
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'please enter your email address';
                            }
                          },
                          label: 'Email Address',
                          prefix: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: passwordcontrollar,
                          type: TextInputType.visiblePassword,

                          suffixPressed: () {
                          },
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'password is too short';
                            }
                          },
                          label: 'Password',
                          prefix: Icons.lock_outline,
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        defaultButton(
                          function: () {
                            if (formkey.currentState!.validate()) {
                              LoginCubit.get(context).userLogin(
                                email: emailcontrollar.text,
                                password: passwordcontrollar.text,
                              );
                            }
                          },
                          text: 'login',
                          isUpperCase: true,
                        ),


                        SizedBox(
                          height: 15.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                            ),
                            defaultTextButton(
                              function: () {
                                Navigator.pushNamed(context, SignupScreen.Signupid);
                              },
                              text: 'register',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
