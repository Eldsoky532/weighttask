import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weighttask/models/usermodel.dart';
part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  static SignupCubit get(context) => BlocProvider.of(context);


  void userRegister({

    required String email,
    required String password,


  }) {
    emit(SignupLoading());

    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      UserModel userModel=UserModel(Email: email, Password: password);
      emit(SignupScuess());
    }).catchError((onError) {
      emit(SignupError());
    });


  }








}
