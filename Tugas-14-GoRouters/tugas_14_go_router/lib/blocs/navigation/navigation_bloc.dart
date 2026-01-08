import 'package:flutter_bloc/flutter_bloc.dart';
import 'navigation_state.dart';

class NavigationBloc extends Cubit<NavigationState> {
  NavigationBloc() : super(const NavigationState(0));

  void setIndex(int newIndex) {
    emit(NavigationState(newIndex));
  }
}
