import 'package:flutter/material.dart';

class CardTitle extends StatelessWidget {

  final String title;

  const CardTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Text(
        title,
        textAlign: TextAlign.start,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
