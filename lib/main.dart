import 'package:calculator/button.dart';
import 'package:flutter/material.dart';

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
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(),
          ),
          Expanded(
            flex: 3,
            child: Container(
              child: GridView.builder(
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (BuildContext context, int i) {
                  if (i == 0) {
                    return Button(
                      buttonText: buttons[i],
                      color: Colors.green[600],
                      textColor: Colors.white,
                    );
                  } else if (i == 1) {
                    return Button(
                      buttonText: buttons[i],
                      color: Colors.red[600],
                      textColor: Colors.white,
                    );
                  } else {
                    return Button(
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
}
