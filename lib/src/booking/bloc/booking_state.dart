part of 'booking_bloc.dart';

abstract class BookingState extends Equatable {
  const BookingState();

  @override
  List<Object> get props => [];
}

class BookingLoading extends BookingState {}

class BookingLoaded extends BookingState {
  const BookingLoaded(this.catalog);

  final Booking catalog;

  @override
  List<Object> get props => [catalog];
}

class BookingError extends BookingState {}