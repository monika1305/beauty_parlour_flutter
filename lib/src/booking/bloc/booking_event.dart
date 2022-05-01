part of 'booking_bloc.dart';

abstract class BookingEvent extends Equatable {
  const BookingEvent();
}

class BookingStarted extends BookingEvent {
  @override
  List<Object> get props => [];
}