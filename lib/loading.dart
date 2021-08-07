import 'package:flutter/material.dart';
import 'app.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loading(),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          return App();
        }
        return _buildLoadingScreen();
      }
    );
  }

  Future<void> _loading() async {
    print('[Loading] _Loading start');
    return Future.delayed(Duration(seconds: 3), () {
      print('[Loading] _Loading completed');
    });
  }

  Widget _buildLoadingScreen() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.purple,
    );
  }
}
