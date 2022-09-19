import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/shared/cubit/login_cubit/states.dart';

import '../../../model/login_model.dart';
import '../../network/end_points.dart';
import '../../network/remote/dio_helper.dart';



class TaskLoginCubit extends Cubit<TaskLoginStates> {
  TaskLoginCubit() : super(TaskLoginInitialState());

  static TaskLoginCubit get(context) => BlocProvider.of(context);
   late  TaskLoginModel loginModel;
  void userLogin({
    required String phone,
    required String password,
  })
  {
    emit(TaskLoginLoadingState());

    DioHelper.postData(
      url: '/api/v1/auth/phone/driver-signing-in',
      data:
      {
        'Phone': phone,
        'Password': password,
      },
    ).then((value)
    {
      //print(value.data);
      loginModel=  TaskLoginModel.fromJson(value.data);
      print(loginModel.message);
      emit(TaskLoginSuccessState(loginModel));
    }).catchError((error)
    {
      print(error.toString());
      emit(TaskLoginErrorState(error.toString()));
    });
  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;

    emit(TaskChangePasswordVisibilityState());
  }
}
