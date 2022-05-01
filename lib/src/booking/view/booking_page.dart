
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mailer/flutter_mailer.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
class BookingPage extends StatefulWidget {
  final DateTime initialDateTime;

    BookingPage ( { Key? key,required this.initialDateTime }): super();

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {


  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();

    return firebaseApp;
  }

  late GlobalKey<FormState> _formKey;
  DateTime date = DateTime.now();

  String message = '';
  String contactNumber = '';
  String gender = '';
  String emailId = '';
  String name = '';

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4)
      ),
      child: Form(
        key: _formKey,
        child: Container(
          // height: 200,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Column(
                  children: [
                    Image.asset('assets/images/booking_header.jpeg'),

                  ],),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.person),
                        title: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter Name',
                            border: OutlineInputBorder(),
                            labelText: 'Name',
                          ),
                          onChanged: (value) {
                            name = value;
                          },
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.email),
                        title: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter Email-id',
                            border: OutlineInputBorder(),
                            labelText: 'Email-id',
                          ),
                          onChanged: (value) {
                            emailId = value;
                          },
                        ),
                      ),
                      RadioGroup(),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title:
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Enter Contact Number',
                            border: OutlineInputBorder(),
                            labelText: 'Contact Number',
                          ),
                          onChanged: (value) {
                            contactNumber = value;
                          },
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.calendar_today),
                        title: _FormDatePicker(
                          date: date,
                          onChanged: (value) {
                            setState(() {
                              date = value;
                            });
                          },
                        ),

                      ),
                      ListTile(
                        leading: Icon(Icons.message),
                        title: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            filled: true,
                            hintText: 'Enter Message',
                            labelText: 'Message',
                          ),
                          onChanged: (value) {
                            message = value;
                          },
                          maxLines: 5,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(30),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              child: Text("Cancel",

                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            SizedBox(width: 20,),
                            TextButton(
                                child: Text("Submit",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),),
                                onPressed: () {
                                  _launchURL(name,emailId,
                                      RadioGroupWidget().radioButtonItem,
                                      contactNumber,date.toString(),message);
                                } //_launchURL('sharma.monika573@gmail.com', 'Flutter Email Test', 'Hello Flutter'),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),),
    );
  }
  Future _launchURL(String name,String emailId,
      String gender,String contactNumber,String date,String message) async{


    Map<String, dynamic> newBook = new Map<String,dynamic>();
    newBook["name"] = name;
    newBook["emailid"] = emailId;
    newBook["gender"] = gender;
    newBook["contactnumber"] = contactNumber;
    newBook["dateofbooking"] = (date);
    newBook["message"] = message;
    newBook["id"] = name +""+DateTime.now().toString();
await sendEmail(name,emailId,contactNumber,date,message);
    FirebaseFirestore.instance
        .collection("booking")
        .add(newBook)
        .whenComplete((){
      // You can add your desire action after the row is added
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Done'),
              content: Text('Added Successfully'),
              actions: <Widget>[
                ElevatedButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          }
          );
    } )
    .catchError((onError){
      print('Error ----------- ${onError.toString()}');
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('An Error Ocurred'),
              content: Text(onError),
              actions: <Widget>[
                ElevatedButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.pop(context);

                  },
                ),
              ],
            );
          }
      );
    });
}
final serviceId='service_a1tth7m';
final templateId='template_ct96554';
final userId='ekHrgnqnxb_lOXeOr';

  Future sendEmail(String name, String emailId, String contactNumber, String date, String message) async {

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
        url,
    headers: {
          'Content-Type' : 'application/json',
    },
    body: json.encode(
        {
          'service_id':serviceId,
          'template_id':templateId,
          'user_id':userId,
          'template_params' :{
            'user_name':name,
           'user_email':emailId,
           'user_subject':'Appointment booking',
           'user_booking_date': date,
           'user_message': message,

          }
       }
     ),
    );
    print(response.body);

  }
}


class RadioGroup extends StatefulWidget {
  @override
  RadioGroupWidget createState() => RadioGroupWidget();
}

class RadioGroupWidget extends State {

  // Default Radio Button Selected Item When App Starts.
  String radioButtonItem = 'MALE';

  // Group Value for Radio Button.
  int id = 1;

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        /*Padding(
            padding: EdgeInsets.all(14.0),
            child: Text('Gender* = ' + '$radioButtonItem',
                style: TextStyle(fontSize: 21))
        ),*/
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(14.0),
                child: Text('Gender : ' ,
                    style: TextStyle(fontSize: 21))
            ),
            Radio(
              value: 1,
              groupValue: id,
              onChanged: (val) {
                setState(() {
                  radioButtonItem = 'MALE';
                  id = 1;

                });
              },
            ),
            Text(
              'MALE',
              style: new TextStyle(fontSize: 17.0),
            ),

            Radio(
              value: 2,
              groupValue: id,
              onChanged: (val) {
                setState(() {
                  radioButtonItem = 'FEMALE';
                  id = 2;
                });
              },
            ),
            Text(
              'FEMALE',
              style: new TextStyle(
                fontSize: 17.0,
              ),
            ),

            Radio(
              value: 3,
              groupValue: id,
              onChanged: (val) {
                setState(() {
                  radioButtonItem = 'OTHERS';
                  id = 3;
                });
              },
            ),
            Text(
              'OTHERS',
              style: new TextStyle(fontSize: 17.0),
            ),
          ],
        ),

      ],
    );
  }
}

class _FormDatePicker extends StatefulWidget {
  final DateTime date;
  final ValueChanged<DateTime> onChanged;

  const _FormDatePicker({
    required this.date,
    required this.onChanged,
  });

  @override
  _FormDatePickerState createState() => _FormDatePickerState();
}

class _FormDatePickerState extends State<_FormDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Date',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              DateFormat.yMd().format(widget.date),
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
        TextButton(
          child: const Text('Edit',
    style: TextStyle(color: Colors.white,fontSize: 20),),
          onPressed: () async {
            var newDate = await showDatePicker(
              context: context,
              initialDate: widget.date,
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );

            // Don't change the date if the date picker returns null.
            if (newDate == null) {
              return;
            }

            widget.onChanged(newDate);
          },
        )
      ],
    );
  }
}