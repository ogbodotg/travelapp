import 'package:bloc/bloc.dart';
import 'package:itravel/cubit/cubit_state.dart';
import 'package:itravel/model/data_model.dart';
import 'package:itravel/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }

  final DataServices data;
  late final places;

  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();

      emit(LoadedState(places));
    } catch (e) {}
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  returnHome() {
    emit(LoadedState(places));
  }
}
