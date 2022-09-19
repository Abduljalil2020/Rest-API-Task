import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/model/TaskOrderModel.dart';
import 'package:task/shared/components/components.dart';
import 'package:task/shared/network/end_points.dart';

import '../../shared/cubit/task_cubit/cubit.dart';
import '../../shared/cubit/task_cubit/states.dart';
import '../../shared/styles/icon_broken.dart';

class OrdersDetailsScreen extends StatelessWidget {

  Model model;

  OrdersDetailsScreen({
    required this.model,
  });



  @override
  Widget build(BuildContext context) {

    return BlocConsumer<TaskCubit, TaskStates>(
      listener: (context, state) {},
      builder: (context, state) {
      //  var model = TaskCubit.get(context).orderModel!.model;
        return Scaffold(
            appBar: AppBar(
              title: Text(
                'تفاصيل الطلب',
                style: Theme.of(context).textTheme.headline6?.copyWith(
                      color: Colors.black54,
                    ),
              ),
              centerTitle: true,
            ),
            body:state is TaskGetOrdersLoadingState?
            Center(child: CircularProgressIndicator()): SingleChildScrollView(
              child: Padding(


                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200,
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
                        ),
                        width: 150,
                        height: 75,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      width: double.infinity,
                      height: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              children: [
                                Text(
                                  model.user!.name.toString(),
                                  style: TextStyle(
                                    height: 1.4,
                                  ),
                                ),
                                Text(
                                  model.user!.phone!.toString(),
                                  style: TextStyle(
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
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
                                  Text(
                                    'موقع التنزيل',
                                    style: TextStyle(
                                      height: 1.4,
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    child: Text(
                                      model.deliveringSite!.address.toString(),
                                      style: TextStyle(
                                        height: 1.4,
                                      ),maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.location_on,
                                color: Colors.green,
                                size: 30.0,
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
                                    'موقع التحميل',
                                    style: TextStyle(
                                      height: 1.4,
                                    ),
                                  ),
                                  Container(
                                    width: 100,
                                    child: Text(
                                      model.loadingSite!.address.toString(),
                                      style: TextStyle(
                                        height: 1.4,
                                      ),maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.location_on,
                                color: Colors.green,
                                size: 30.0,
                              ),
                            ],
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
                                  Text(
                                    'وقت التسليم',
                                    style: TextStyle(
                                      height: 1.4,
                                    ),
                                  ),
                                  Text(
                                    model.deliveredAt!.toString().substring(0,10),
                                    style: TextStyle(
                                      height: 1.4,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.date_range_outlined,
                                color: Colors.green,
                                size: 30.0,
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
                                    'وقت التحميل',
                                    style: TextStyle(
                                      height: 1.4,
                                    ),
                                  ),
                                  Text(
                                    model.deliveringAt!.toString().substring(0,10),
                                    style: TextStyle(
                                      height: 1.4,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.date_range_outlined,
                                color: Colors.green,
                                size: 30.0,
                              ),
                            ],
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
                                  Text(
                                    textDirection: TextDirection.rtl,
                                    model.weight.toString()+'طن',
                                    style: TextStyle(
                                      height: 1.4,
                                    ),
                                  ),
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
                                    'وزن الشحنه',
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
                                IconBroken.Bag,
                                color: Colors.black,
                                size: 30.0,
                              ),
                            ],
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
                                  Text(
                                    textDirection: TextDirection.rtl,
                                    model.containersNumber.toString()+'صندوق',
                                    style: TextStyle(
                                      height: 1.4,
                                    ),
                                  ),
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
                                    'عدد الحاويات',
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
                                IconBroken.Bag,
                                color: Colors.black,
                                size: 30.0,
                              ),
                            ],
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
                                  Text(
                                    textDirection: TextDirection.rtl,
                                    model.trucksNumber.toString()+'شاحنة',
                                    style: TextStyle(
                                      height: 1.4,
                                    ),
                                  ),
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
                                    'عدد المركبات',
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
                                Icons.car_crash_sharp,
                                color: Colors.black,
                                size: 30.0,
                              ),
                            ],
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
                                  Text(
                                    textDirection: TextDirection.rtl,
                                    model.truckCategory!.nameAr.toString(),
                                    style: TextStyle(
                                      height: 1.4,
                                    ),
                                  ),
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
                                    'نوع المركبات',
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
                                Icons.car_crash_outlined,
                                color: Colors.black,
                                size: 30.0,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ));
      },
    );
  }


}
