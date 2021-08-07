import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Test"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Did you see black screen ?",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.purple,
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
          ]
        ),
      ),
    );
  }
}
