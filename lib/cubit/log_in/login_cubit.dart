import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  })
  {
    emit(SigninLoading());
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password).then((value) async{
      print(value.user!.email);
      print(value.user!.uid);

      emit(SigninScuess());
    }).catchError((onError){
      emit(SigninError());
    });


  }
}
