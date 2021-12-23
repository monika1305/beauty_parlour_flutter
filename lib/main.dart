import 'package:beauty_parlor/screens/home_page.dart';
import 'package:beauty_parlor/utils/authentication.dart';
import 'package:beauty_parlor/utils/theme_data.dart';
import 'package:flutter/material.dart';

import 'helper/responsiveWidget.dart';
import 'helper/widgets/salonDrawer.dart';

import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(
    EasyDynamicThemeWidget(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future getUserInfo() async {
    await getUser();
    setState(() {});
    print(uid);
  }

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salon',
      theme: lightThemeData,
      darkTheme: darkThemeData,
      debugShowCheckedModeBanner: false,
      themeMode: EasyDynamicTheme.of(context).themeMode,
      home: HomePage(),
    );
  }
}
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Explore',
//       theme: ThemeData(
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
// class _HomePageState extends State<HomePage> {
//   List _isHovering = [false, false, false, false, false];
//
//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;
//
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: ResponsiveWidget.isSmallScreen(context)
//           ? AppBar( // for smaller screen sizes
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Text(
//           'EXPLORE',
//           style: TextStyle(
//             color: Colors.blueGrey.shade100,
//             fontSize: 20,
//             fontFamily: 'Montserrat',
//             fontWeight: FontWeight.w400,
//             letterSpacing: 3,
//           ),
//         ),
//       )
//           : PreferredSize(
//         preferredSize: Size(screenSize.width, 1000),
//
//         child: Container(
//           // color: Colors.white70,
//           child: Padding(
//             padding: EdgeInsets.all(15),
//             child: Row(
//               children: [
//                 Text('Salon',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontWeight: FontWeight.w700,
//                     fontSize: 30,
//                     fontStyle: FontStyle.italic
//                   ),),
//                 Expanded(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       InkWell(
//                         onHover: (value) {
//                           setState(() {
//                             _isHovering[0] = value;
//                           });
//                         },
//                         onTap: () {},
//                         child: Text(
//                           'About us',
//                           style: TextStyle(
//                             color: _isHovering[0]
//                                 ? Colors.pink
//                                 : Colors.black,
//                             fontWeight: FontWeight.w700,
//                             fontSize: 15,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: screenSize.width / 50,
//                       ),
//                       InkWell(
//                         onHover: (value) {
//                           setState(() {
//                             _isHovering[1] = value;
//                           });
//                         },
//                         onTap: () {},
//                         child: Text(
//                           'Services',
//                           style: TextStyle(
//                             color: _isHovering[1]
//                                 ? Colors.pink
//                                 : Colors.black,
//                             fontWeight: FontWeight.w700,
//                             fontSize: 15,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: screenSize.width / 50,
//                       ),
//                       InkWell(
//                         onHover: (value) {
//                           setState(() {
//                             _isHovering[2] = value;
//                           });
//                         },
//                         onTap: () {},
//                         child: Text(
//                           'Gallery',
//                           style: TextStyle(
//                             color: _isHovering[2]
//                                 ? Colors.pink
//                                 : Colors.black,
//                             fontWeight: FontWeight.w700,
//                             fontSize: 15,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: screenSize.width / 50,
//                       ),
//                       InkWell(
//                         onHover: (value) {
//                           setState(() {
//                             _isHovering[3] = value;
//                           });
//                         },
//                         onTap: () {},
//                         child: Text(
//                           'Contact us',
//                           style: TextStyle(
//                             color: _isHovering[3]
//                                 ? Colors.pink
//                                 : Colors.black,
//                             fontWeight: FontWeight.w700,
//
//                             fontSize: 15,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: screenSize.width / 50,
//                       ),
//                       InkWell(
//                         onHover: (value) {
//                           setState(() {
//                             _isHovering[4] = value;
//                           });
//                         },
//                         onTap: () {},
//                         child: Text(
//                           'Book Online',
//                           style: TextStyle(
//                             color: _isHovering[4]
//                                 ? Colors.pink
//                                 : Colors.black,
//                             fontWeight: FontWeight.w700,
//
//                             fontSize: 15,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         width: screenSize.width / 50,
//                       ),
//                     ],
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//         ),
//
//       ),
//       drawer: SalonDrawer(),
//       body: Stack(
//         children: [
//           Container( // image below the top bar
//             child: SizedBox(
//               height: screenSize.height * 0.45,
//               width: screenSize.width,
//               child: Image.asset(
//                 'assets/images/cover.png',
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Center(
//             heightFactor: 1,
//             child: Padding(
//               padding: EdgeInsets.only(
//                 top: screenSize.height * 0.40,
//                 left: screenSize.width / 5,
//                 right: screenSize.width / 5,
//               ),
//               child: Card( // floating quick access bar
//                 // ...
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }