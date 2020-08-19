import 'package:calculator/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var userQuestion = '';
  var userAnswer = '';

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    '',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      userQuestion,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    alignment: Alignment.centerRight,
                    child: Text(
                      userAnswer,
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int i) {
                  //Clear Button
                  if (i == 0) {
                    return Button(
                      buttonTapped: () {
                        setState(() {
                          userQuestion = '';
                        });
                      },
                      buttonText: buttons[i],
                      color: Colors.green[600],
                      textColor: Colors.white,
                    );
                    // Delete Button
                  } else if (i == 1) {
                    return Button(
                      buttonTapped: () {
                        setState(() {
                          userQuestion = userQuestion.substring(
                              0, userQuestion.length - 1);
                        });
                      },
                      buttonText: buttons[i],
                      color: Colors.red[600],
                      textColor: Colors.white,
                    );
                    // Equal Button
                  } else if (i == buttons.length - 1) {
                    return Button(
                      buttonTapped: () {
                        setState(() {
                          solve();
                        });
                      },
                      buttonText: buttons[i],
                      color: Colors.grey[850],
                      textColor: Colors.white,
                    );
                    // Rest of the Buttons
                  } else {
                    return Button(
                        buttonTapped: () {
                          setState(() {
                            userQuestion += buttons[i];
                          });
                        },
                        buttonText: buttons[i],
                        color: isOperator(buttons[i])
                            ? Colors.grey[850]
                            : Colors.white70,
                        textColor: isOperator(buttons[i])
                            ? Colors.white
                            : Colors.grey[850]);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == '*' || x == '-' || x == '=') {
      return true;
    }
    if (x == '+') {
      return true;
    }
    return false;
  }

  void solve() {
    String finalQuestion = userQuestion;
    Expression exp = Parser().parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
  }
}
