import 'package:flutter/material.dart';

class caltest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CalculatorHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculatorHome extends StatefulWidget {
  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  // State Variables (প্রয়োজনীয় ভেরিয়েবল গুলো)
  String displayText = '0';
  String previousValue = '';
  String currentValue = '';
  String operator = '';
  bool isResultShown = false;

  // Calculator Logic Functions (ক্যালকুলেটর লজিক)
  void onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        // Clear All
        _clearAll();
      } else if (buttonText == '⌫') {
        // Backspace
        _backspace();
      } else if (buttonText == '=') {
        // Calculate Result
        _calculateResult();
      } else if (['+', '-', '×', '÷'].contains(buttonText)) {
        // Operator pressed
        _operatorPressed(buttonText);
      } else {
        // Number or decimal pressed
        _numberPressed(buttonText);
      }
    });
  }

  void _clearAll() {
    displayText = '0';
    previousValue = '';
    currentValue = '';
    operator = '';
    isResultShown = false;
  }

  void _backspace() {
    if (displayText.length > 1) {
      displayText = displayText.substring(0, displayText.length - 1);
      currentValue = displayText;
    } else {
      displayText = '0';
      currentValue = '';
    }
  }

  void _numberPressed(String number) {
    if (isResultShown) {
      displayText = '';
      isResultShown = false;
    }

    if (displayText == '0' && number != '.') {
      displayText = number;
    } else if (number == '.' && displayText.contains('.')) {
      return; // Decimal already exists
    } else {
      displayText += number;
    }
    currentValue = displayText;
  }

  void _operatorPressed(String op) {
    if (currentValue.isNotEmpty && previousValue.isNotEmpty && operator.isNotEmpty) {
      _calculateResult();
    }

    previousValue = currentValue.isEmpty ? displayText : currentValue;
    operator = op;
    currentValue = '';
    isResultShown = false;
  }

  void _calculateResult() {
    if (previousValue.isEmpty || currentValue.isEmpty || operator.isEmpty) {
      return;
    }

    double prev = double.tryParse(previousValue) ?? 0;
    double current = double.tryParse(currentValue) ?? 0;
    double result = 0;

    switch (operator) {
      case '+':
        result = prev + current;
        break;
      case '-':
        result = prev - current;
        break;
      case '×':
        result = prev * current;
        break;
      case '÷':
        if (current != 0) {
          result = prev / current;
        } else {
          displayText = 'Error';
          return;
        }
        break;
    }

    // Format result
    if (result == result.toInt()) {
      displayText = result.toInt().toString();
    } else {
      displayText = result.toStringAsFixed(2);
    }

    previousValue = displayText;
    currentValue = '';
    operator = '';
    isResultShown = true;
  }

  // UI Builder Functions (UI তৈরির ফাংশন)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Calculator',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[900],
        elevation: 0,
      ),
      body: Column(
        children: [
          // Display Area (ডিসপ্লে অংশ)
          _buildDisplay(),

          // Button Area (বাটন অংশ)
          _buildButtonPanel(),
        ],
      ),
    );
  }

  Widget _buildDisplay() {
    return SingleChildScrollView(
      child: Expanded(
        flex: 2,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              // Previous calculation (আগের হিসাব)
              if (previousValue.isNotEmpty && operator.isNotEmpty)
                Text(
                  '$previousValue $operator',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 24,
                  ),
                ),
              SizedBox(height: 10),
              // Current display (বর্তমান ডিসপ্লে)
              Text(
                displayText,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48,
                  fontWeight: FontWeight.w300,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtonPanel() {
    return Expanded(
      flex: 3,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Row 1: C, ⌫, ÷
            _buildButtonRow(['C', '⌫', '', '÷']),

            // Row 2: 7, 8, 9, ×
            _buildButtonRow(['7', '8', '9', '×']),

            // Row 3: 4, 5, 6, -
            _buildButtonRow(['4', '5', '6', '-']),

            // Row 4: 1, 2, 3, +
            _buildButtonRow(['1', '2', '3', '+']),

            // Row 5: 0, ., =
            _buildLastRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonRow(List<String> buttons) {
    return Expanded(
      child: Row(
        children: buttons.map((buttonText) {
          if (buttonText.isEmpty) {
            return Expanded(child: SizedBox()); // Empty space
          }
          return _buildButton(buttonText);
        }).toList(),
      ),
    );
  }

  Widget _buildLastRow() {
    return Expanded(
      child: Row(
        children: [
          // 0 button (double width)
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.all(4),
              child: ElevatedButton(
                onPressed: () => onButtonPressed('0'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  elevation: 2,
                ),
                child: Text(
                  '0',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          // . button
          _buildButton('.'),
          // = button
          _buildButton('=', isOperator: true, isEquals: true),
        ],
      ),
    );
  }

  Widget _buildButton(String buttonText, {bool isOperator = false, bool isEquals = false}) {
    Color backgroundColor;
    Color textColor = Colors.white;

    if (buttonText == 'C' || buttonText == '⌫') {
      backgroundColor = Colors.red[600]!;
    } else if (isEquals) {
      backgroundColor = Colors.orange[600]!;
    } else if (isOperator || ['+', '-', '×', '÷'].contains(buttonText)) {
      backgroundColor = Colors.orange[600]!;
    } else {
      backgroundColor = Colors.grey[800]!;
    }

    return Expanded(
      child: Container(
        margin: EdgeInsets.all(4),
        child: ElevatedButton(
          onPressed: () => onButtonPressed(buttonText),
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            elevation: 2,
          ),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 24,
              color: textColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}