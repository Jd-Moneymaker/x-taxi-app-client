import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_taxi_app_client/core/nav%20cubit/nav_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(const NavigationInitial());

  void setIndex(int index) {
    emit(NavigationChanged(index));
  }
}
