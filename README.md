# black_screen_inv

A flutter test app to investigate a black screen problem on [Stack overflow](https://stackoverflow.com/questions/66354275/flutter-shows-black-screen-at-startup-after-localization/68694375#68694375)

## How to reproduce

To reproduce the problem situatioon, use `flutter run` to run this app then modity below initialization code in /lib/app.dart

    return MaterialApp(
      localizationsDelegates: [
        S.delegate,                       // <--- will cause black screen
        //AppLocalizations.delegate,      // <--- no black screen
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      
      ...


## Observation

### flutter_intl (It will cause black screen)

Apply the [flutter_intl](https://localizely.com/flutter-localization-workflow?utm_medium=ide_plugin&utm_source=androidstudio_readmore) to enable the app internationalize. It generates class S with asynchronous future call inside will cause an instantaneous black screen at program start.

    static Future<S> load(Locale locale) {
      final name = (locale.countryCode?.isEmpty ?? false)
          ? locale.languageCode
          : locale.toString();
      final localeName = Intl.canonicalizedLocale(name);
      
      return initializeMessages(localeName).then((_) {
        Intl.defaultLocale = localeName;
        final instance = S();
        S._current = instance;

        return instance;
      });
    }
  
### intl (It's fine, no black screen)

Follow the internationalize guidance on official [flutter.dev](https://flutter.dev/docs/development/accessibility-and-localization/internationalization) generate very similar class _AppLocalizationsDelegate, which is also override the load method as below.

    Future<AppLocalizations> load(Locale locale) {
      return SynchronousFuture<AppLocalizations>(_lookupAppLocalizations(locale));
    }
    
    