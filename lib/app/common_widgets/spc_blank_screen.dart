import 'package:flutter/material.dart';

class SPCBlankScreen extends StatelessWidget {
  const SPCBlankScreen(
      {super.key,
      this.appbarTitle = 'SPC Blank Screen',
      this.bodyText = 'SPC Blank Screen'});
  final String appbarTitle;
  final String bodyText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appbarTitle),
      ),
      body: Center(
        child: Text(bodyText),
      ),
    );
  }
}
