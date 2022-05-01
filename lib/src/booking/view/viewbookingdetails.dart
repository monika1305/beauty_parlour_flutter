import 'dart:async';
import 'dart:ui';

import 'package:beauty_parlor/src/booking/model/booking.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../repository/db.dart';

class ViewBookingDetails extends StatefulWidget{
  static const String routeName = '/viewbookingdetails';

  @override
  _ViewBookingDetailsState createState() => _ViewBookingDetailsState();


}

class _ViewBookingDetailsState extends State<ViewBookingDetails> {
     List<Booking>? employeeData = [];
     final DB shoppingRepository = DB();

      String getDateFormated(String dateofBookin)  {
      DateTime parseDate =
       new DateFormat("yyyy-MM-dd HH:mm:ss.SSS").parse(dateofBookin);
       var inputDate = DateTime.parse(parseDate.toString());
       var outputFormat = DateFormat('MM/dd/yyyy hh:mm a');
       var outputDate = outputFormat.format(inputDate);
       print(outputDate);
       return outputDate;
     }

     Widget _buildDataGrid() {
       final usersQuery = FirebaseFirestore.instance.collection('booking').orderBy('name');

     return FirestoreListView<Map<String, dynamic>>(
           scrollDirection: Axis.vertical,
           pageSize: 20,
           query: usersQuery,
           itemBuilder: (context, snapshot) {
             Map<String, dynamic> user = snapshot.data();

             return  Padding(
               padding: const EdgeInsets.fromLTRB(50,8,5,4),
               child: new Container(
                 height: 50,
                 child: new Card(
                   clipBehavior: Clip.antiAlias,
                   color: Colors.white,
                   margin: EdgeInsets.all(5),
                   elevation: 8,
                   shadowColor: Colors.green,
                   shape: BeveledRectangleBorder(
                       borderRadius: BorderRadius.circular(5)
                   ),
                   //the addition form container
                   child: new Column(
                     mainAxisSize: MainAxisSize.min,
                     children: <Widget>[
                       Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           SizedBox(
                             width: 150.0,
                           child: Text('${user['name']}',
                               textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.visible,
                              softWrap: false,
                               style: TextStyle(fontWeight: FontWeight.normal,
                                 color: Colors.black,
                                 fontSize: 15,
                                 letterSpacing: 0.5,

                               ),
                             ),
                             ),


                           SizedBox(width: 150.0,
                             child:Text('${user['emailid']}',
                             textAlign: TextAlign.center,
                               maxLines: 1,
                               overflow: TextOverflow.visible,
                               softWrap: false,
                               style: TextStyle(fontWeight: FontWeight.normal,
                               color: Colors.black,
                               fontSize: 15,
                               letterSpacing: 0.5,
                             ),
                             ),
                           ),
                           SizedBox(width:150.0,
                             child: Text('${user['contactnumber']}',
                             textAlign: TextAlign.center,
                             maxLines: 1,
                             overflow: TextOverflow.visible,
                             softWrap: false,
                             style: TextStyle(fontWeight: FontWeight.normal,
                               color: Colors.black,
                               fontSize: 15,
                               letterSpacing: 0.5,
                             ),
                           ),
                           ),
                           SizedBox(width: 150.0,
                             child: Text('${getDateFormated(user['dateofbooking'])}',
                             textAlign: TextAlign.center,
                               maxLines: 2,
                               overflow: TextOverflow.visible,
                               softWrap: false,
                             style: TextStyle(fontWeight: FontWeight.normal,
                               color: Colors.black,
                               fontSize: 15,
                               letterSpacing: 0.5,
                             ),
                           ),
                           ),
                           SizedBox(width:  150.0,
                             child:
                           Text('${user['message']}',
                             textAlign: TextAlign.center,
                             maxLines: 2,
                             overflow: TextOverflow.visible,
                             softWrap: false,
                             style: TextStyle(fontWeight: FontWeight.normal,
                               color: Colors.black,
                               fontSize: 15,
                               letterSpacing: 0.5,

                             ),
                             ),
                           ),
                         ],
                       ),
                     ],
                   ),
                 ),),
             );
           },
     );
     }


     @override
     Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(
           title: Column(
             children: [
               Padding(
                 padding: const EdgeInsets.all(5.0),
                 child:   new Row(
                     mainAxisSize: MainAxisSize.max,
                     children: <Widget>[
                       SizedBox(
                         width: 135.0,
                         child:  Text('Name',
                           style: TextStyle(fontWeight: FontWeight.bold,
                               fontSize: 16
                           ),
                           textAlign: TextAlign.center,
                           maxLines: 1,
                           overflow: TextOverflow.visible,
                           softWrap: false,
                         ),
                       ),
                       SizedBox(
                         width: 135.0,
                         child:  Text('Email id',
                           style: TextStyle(fontWeight: FontWeight.bold,
                               fontSize: 16
                           ),
                           textAlign: TextAlign.center,
                           maxLines: 2,
                           overflow: TextOverflow.visible,
                           softWrap: false,
                         ),
                       ),
                       SizedBox(
                         width: 150.0,
                         child:  Text('Contact No.',
                           style: TextStyle(fontWeight: FontWeight.bold,
                               fontSize: 16
                           ),
                           textAlign: TextAlign.center,
                           maxLines: 1,
                           overflow: TextOverflow.visible,
                           softWrap: false,
                         ),
                       ),
                       SizedBox(
                         width: 165.0,
                         child:  Text('Date of\n Booking',
                           style: TextStyle(fontWeight: FontWeight.bold,
                               fontSize: 16
                           ),
                           textAlign: TextAlign.center,
                           maxLines: 2,
                           overflow: TextOverflow.visible,
                           softWrap: false,
                         ),
                       ),

                       SizedBox(
                         width: 150.0,
                         child:  Text('Message',
                           style: TextStyle(fontWeight: FontWeight.bold,
                               fontSize: 16
                           ),
                           textAlign: TextAlign.center,
                           maxLines: 1,
                           overflow: TextOverflow.visible,
                           softWrap: false,
                         ),
                       ),
                    ],
                   ),),
             ],
           ),
         ),
         body: _buildDataGrid(),
       );
     }
}
