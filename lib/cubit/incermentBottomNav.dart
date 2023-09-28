import 'package:flutter_bloc/flutter_bloc.dart';

class IncermentBottomNav extends Cubit<int> {
  IncermentBottomNav() : super(0);
  void incerment(int value) => emit(value);
}
