import 'package:flutter/material.dart';
import 'package:travel/Screens/catalog-screen.dart';
import 'package:travel/Screens/welcome.dart';
import 'package:travel/models/country-model.dart';

void main() {
  runApp(const TravelApp());
}

class TravelApp extends StatelessWidget {
  const TravelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.light(background: Color(0xFFA6CDC3)),
          useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
      routes: {
        // CatalogScreen.routeName: (context) => CatalogScreen(),
        WelcomeScreen.routeName: (context) => WelcomeScreen(),
      },
      onGenerateRoute: (settings) {
        // If you push the PassArguments route
        if (settings.name == CatalogScreen.routeName) {
          // Cast the arguments to the correct
          // type: ScreenArguments.
          final args = settings.arguments as CountryModel;

          // Then, extract the required data from
          // the arguments and pass the data to the
          // correct screen.
          return MaterialPageRoute(
            builder: (context) {
              return CatalogScreen(
                selectedCountry: args,
              );
            },
          );
        }
        // The code only supports
        // PassArgumentsScreen.routeName right now.
        // Other values need to be implemented if we
        // add them. The assertion here will help remind
        // us of that higher up in the call stack, since
        // this assertion would otherwise fire somewhere
        // in the framework.
        assert(false, 'Need to implement ${settings.name}');
        return null;
      },
    );
  }
}
