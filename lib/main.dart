import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:weighttask/modules/screens/Login/log_in.dart';
import 'package:weighttask/modules/screens/home/home_screen.dart';
import 'package:weighttask/modules/screens/show_data/show_data.dart';
import 'package:weighttask/modules/screens/signup/sig_up.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute:LoginScreen.logid,
      routes: {
        LoginScreen.logid: (context) => LoginScreen(),
        SignupScreen.Signupid: (context) => SignupScreen(),
        HomeScreen.homeid: (context) => HomeScreen(),
        ShowData.showId: (context) => ShowData(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),

    );
  }
}


