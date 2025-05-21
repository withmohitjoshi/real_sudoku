import 'package:flutter/material.dart';
import 'package:real_sudoku/pages/board.dart';
import 'package:real_sudoku/pages/root_page.dart';
import 'package:real_sudoku/pages/signin_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sudoku',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (_) => const RootPage(),
        '/signin': (_) => const SigninPage(),
        '/board': (_) => const Board(),
      },
    );
  }
}
