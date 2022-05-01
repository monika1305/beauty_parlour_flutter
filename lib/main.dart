
import 'package:beauty_parlor/screens/home_page.dart';
import 'package:beauty_parlor/screens/routes.dart';
import 'package:beauty_parlor/src/booking/booking.dart';
import 'package:beauty_parlor/utils/authentication.dart';
import 'package:beauty_parlor/utils/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'src/login/auth_cubit.dart';



Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
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
    return MultiProvider(
        providers: [
        BlocProvider(create: (_) => AuthCubit()),
    ],
    child : MaterialApp(
      title: 'Salon',
      theme: lightThemeData,
      darkTheme: darkThemeData,
      debugShowCheckedModeBanner: false,
      themeMode: EasyDynamicTheme.of(context).themeMode,
      home: HomePage(),
    ),
    );
  }
}