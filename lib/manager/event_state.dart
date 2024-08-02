import 'package:equatable/equatable.dart';

import '../model/event.dart';

abstract class EventState extends Equatable {
  const EventState();

  @override
  List<Object?> get props => [];
}

class EventInitial extends EventState {}

class EventLoading extends EventState {}

class EventLoaded extends EventState {
  final EventResponse eventResponse;

  const EventLoaded(this.eventResponse);

  @override
  List<Object?> get props => [eventResponse];
}

class EventError extends EventState {
  final String message;

  const EventError(this.message);

  @override
  List<Object?> get props => [message];
}
