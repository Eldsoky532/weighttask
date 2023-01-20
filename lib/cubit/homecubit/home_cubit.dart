import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:weighttask/models/weight.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);

  int c=0;

  void putdata({required String weight,required String data})
 async {

    emit(HomeLoading());
    WeightModel weightModel=WeightModel(weight: weight, datetime: data);
   await FirebaseFirestore.instance.collection('Weight').doc().set(
        weightModel.toMap()
    ).then((value) {

      emit(HomeSucess());
    }).catchError((onError){
      emit(Homeerror());
    });
  }

}
