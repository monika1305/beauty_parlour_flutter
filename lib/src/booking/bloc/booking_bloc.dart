
import 'package:beauty_parlor/src/booking/model/booking.dart';
import 'package:beauty_parlor/src/booking/repository/db.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';
part 'booking_event.dart';
part 'booking_state.dart';
/*

class BookingBloc implements BlocBase {
  BookingBloc() {
    db.initStream().listen((data) {
      print('BookingBloc --- ${data.size}');
    _inFirestore.add(data);
  });
  }
  String? id;

  /// Refer to https://github.com/RobertBrunhage/Youtube-Tutorials/issues/3 to see why we use BehaviorSubject instead.
  final _idController = StreamController<String>();
  Stream<String> get outId => _idController.stream;
  Sink<String> get _inId => _idController.sink;

  final _firestoreController = StreamController<QuerySnapshot>();
  Stream<QuerySnapshot> get outFirestore => _firestoreController.stream;
  Sink<QuerySnapshot> get _inFirestore => _firestoreController.sink;

  Future<List<Booking>?> readData() async {
   return db.readData();
  }

  void updateData(DocumentSnapshot doc,Booking booking) {
    db.updateData(doc,booking);
  }

  void deleteData(DocumentSnapshot doc) async {
    db.deleteData(doc);
    id = null;
    _inId.add('');
  }

  void createData(Booking obj) async {
    String id = await db.createData(obj);
    this.id = id;
    _inId.add(id);
  }

  @override
  void dispose() {
    _firestoreController.close();
    _idController.close();
  }
}*/

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final DB shoppingRepository = DB();

  BookingBloc() : super(BookingLoading()) {
    // on<BookingStarted>(_onStarted);
  }

  final _weatherFetcher = PublishSubject<List<Booking>>();

  Stream<List<Booking>> get weather => _weatherFetcher.stream;

  Future<List<Booking>> fetchLondonWeather() async {
    List<Booking> weatherResponse = await shoppingRepository.readData() as List<Booking>;
    _weatherFetcher.sink.add(weatherResponse);
   // print('readingData---weatherResponse.length------------${weatherResponse.length}');

    return weatherResponse;
  }


  dispose() {
    _weatherFetcher.close();
  }
}

final bookingblo = BookingBloc();
