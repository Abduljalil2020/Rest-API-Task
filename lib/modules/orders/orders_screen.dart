import 'dart:convert';

import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/model/TaskOrderModel.dart';
import 'package:task/modules/mytest.dart';
import 'package:task/modules/ordersDetails/orders_details_screen.dart';
import 'package:task/shared/network/end_points.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/task_cubit/cubit.dart';
import '../../shared/cubit/task_cubit/states.dart';

class OrdersScreen extends StatelessWidget {
  //TaskOrderModel   model =  TaskCubit.get(context).orderModel!;

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<TaskCubit, TaskStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        //var list = 10;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'الطلبات',
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Colors.black54,
                    ),
              ),
            centerTitle: true,
            ),
            body:state is TaskGetOrdersLoadingState?
            Center(child: CircularProgressIndicator()):
            itemBuilder(TaskCubit.get(context).orderModel!)
        );
      },
    );
  }

  Widget itemBuilder(TaskOrderModel  model,) => ConditionalBuilder(
       condition: model.model!.length>1,
    builder: (context) =>
        ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              buildOrdersItem(model.model![index],context,index),
          separatorBuilder: (context, index) => myDivider(),
          itemCount:model.model!.length,
           // model.model!.length
        ),
    fallback: (context) => Center(child: CircularProgressIndicator()),
  );
  Widget buildOrdersItem (Model model,context, index) => Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  model.user!.name.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  model.deliveringSite!.address.toString(),
                  maxLines: 1,textDirection: TextDirection.rtl,

                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  model.loadingSite!.address.toString(),
                  maxLines: 1,textDirection: TextDirection.rtl,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  model.notes!=null?  model.notes.toString():"لا يوجد ملاحظات",
                  maxLines: 1,textDirection: TextDirection.rtl,

                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.normal,

                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      style: BorderStyle.solid,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                child: Image(
                  image: NetworkImage(
                 'https://api.ghanmeen.com${model.orderImages![0].path.toString()}'
                      //BASEURL+"${model.orderImages![index]}"


                  ),
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
      myDivider(),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Container(

                      width: 100,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: MaterialButton(
                        onPressed:(){
                          navigateTo(context, OrdersDetailsScreen(model: model,));
                          // model.orderImages = value.data['articles'];
                          print(BASEURL+"${model.user!.profileImagePath}");


                         // print(https://api.ghanmeen.com${model.user!.profileImagePath.toString());

                        }, child: Text(
                          'التفاصيل'
                      ),


                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Spacer(),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(

                  children: [
                    Text(
                      // dateFormat.format(DateTime.now()),
                      model.deliveringAt!.toString().substring(0,10),
                      style: TextStyle(
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.date_range,
                  color: Colors.black,
                  size: 30.0,
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );




}
