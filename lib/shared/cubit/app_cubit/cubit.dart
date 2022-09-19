import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/shared/cubit/app_cubit/states.dart';
import '../../network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);




}
