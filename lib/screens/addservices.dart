import 'package:flutter/material.dart';

class AddServices extends StatelessWidget {
  static const String routeName = '/services';

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Add Services'),
            centerTitle: true,
          ),
        ));
  }
}