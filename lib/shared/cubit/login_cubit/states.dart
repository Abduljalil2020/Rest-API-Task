import '../../../model/login_model.dart';

abstract class TaskLoginStates {}

class TaskLoginInitialState extends TaskLoginStates {}

class TaskLoginLoadingState extends TaskLoginStates {}

class TaskLoginSuccessState extends TaskLoginStates {
 final TaskLoginModel loginModel;

 TaskLoginSuccessState(this.loginModel);
}

class TaskLoginErrorState extends TaskLoginStates
{
 final String error;

 TaskLoginErrorState(this.error);
}

class TaskChangePasswordVisibilityState extends TaskLoginStates {}

