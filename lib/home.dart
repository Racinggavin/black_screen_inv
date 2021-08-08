import 'package:flutter/material.dart';
import 'generated/l10n.dart';
import 'package:black_screen_inv/generated/gen_l10n/app_localizations.dart';

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
        title: Text(
          S.of(context).homePage
          // AppLocalizations.of(context)!.homePage
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(context).content1,
              //AppLocalizations.of(context)!.content1,
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
