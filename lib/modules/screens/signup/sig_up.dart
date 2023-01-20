import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weighttask/cubit/sign_up/signup_cubit.dart';
import 'package:weighttask/modules/screens/Login/log_in.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weighttask/modules/screens/home/home_screen.dart';
import '../../widget/button.dart';
import '../../widget/text_default.dart';
import '../../widget/text_field.dart';

class SignupScreen extends StatelessWidget {
   SignupScreen({Key? key}) : super(key: key);
   static String Signupid='Signup';
  TextEditingController emailcontrollar = TextEditingController();
  TextEditingController passwordcontrollar = TextEditingController();
  var formkey = GlobalKey<FormState>();

  bool check=false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>SignupCubit(),
      child: BlocConsumer<SignupCubit,SignupState>(
        listener: (context,state){

          if(state is SignupScuess)
            {
              check=true;
            }
          if(state is SignupScuess)
            {
              Fluttertoast.showToast(msg: "Sign up Sucess");
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
                          'Signup',
                          style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Sign up now to browse our hot offers',
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
                            // ShopLoginCubit.get(context).changePasswordVisibility();
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
                              SignupCubit.get(context).userRegister(
                                email: emailcontrollar.text,
                                password: passwordcontrollar.text,
                              );
                            }
                          },
                          text: 'Sign up',
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
                                Navigator.pushNamed(context, LoginScreen.logid);
                              },
                              text: 'Login',
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
