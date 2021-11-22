import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//! With muttable state
class MutableStateClaSS extends ChangeNotifier {
  int field1;
  String field2;
  void changeState() {
    field2 = 'New value'; //! we're mutating this field in place (mutatind state!!!)
    notifyListeners();
  }
}

//! With immutable state
// In this case we'll have two separate classes 
/// This is STATE class
class MyState extends Equatable{
  final int field1;
  final String field2;

  MyState(this.field1, this.field2);
/// This method is from Equatable package
  @override
  List<Object> get props => [field1,field2];

}
//! FIELD ARE IN SEPARATE CLASS FROM CUBITS
/// Cubit is changing state
class MyCubit extends Cubit<MyState> {
  MyCubit() : super(MyState(0, 'Initial value'));

  void changeState() {
    emit(MyState(0, 'New value'));
  }
}
//! Differnt between BLoC and Cubit is that Cubits doesn't have events
//! Instead of events we have simple methods changeState that update the state