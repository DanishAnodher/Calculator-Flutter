import 'dart:math';

import 'package:calculator/controllers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChangeThemeButton extends StatefulWidget {
  const ChangeThemeButton({super.key});

  @override
  State<ChangeThemeButton> createState() => _ChangeThemeButtonState();
}

class _ChangeThemeButtonState extends State<ChangeThemeButton> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    themeProvider.addListener(() {
      setState(() {
        themeProvider.light;
        themeProvider.dark;
      });
    });

    return Container(
      width: 100.0,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Theme.of(context).primaryColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkResponse(
            radius: 20.0,
            onTap: () {
              final provider =
                  Provider.of<ThemeProvider>(context, listen: false);
              provider.toggleTheme(false);
            },
            child: Icon(
              !themeProvider.isDarkMode
                  ? Icons.wb_sunny
                  : Icons.wb_sunny_outlined,
              color: themeProvider.light,
            ),
          ),
          InkResponse(
            radius: 20.0,
            onTap: () {
              final provider =
                  Provider.of<ThemeProvider>(context, listen: false);
              provider.toggleTheme(true);
            },
            child: Transform.rotate(
              angle: -pi / 5.0,
              child: Icon(
                themeProvider.isDarkMode
                    ? Icons.nightlight
                    : Icons.nightlight_outlined,
                color: themeProvider.dark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
