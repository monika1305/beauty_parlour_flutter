import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Customer extends Equatable {
  String name;
  String emailid;
  String ratings;
  String message;
  String id;

  DocumentReference? reference;
  final List<Customer>? itemNames;


  Customer(this.itemNames,  {required this.name,
    required this.emailid,
    required this.ratings,
    required this.message,
    required this.id});

//When data is fetched from Firebase, it is in JSON format. this method allows
  // us to map data from JSON format to our Product format.
  /* Booking.fromMap(Map<String, dynamic> snapshot, this.itemNames)
      : assert(snapshot['id']!=null && snapshot['name'] !=null &&
      snapshot['emailid'] !=null && snapshot['contactnumber'] !=null &&
      snapshot['dateofbooking'] !=null && snapshot['message'] !=null),
        id = snapshot['id'],
        name = snapshot['name'],
        emailid = snapshot['emailid'],
        gender = snapshot['gender'],
        contactnumber = snapshot['contactnumber'],
        dateofbooking = (snapshot['dateofbooking']),
        message = snapshot['message'];*/
  //toJson() does the opposite which is to map the data back
  // into JSON format before we upload into Firebase
  toJson() {
    return {
      "name": name,
      "emailid": emailid,
      "ratings": ratings,
      "message": message,
    };
  }


  @override
  // TODO: implement props
  List<Object?> get props => [id,name,emailid,
    ratings,message];
}
