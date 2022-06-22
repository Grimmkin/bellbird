import 'package:flutter/material.dart';
import 'package:bellbird/ui/screens/home.dart';
import 'package:bellbird/ui/screens/notes_page.dart';

class AppRouter {
  Route onGeneratedRoute(RouteSettings settings) {
    // implement business logic here
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => Home());
      case '/NotesPage':
        return MaterialPageRoute(
            builder: (context) => NotesPage(
                  note: args,
                ));
      default:
        return MaterialPageRoute(builder: (context) => Home());
    }
  }
}
