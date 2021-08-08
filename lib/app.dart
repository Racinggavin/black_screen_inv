import 'package:flutter/material.dart';
import 'generated/l10n.dart';
import 'home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:black_screen_inv/generated/gen_l10n/app_localizations.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        S.delegate,                       // <--- will cause black screen
        //AppLocalizations.delegate,      // <--- no black screen
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales:
        S.delegate.supportedLocales,
        //AppLocalizations.supportedLocales,
      localeResolutionCallback: (Locale? locale, Iterable<Locale> supports) {
        if(null != locale) {
          Locale? matched;
          int matchLevel = 3;
          do {
            matched = _getMatchLocale(locale, supports, matchLevel);
          } while(matched == null && --matchLevel >= 0);
          if(null != matched) {
            print("match locale: '${_getLocaleString(matched)}'");
            return matched;
          }
        }
        return Locale('en');
      },
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }

  Locale? _getMatchLocale(Locale locale, Iterable<Locale> supports, int matchLevel) {
    for (Locale l in supports) {
      bool sameCountryCode = false;
      bool sameScriptCode = false;
      bool sameLanguageCode = false;
      if (null != locale.countryCode && null != locale.countryCode) {
        if(l.countryCode == locale.countryCode) {
          sameCountryCode = true;
        }
      }
      if(null != locale.scriptCode && null != locale.scriptCode) {
        if(l.scriptCode == locale.scriptCode) {
          sameScriptCode = true;
        }
      }
      if(l.languageCode == locale.languageCode) {
        sameLanguageCode = true;
      }
      switch(matchLevel) {
        case 1:
          if(sameLanguageCode)
            return l;
          break;
        case 2:
          if(sameLanguageCode && sameScriptCode)
            return l;
          break;
        case 3:
          if(sameLanguageCode && sameScriptCode && sameCountryCode)
            return l;
          break;
      }
    }
    return null;
  }

  String _getLocaleString(Locale l) {
    String localeString = "${l.languageCode}";
    if(null != l.scriptCode) {
      localeString += "_${l.scriptCode}";
    }
    if(null != l.countryCode) {
      localeString += "_${l.countryCode}";
    }
    return localeString;
  }
}
