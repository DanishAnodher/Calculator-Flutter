import 'package:calculator/controllers/theme_provider.dart';
import 'package:calculator/pages/home_page.dart';
import 'package:calculator/themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      builder: (context, child) {
        final themeProvider = Provider.of<ThemeProvider>(context);
        return MaterialApp(
          title: 'Calculator',
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode,
          theme: CustomThemes.lightTheme,
          darkTheme: CustomThemes.darkTheme,
          home: const HomePage(),
        );
      },
    );
  }
}
