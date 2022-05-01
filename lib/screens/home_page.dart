import 'package:beauty_parlor/helper/responsiveWidget.dart';
import 'package:beauty_parlor/helper/widgets/bottomBar.dart';
import 'package:beauty_parlor/screens/dash_service_tile_carousel.dart';
import 'package:beauty_parlor/screens/dash_services_heading.dart';
import 'package:beauty_parlor/screens/home_drawer.dart';
import 'package:beauty_parlor/src/products/view/dash_cust_heading.dart';
import 'package:beauty_parlor/src/products/view/featured_tiles.dart';
import 'package:beauty_parlor/helper/widgets/topBarContents.dart';
import 'package:beauty_parlor/helper/widgets/web_scrollbar.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';

import '../utils/authentication.dart';
import 'dash_services_heading.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    _opacity = _scrollPosition < screenSize.height * 0.40
        ? _scrollPosition / (screenSize.height * 0.40)
        : 1;

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
        backgroundColor:
        Theme.of(context).bottomAppBarColor.withOpacity(_opacity),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6),
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              EasyDynamicTheme.of(context).changeTheme();
            },
          ),
        ],
        title: Text(
          'EXPLORE',
          style: TextStyle(
            color: Colors.blueGrey[100],
            fontSize: 20,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
            letterSpacing: 3,
          ),
        ),
      )
          : PreferredSize(
        preferredSize: Size(screenSize.width, 1000),
        child: TopBarContents(_opacity),
      ),
      drawer: ExploreDrawer(),
      body: WebScrollbar(
        color: Colors.blueGrey,
        backgroundColor: Colors.blueGrey.withOpacity(0.3),
        width: 10,
        heightFraction: 0.3,
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: ClampingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    child: SizedBox(
                      height: screenSize.height * 0.45,
                      width: screenSize.width,
                      child: Image.asset(
                        'assets/images/cover.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              DestinationHeading(screenSize: screenSize),

              DestinationCarousel(),

              SizedBox(height: screenSize.height / 10),

              Container(
                child: Column(
                  children: [
                    FeaturedHeading(
                      screenSize: screenSize,
                    ),
                    FeaturedTiles(screenSize: screenSize)
                  ],
                ),
              ),

              SizedBox(height: screenSize.height / 10),

              BottomBar(),
            ],
          ),
        ),
      ),
    );
  }
}
