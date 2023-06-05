import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String symbol;
  final Color? color;
  final double? fontSize;

  final void Function() onPressed;

  const CalculatorButton({
    super.key,
    required this.symbol,
    this.color,
    this.fontSize,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkResponse(
        radius: 25,
        onTap: onPressed,
        splashFactory: InkRipple.splashFactory,
        child: Container(
          alignment: Alignment.center,
          child: Text(
            symbol,
            textAlign: TextAlign.center,
            style: color != null
                ? TextStyle(
                    color: color,
                    fontSize: fontSize ?? 30,
                    fontFamily: "Akrobat",
                    fontWeight: FontWeight.bold,
                  )
                : Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ),
    );
  }
}
