import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/components/components.dart';
import '../../shared/cubit/login_cubit/cubit.dart';
import '../../shared/cubit/login_cubit/states.dart';
import '../../shared/network/local/cache_helper.dart';
import '../orders/orders_screen.dart';

class TaskLoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var phoneController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TaskLoginCubit(),
      child: BlocConsumer<TaskLoginCubit, TaskLoginStates>(
        listener: (context, state) {
          if( state is TaskLoginSuccessState){
            if(state.loginModel.success==true){
              print(state.loginModel.message);
             print(state.loginModel.meta?.token);
              CasheHelper.saveData(key: 'token',
                value: state.loginModel.model!.tokens!.accessToken,
              ).then((value) {
                navigateAndFinish(context, OrdersScreen(),);
              });

            }else
            {
              showToast(
                  state: ToastStates.ERROR,
                  text: state.loginModel.message.toString()
              );


            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('assets/images/car.png'),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Text(
                          'تسجيل دخول',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: defaultFormField(
                                controller: phoneController,
                                type: TextInputType.emailAddress,
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'please enter your phone';
                                  }
                                },
                                label: '0123456789',
                               // prefix: Icons.email_outlined,
                              ),
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            Container(

                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                  style: BorderStyle.solid,
                                  width: 1.0,
                                ),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              //clipBehavior: ,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                        '+966'
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10
                                    ,),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 5),
                                    child: Image(
                                      image: AssetImage('assets/images/saudi-arabia.png'),
                                      width: 30,
                                      height: 50,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        defaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          suffix: TaskLoginCubit.get(context).suffix,
                          onSubmit: (value) {
                            if (formKey.currentState!.validate()) {
                              TaskLoginCubit.get(context).userLogin(
                                phone: phoneController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          isPassword: TaskLoginCubit.get(context).isPassword,
                          suffixPressed: () {

                            TaskLoginCubit.get(context)
                                .changePasswordVisibility();
                          },
                          validate: (String value) {
                            if (value.isEmpty) {
                              return 'password is too short';
                            }
                          },
                          label: 'كلمة المرور',
                          prefix: Icons.lock_outline,
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        ConditionalBuilder(
                          condition: state is! TaskLoginLoadingState,
                          builder: (context) => defaultButton(
                            function: () {
                              if (formKey.currentState!.validate()) {
                                TaskLoginCubit.get(context).userLogin(
                                  phone: phoneController.text,
                                  password: passwordController.text,
                                );
                                print( phoneController.text.toString());
                                print( passwordController.text.toString());

                              }
                            },
                            text: 'تسجيل الدخول',
                            isUpperCase: true,
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(
                          height: 15.0,
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
