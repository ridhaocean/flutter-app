import 'package:bloc/bloc.dart';

import '../data/api_service.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final ApiService apiService;

  UserCubit(this.apiService) : super(UserInitial());

  Future<void> fetchUser() async {
    try {
      emit(UserLoading());
      final user = await apiService.fetchUser();
      emit(UserLoaded(user));
    } catch (e) {
      emit(UserError(e.toString()));
    }
  }
}
