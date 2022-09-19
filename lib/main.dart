import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/shared/bloc_observer.dart';
import 'package:task/shared/components/constants.dart';
import 'package:task/shared/cubit/app_cubit/cubit.dart';
import 'package:task/shared/cubit/app_cubit/states.dart';
import 'package:task/shared/cubit/task_cubit/cubit.dart';
import 'package:task/shared/network/local/cache_helper.dart';
import 'package:task/shared/network/remote/dio_helper.dart';
import 'package:task/shared/styles/themes.dart';

import 'modules/login/login_screen.dart';
import 'modules/mytest.dart';
import 'modules/orders/orders_screen.dart';


void main() async {
  // بيتأكد ان كل حاجه هنا في الميثود خلصت و بعدين يتفح الابلكيشن
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CasheHelper.init();
  token =CasheHelper.getData(key: 'token');


  BlocOverrides.runZoned(
          () {
        runApp(MyApp());
      },
      blocObserver:  MyBlocObserver());

}
class MyApp extends StatelessWidget
{

  MyApp();

  @override
  Widget build(BuildContext context)
  {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit()

        ),
        BlocProvider(
            create: (BuildContext context) => TaskCubit()..getOrders()

        ),

      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: ThemeData.light(),
            themeMode:ThemeMode.light,
            home:OrdersScreen(),
          );
        },
      ),
    );
  }
}
