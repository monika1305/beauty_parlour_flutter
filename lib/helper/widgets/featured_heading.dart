
import 'package:flutter/material.dart';

import '../responsiveWidget.dart';

class FeaturedHeading extends StatelessWidget {
  const FeaturedHeading({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    List _isHovering = [false, false, false, false, false];

    return Padding(
      padding: EdgeInsets.only(
        top: screenSize.height * 0.06,
        left: screenSize.width / 15,
        right: screenSize.width / 15,
      ),
      child: ResponsiveWidget.isSmallScreen(context)
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(),
                Text(
                  'Products & Brand',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                // Text(
                //   'Unique wildlife tours & destinations',
                //   textAlign: TextAlign.end,
                //   style: Theme.of(context).primaryTextTheme.subtitle1,
                // ),
                // SizedBox(height: 10),
              ],
            )
          : Row(

              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onHover: (value) {

                    _isHovering[0] = value;

                  },
                  onTap: () {},
                  child: Text(
                    'Products & Brands',
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // Text(
                //   'Products & Brand',
                //   style: TextStyle(
                //     fontSize: 40,
                //     fontFamily: 'Montserrat',
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),




                // Expanded(
                //   child: Text(
                //     'Unique wildlife tours & destinations',
                //     textAlign: TextAlign.end,
                //     style: Theme.of(context).primaryTextTheme.subtitle1,
                //   ),
                // ),
              ],
            ),
    );
  }
}
