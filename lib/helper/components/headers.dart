
import 'package:beauty_parlor/helper/responsiveWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pie_chart/pie_chart.dart';
import '../../utils/constants.dart';
import '../widgets/createdrawer.dart';

class Header  extends StatefulWidget {

  final double opacity;

  Header(this.opacity);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          children: [

            if (!ResponsiveWidget.isMobile(context))
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               crossAxisAlignment: CrossAxisAlignment.start,

               children: [
                 createDrawer(context,_formKey),
                 createPieChart(context),
                 createPieChartforBookingInfo(context),
               // Text('Hello'),
               ],
             ),

          ],
        ),
      ),
    );
  }

  createPieChart(BuildContext context) {
    Map<String, double> dataMap = new Map();
    dataMap.putIfAbsent("Hair makeup package", () => 50);
    dataMap.putIfAbsent("Bridal Package", () => 30);
    dataMap.putIfAbsent("Regular package ", () => 20);
    dataMap.putIfAbsent("Mens grooming package", () => 25);
    return Container(
        margin: EdgeInsets.only(left: defaultPadding),
    padding: EdgeInsets.symmetric(
    horizontal: defaultPadding,
    vertical: defaultPadding / 2,
    ),
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PieChart(
          dataMap: dataMap,
          animationDuration: Duration(milliseconds: 800),
          chartLegendSpacing: 32.0,
          chartRadius: MediaQuery.of(context).size.width / 10,
          chartType: ChartType.disc,
        ),
       SizedBox(height: 10,),
        Text('Booking Packages Details'),
      ],
    ),
    );

  }

  createPieChartforBookingInfo(BuildContext context) {
    Map<String, double> dataMap = new Map();
    dataMap.putIfAbsent("Booking Enquiries", () => 60);
    dataMap.putIfAbsent("Feedback after service", () => 40);
    return Container(
        margin: EdgeInsets.only(left: defaultPadding),
    padding: EdgeInsets.symmetric(
    horizontal: defaultPadding,
    vertical: defaultPadding / 3,
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PieChart(
          dataMap: dataMap,
          animationDuration: Duration(milliseconds: 800),
          chartLegendSpacing: 32.0,
          chartRadius: MediaQuery.of(context).size.width / 10,
          chartType: ChartType.disc,
        ),
       SizedBox(height: 10,),
        Text('Booking Information'),
      ],
    ),
    );

  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        fillColor: Theme.of(context).canvasColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(defaultPadding * 0.75),
            margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
        ),
      ),
    );
  }
}