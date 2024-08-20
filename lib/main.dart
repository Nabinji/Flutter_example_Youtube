import 'package:flutter/material.dart';
import 'Flutter UI/Space App UI/View/space_splash_screen.dart';


void main() {
  runApp(const MyApp());
}

// This widget is the root of your application.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SpaceSclashScreen(),
    );
  }
}





// for provider only
// Widget build(BuildContext context) {
//   return MultiProvider(
//     providers: [
//       ChangeNotifierProvider<JokeProviderServices>(
//         create: (_) => JokeProviderServices(),
//       ),
//     ],
//     child: const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: JokeScreen(),
//     ),
//   );
// }
