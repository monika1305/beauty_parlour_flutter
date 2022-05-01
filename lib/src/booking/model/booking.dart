import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Booking extends Equatable {
String name;
String emailid;
String gender;
String contactnumber;
String dateofbooking;
String message;
String id;

DocumentReference? reference;
final List<Booking>? itemNames;


Booking( {required this.name,
required this.emailid,
required this.gender,
required this.contactnumber,
required this.dateofbooking,
required this.message,
required this.id, required this.itemNames});

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
      "gender": gender,
      "contactnumber": contactnumber,
      "dateofbooking": (dateofbooking.toString()),
      "message": message,
    };
  }


  @override
  // TODO: implement props
  List<Object?> get props => [id,name,emailid,
    gender,contactnumber,dateofbooking,message];
 }
