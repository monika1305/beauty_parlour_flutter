import 'package:beauty_parlor/screens/routes.dart';
import 'package:beauty_parlor/screens/addservices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../src/booking/view/viewbookingdetails.dart';
import '../../src/products/view/feedbackdialog.dart';
import '../../utils/authentication.dart';
import '../../utils/constants.dart';
import '../responsiveWidget.dart';

Widget createDrawer(BuildContext context, GlobalKey<FormState> formKey) {

  return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            color: Theme.of(context).canvasColor,
            child: DrawerHeader(
              child:  ProfileCard(),

            ),
          ),
          ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text('Clients Bookings'),
              onTap: () {
  Navigator.push(
  context,
  new MaterialPageRoute(
  builder: (context) => new ViewBookingDetails()),
  );



              }),
          ListTile(
              leading: Icon(Icons.pie_chart),
              title: Text('Services'),
              onTap: () {

                Navigator.push(context, new MaterialPageRoute(
                    builder: (context) => new AddServices()),);

              }),
          ListTile(
              leading: Icon(Icons.category),
              title: Text('Add Review'),
              onTap: () {
                showDialog(
                    context: context, builder:
                    (context) => const FeedbackDialog());
                // Navigator.push(context, new MaterialPageRoute(
                //     builder: (context) => new AddCustReview()),);

              }),  ListTile(
              leading: Icon(Icons.category),
              title: Text('Dashboard'),
              onTap: () {

                Navigator.popAndPushNamed(context, Routes.dashboard);

              }),
        ],
      ));
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: defaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: defaultPadding,
        vertical: defaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(imageUrl.toString(),
          height: 100,),
          if (!ResponsiveWidget.isMobile(context))
              Text(name!,textAlign: TextAlign.center,),

        ],
      ),
    );
  }
}
