
import 'package:beauty_parlor/screens/addservices.dart';
import 'package:beauty_parlor/screens/dashboard_page.dart';
import 'package:beauty_parlor/screens/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../src/booking/view/viewbookingdetails.dart';

class Routes {
  static const String viewbookingdetails = ViewBookingDetails.routeName;
  static const String services = AddServices.routeName;
  static const String dashboard = DashboardPage.routeName;
  static const String home = HomePage.routeName;

  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/' :
        return  MaterialPageRoute(
            builder: (_)=> HomePage()
        );
      case '/viewbookingdetails' :
        return MaterialPageRoute(
            builder: (_)=> ViewBookingDetails()
        ) ;
      case '/services' :
        return MaterialPageRoute(
            builder: (_)=> AddServices()
        ) ;
      case '/dashboard' :
        return MaterialPageRoute(
            builder: (_)=> DashboardPage()
        ) ;
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}