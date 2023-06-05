import 'package:calculator/widgets/calculator_button.dart';
import 'package:calculator/widgets/change_theme_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String query = "";
  String ans = "";

  List<String> operations = ["\\÷", "\\×", "\\^", "\\+", "\\-"];

  final Color _operationsColor = const Color(0xFF66BFBF);
  final double _operationsFontSize = 30;

  final ScrollController _queryScrollController = ScrollController();

  String tempOperation = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _queryScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: SafeArea(
                child: Container(
                  alignment: Alignment.topCenter,
                  child: const ChangeThemeButton(),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SingleChildScrollView(
                      reverse: true,
                      dragStartBehavior: DragStartBehavior.start,
                      controller: _queryScrollController,
                      scrollDirection: Axis.horizontal,
                      child: Text(
                        query,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    Text(
                      ans,
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.grey,
                        fontFamily: "Akrobat",
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //buttons
            Expanded(
              flex: 2,
              child: Ink(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          CalculatorButton(
                            symbol: "C",
                            color: const Color(0xFFEB455F),
                            fontSize: _operationsFontSize,
                            onPressed: () => onButtonPress("C"),
                          ),
                          CalculatorButton(
                            symbol: "<-",
                            onPressed: () => onButtonPress("<-"),
                          ),
                          CalculatorButton(
                            symbol: "^",
                            onPressed: () => onButtonPress("^"),
                          ),
                          CalculatorButton(
                            symbol: "÷",
                            color: _operationsColor,
                            fontSize: _operationsFontSize,
                            onPressed: () => onButtonPress("÷"),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          CalculatorButton(
                            symbol: "7",
                            onPressed: () => onButtonPress("7"),
                          ),
                          CalculatorButton(
                            symbol: "8",
                            onPressed: () => onButtonPress("8"),
                          ),
                          CalculatorButton(
                            symbol: "9",
                            onPressed: () => onButtonPress("9"),
                          ),
                          CalculatorButton(
                            symbol: "×",
                            color: _operationsColor,
                            fontSize: _operationsFontSize,
                            onPressed: () => onButtonPress("×"),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          CalculatorButton(
                            symbol: "4",
                            onPressed: () => onButtonPress("4"),
                          ),
                          CalculatorButton(
                            symbol: "5",
                            onPressed: () => onButtonPress("5"),
                          ),
                          CalculatorButton(
                            symbol: "6",
                            onPressed: () => onButtonPress("6"),
                          ),
                          CalculatorButton(
                            symbol: "-",
                            color: _operationsColor,
                            fontSize: _operationsFontSize,
                            onPressed: () => onButtonPress("-"),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          CalculatorButton(
                            symbol: "1",
                            onPressed: () => onButtonPress("1"),
                          ),
                          CalculatorButton(
                            symbol: "2",
                            onPressed: () => onButtonPress("2"),
                          ),
                          CalculatorButton(
                            symbol: "3",
                            onPressed: () => onButtonPress("3"),
                          ),
                          CalculatorButton(
                            symbol: "+",
                            color: _operationsColor,
                            fontSize: _operationsFontSize,
                            onPressed: () => onButtonPress("+"),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          CalculatorButton(
                            symbol: "00",
                            onPressed: () => onButtonPress("00"),
                          ),
                          CalculatorButton(
                            symbol: "0",
                            onPressed: () => onButtonPress("0"),
                          ),
                          CalculatorButton(
                            symbol: ".",
                            onPressed: () => onButtonPress("."),
                          ),
                          CalculatorButton(
                            symbol: "=",
                            color: _operationsColor,
                            fontSize: _operationsFontSize,
                            onPressed: () {
                              setState(() {
                                if (ans.toLowerCase() == "infinity" ||
                                    ans.toLowerCase() == "nan") {
                                  query = "";
                                  ans = "";
                                  tempOperation = "";
                                } else {
                                  query = ans;
                                  ans = "";
                                  tempOperation = "ans";
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onButtonPress(symbol) {
    bool isOperation(op) =>
        RegExp(r"(" + operations.join("|") + ")").hasMatch(op);

    if (symbol == "C") {
      setState(() {
        query = "";
        ans = "";
      });
      tempOperation = "";
    } else if (symbol == "<-") {
      if (query.isNotEmpty) {
        setState(() {
          query = query.substring(0, query.length - 1);
        });
        if (query.isEmpty) {
          tempOperation = "";
          return;
        }

        tempOperation = query[query.length - (query.isEmpty ? 0 : 1)];
        !isOperation(tempOperation) ? _calculate() : null;
      }
    } else {
      if (query.isEmpty) {
        if (isOperation(symbol) && symbol != "-") return;
      }

      if (isOperation(tempOperation) && isOperation(symbol)) {
      } else {
        setState(() {
          query += symbol;
        });
      }
      if (!isOperation(symbol)) _calculate();
      tempOperation = symbol;
    }

    _queryScrollController.animateTo(
      _queryScrollController.position.minScrollExtent,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  void _calculate() {
    try {
      Parser p = Parser();
      Expression exp = p.parse(query.replaceAll("×", "*").replaceAll("÷", "/"));

      setState(() {
        ans = exp.evaluate(EvaluationType.REAL, ContextModel()).toString();
      });
    } on Exception catch (e) {}
  }
}
