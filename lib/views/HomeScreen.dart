import 'package:flutter/material.dart';
import 'package:flutter_rosa/helpers/css.dart';

class HomeUtama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: CSS().gradienLinear()
        ),
      ),
    );
  }
}
