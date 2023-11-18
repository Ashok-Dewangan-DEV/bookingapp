import 'package:flutter/material.dart';
import 'package:bookingapp/screens/calculator.dart';

class Home extends StatelessWidget {
  const Home({ Key? key }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
          child: Calculator()
      ),
    );
  }
}