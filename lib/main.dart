import 'package:flutter/material.dart';
import 'package:flutter_widgets/Routes.dart';
import 'package:flutter_widgets/presention/Screens/charactersScreen.dart';

void main() {
  runApp(BreakingBadAPItest(
    appRouter: APPRouter(),
  ));
}

class BreakingBadAPItest extends StatelessWidget {
  final APPRouter appRouter;
  const BreakingBadAPItest({Key? key, required this.appRouter})
      : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: charactersScreen(),
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
