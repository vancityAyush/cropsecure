import 'package:flutter/material.dart';

class ComingSoon extends StatelessWidget {
  final String title;

  ComingSoon({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text(
          'Comming Soon!!!',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
