//Practice Task 6.44 — Transform (Rotate/Scale/Skew) Ans Submitted Gmini
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransformDemoBasic extends StatelessWidget {
  const TransformDemoBasic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transform Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Transform.translate(
                  offset: const Offset(-60.0, 0.0),
                  child: Transform.rotate(
                    angle: -pi / 12,
                    child: helpContainerTransfrom("-15 Degree Rotated"),
                  ),
                ),
                helpContainerTransfrom("0 Degree Rotated"),

                Transform.translate(
                  offset: const Offset(60.0, 0.0),
                  child: Transform.rotate(
                    angle: pi / 12,
                    child: helpContainerTransfrom("15 Degree Rotated"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget helpContainerTransfrom(String text) {
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////////
//Practice Task 6.44 — Transform (Rotate/Scale/Skew) Ans Submitted
class ProductTransformPlayground extends StatefulWidget {
  const ProductTransformPlayground({super.key});

  @override
  State<ProductTransformPlayground> createState() =>
      _ProductTransformPlaygroundState();
}

class _ProductTransformPlaygroundState
    extends State<ProductTransformPlayground> {
  double _rotationAngle = 0.0; // Radians for Transform, but UI will show degrees
  double _scaleValue = 1.0;
  bool _isSkewed = false;
  double _skewXValue = 0.2;

  double _degreesToRadians(double degrees) {
    return degrees * (pi / 180);
  }
  double _radiansToDegrees(double radians) {
    return radians * (180 / pi);
  }

  void _resetTransforms() {
    setState(() {
      _rotationAngle = 0.0;
      _scaleValue = 1.0;
      _isSkewed = false;
    });
  }


  @override
  Widget build(BuildContext context) {

    double currentRotationDegrees = _radiansToDegrees(_rotationAngle);

    Matrix4 transformMatrix = Matrix4.identity()
      ..rotateZ(_rotationAngle)
      ..scale(_scaleValue);

    if (_isSkewed) {
      // Apply skew if enabled
      // Skew along the Y-axis based on X-coordinate
      transformMatrix.setEntry(1, 0, _skewXValue);
    }


    return Scaffold(
      appBar: AppBar(title: const Text('Transform Demo')),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Transform(
              alignment: Alignment.center,
              transform: transformMatrix,
              child: ProductContainerTransfrom(),
            ),
            const SizedBox(height: 16.0),
            Card(
              elevation: 5,
              margin: const EdgeInsets.all(10),
              child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Rotation: ${currentRotationDegrees.toStringAsFixed(1)}°"),
                      Text("Scale: ${_scaleValue.toStringAsFixed(2)}x"),
                      Text("Skew: ${_isSkewed ? "ON (X-Factor: $_skewXValue)" : "OFF"}"),


                    ],
                  ),
              ),

            ),
            const SizedBox(height: 16.0),

            // Rotate Slider
            Row(
              children: [
                const Text("Rotate:"),
                Expanded(
                  child: Slider(
                    value: currentRotationDegrees,
                    min: -180.0,
                    max: 180.0,
                    divisions: 360, // For 1-degree increments
                    label: "${currentRotationDegrees.toStringAsFixed(0)}°",
                    onChanged: (double degrees) {
                      setState(() {
                        _rotationAngle = _degreesToRadians(degrees);
                      });
                    },
                  ),
                ),
              ],
            ),

            // Scale Slider
            Row(
              children: [
                const Text("Scale: "),
                Expanded(
                  child: Slider(
                    value: _scaleValue,
                    min: 0.5,
                    max: 1.5,
                    divisions: 20, // 0.05 increments
                    label: _scaleValue.toStringAsFixed(2),
                    onChanged: (double value) {
                      setState(() {
                        _scaleValue = value;
                      });
                    },
                  ),
                ),
              ],
            ),

            // Skew Toggle
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Skew Effect:"),
                Switch(
                  value: _isSkewed,
                  onChanged: (bool value) {
                    setState(() {
                      _isSkewed = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _resetTransforms,
              child: const Text("Reset All Transforms"),
            ),

          ],
        ),
      ),
    );
  }

  Widget ProductContainerTransfrom() {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
              image: NetworkImage(
                "https://images.unsplash.com/photo-1510127034890-ba27508e9f1c?auto=format&fit=crop&w=800&q=60",
              ),
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            const Text(
              "Camera",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            const Text(
              "\$99.99",
              style: TextStyle(fontSize: 18, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
