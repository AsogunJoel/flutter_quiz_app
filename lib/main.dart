import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/pages/pages.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: const Color(0xff8981B3),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff8981B3),
        ),
        textTheme: GoogleFonts.alefTextTheme(
          Theme.of(context).textTheme,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              color: Color(0xff8981B3),
              width: 2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ).merge(
            ButtonStyle(
              elevation: MaterialStateProperty.all(0),
            ),
          ),
        ),
      ),
      home: const NavigationPages(),
    );
  }
}
