import 'package:flutter/material.dart';
import 'ui/router.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final AppRouter _approuter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "bellBird",
      onGenerateRoute: _approuter.onGeneratedRoute,
    );
  }
}
