import 'package:beauty_parlor/src/booking/model/booking.dart';
import 'package:beauty_parlor/utils/authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterfire_ui/firestore.dart';
class DB{
  final db = FirebaseFirestore.instance;


  Stream<QuerySnapshot> initStream(){
    return db.collection('booking').snapshots();
  }

  Future<String> createData(Booking booking) async{
    var ref= await db.collection('booking').add(
        {
          'name': '${booking.name}',
          'emailid': '${booking.emailid}',
          'gender': '${booking.gender}',
          'contactnumber': '${booking.contactnumber}',
          'dateofbooking': '${booking.dateofbooking}',
          'message': '${booking.message}',
          // 'id': '${booking.id}',
        });
    print(ref.id);
    return ref.id;
  }

  Future<List<Booking>?> readData() async {










    List<Booking>?  value = [];
    await db.collection("booking").get().then((querySnapshot) {

      querySnapshot.docs.forEach((result) {

        // print('readingData---------------${result.data()['name']}');

        value.add(new Booking(name: result.data()['name'].toString(),
            emailid: result.data()['emailid'].toString(),
            gender: result.data()['gender'].toString(),
            contactnumber: result.data()['contactnumber'].toString(),
            dateofbooking: (result.data()['dateofbooking'].toString()),
            message: result.data()['message'].toString(),
            id: result.data()['id'].toString(),
            itemNames: []));
      });
      // print('readingData---value.length- one inside-----------${value.length}');
      print('readingData---value.length- one inside-----------${value.toString()}');
      return value ;
    });
    print('readingData---value.length------------${value.length}');

    return value ;

  }


  void updateData(DocumentSnapshot doc, Booking booking) async {
    await db.collection('booking').doc(doc.id).update({
      'name': '${booking.name}',
      'emailid': '${booking.emailid}',
      'gender': '${booking.gender}',
      'contactnumber': '${booking.contactnumber}',
      'dateofbooking': '${booking.dateofbooking}',
      'message': '${booking.message}',});
  }

  void deleteData(DocumentSnapshot doc) async {
    await db.collection('booking').doc(doc.id).delete();
  }
}

DB db=DB();