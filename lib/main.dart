import 'package:flutter/material.dart';
import 'package:flutter_example/Joke%20Generator/View/joke_page.dart';
import 'package:provider/provider.dart';

import 'Joke Generator/Provider Services/provider_services.dart';

void main() {
  runApp(const MyApp());
}

// This widget is the root of your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
        ChangeNotifierProvider<JokeController>(
          create: (_) => JokeController(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: JokeScreen(),
      ),
    );
  }
}
