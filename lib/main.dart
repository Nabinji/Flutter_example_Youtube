import 'package:flutter/material.dart';
import 'package:flutter_example/Flutter%20UI/Pet%20App%20UI/pages/onboard.dart';


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
      home: PetsOnBoardingScreen(),
    );
  }
}







      // theme: ThemeData(
      //   appBarTheme: const AppBarTheme(
      //     backgroundColor: kbackgroundColor,
      //   ),
      //   scaffoldBackgroundColor: kbackgroundColor,
      //   colorScheme: ColorScheme.fromSeed(seedColor: kprimaryColor),
      //   useMaterial3: true,
      // ),
      
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
