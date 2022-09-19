import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/model/TaskOrderModel.dart';
import 'package:task/shared/components/constants.dart';
import 'package:task/shared/cubit/task_cubit/states.dart';

import '../../network/remote/dio_helper.dart';

class TaskCubit extends Cubit<TaskStates>
{
  TaskCubit() : super(TaskInitialState());

  static TaskCubit get(context) => BlocProvider.of(context);


  TaskOrderModel? orderModel;

  void getOrders()
  {
    emit(TaskGetOrdersLoadingState());

    DioHelper.getData(
      url: '/api/v1/orders/list-orders',
      token: token,

    ).then((value)
    {
      //print(value.data['articles'][0]['title']);
      orderModel = TaskOrderModel.fromJson(value.data);
      print(value.data.toString());


      emit(TaskGetOrdersSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(TaskGetOrdersErrorState(error.toString()));
    });
  }



}