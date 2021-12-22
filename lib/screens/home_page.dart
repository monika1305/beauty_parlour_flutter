import 'package:beauty_parlor/helper/responsiveWidget.dart';
import 'package:beauty_parlor/helper/widgets/bottomBar.dart';
import 'package:beauty_parlor/helper/widgets/carousel.dart';
import 'package:beauty_parlor/helper/widgets/destination_heading.dart';
import 'package:beauty_parlor/helper/widgets/explore_drawer.dart';
import 'package:beauty_parlor/helper/widgets/featured_heading.dart';
import 'package:beauty_parlor/helper/widgets/featured_tiles.dart';
import 'package:beauty_parlor/helper/widgets/floating_quick_access_bar.dart';
import 'package:beauty_parlor/helper/widgets/salonDrawer.dart';
import 'package:beauty_parlor/helper/widgets/topBarContents.dart';
import 'package:beauty_parlor/helper/widgets/web_scrollbar.dart';
import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:flutter/material.dart';
/*

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  List _isHovering = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar( // for smaller screen sizes
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'EXPLORE',
          style: TextStyle(
            color: Colors.blueGrey.shade100,
            fontSize: 20,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w400,
            letterSpacing: 3,
          ),
        ),
      )
          : PreferredSize(
        preferredSize: Size(screenSize.width, 1000),

        child: Container(
          // color: Colors.white70,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                Text('Salon',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    fontStyle: FontStyle.italic
                  ),),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onHover: (value) {
                          setState(() {
                            _isHovering[0] = value;
                          });
                        },
                        onTap: () {},
                        child: Text(
                          'About us',
                          style: TextStyle(
                            color: _isHovering[0]
                                ? Colors.pink
                                : Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenSize.width / 50,
                      ),
                      InkWell(
                        onHover: (value) {
                          setState(() {
                            _isHovering[1] = value;
                          });
                        },
                        onTap: () {},
                        child: Text(
                          'Services',
                          style: TextStyle(
                            color: _isHovering[1]
                                ? Colors.pink
                                : Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenSize.width / 50,
                      ),
                      InkWell(
                        onHover: (value) {
                          setState(() {
                            _isHovering[2] = value;
                          });
                        },
                        onTap: () {},
                        child: Text(
                          'Gallery',
                          style: TextStyle(
                            color: _isHovering[2]
                                ? Colors.pink
                                : Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenSize.width / 50,
                      ),
                      InkWell(
                        onHover: (value) {
                          setState(() {
                            _isHovering[3] = value;
                          });
                        },
                        onTap: () {},
                        child: Text(
                          'Contact us',
                          style: TextStyle(
                            color: _isHovering[3]
                                ? Colors.pink
                                : Colors.black,
                            fontWeight: FontWeight.w700,

                            fontSize: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenSize.width / 50,
                      ),
                      InkWell(
                        onHover: (value) {
                          setState(() {
                            _isHovering[4] = value;
                          });
                        },
                        onTap: () {},
                        child: Text(
                          'Book Online',
                          style: TextStyle(
                            color: _isHovering[4]
                                ? Colors.pink
                                : Colors.black,
                            fontWeight: FontWeight.w700,

                            fontSize: 15,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: screenSize.width / 50,
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),

      ),
      drawer: SalonDrawer(),
      body: Stack(
        children: [
          Container( // image below the top bar
            child: SizedBox(
              height: screenSize.height * 0.45,
              width: screenSize.width,
              child: Image.asset(
                'assets/images/cover.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            heightFactor: 1,
            child: Padding(
              padding: EdgeInsets.only(
                top: screenSize.height * 0.40,
                left: screenSize.width / 5,
                right: screenSize.width / 5,
              ),
              child: Card( // floating quick access bar
                // ...
              ),
            ),
          )
        ],
      ),
    );
  }
}*/

class HomePage extends StatefulWidget {
  static const String route = '/';

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
          'SALON',
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
              // FloatingQuickAccessBar(screenSize: screenSize),
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
