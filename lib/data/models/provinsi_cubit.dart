import 'package:bloc/bloc.dart';

class IdState {
  String value;

  IdState(this.value);
}

class IdCubit extends Cubit<IdState> {
  IdCubit() : super(IdState("11"));

  void setId(String id) => emit(IdState(id));
}
