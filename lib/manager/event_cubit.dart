import 'package:bloc/bloc.dart';

import '../data/api_service.dart';
import 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  final ApiService apiService;

  EventCubit(this.apiService) : super(EventInitial());

  Future<void> fetchEvents() async {
    try {
      emit(EventLoading());
      final response = await apiService.fetchEvents();
      final eventResponse = apiService.parseEventResponse(response);
      emit(EventLoaded(eventResponse));
    } catch (e) {
      emit(EventError(e.toString()));
    }
  }
}
