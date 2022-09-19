abstract class TaskStates {}

class TaskInitialState extends TaskStates {}


class TaskGetOrdersLoadingState extends TaskStates {}

class TaskGetOrdersSuccessState extends TaskStates {}

class TaskGetOrdersErrorState extends TaskStates
{
  final String error;

  TaskGetOrdersErrorState(this.error);
}


