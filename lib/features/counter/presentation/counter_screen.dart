import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../counter_controller.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = context.watch<CounterController>();

    // Decide colors based on count
    Color bgColor;
    Color borderColor;
    Color textColor;

    if (counter.count > 0) {
      bgColor = Colors.yellow[100]!;
      borderColor = Colors.yellow;
      textColor = Colors.yellow[800]!;
    } else if (counter.count == 0) {
      bgColor = Colors.green[100]!;
      borderColor = Colors.green;
      textColor = Colors.green[800]!;
    } else {
      bgColor = Colors.red[100]!;
      borderColor = Colors.red;
      textColor = Colors.red[800]!;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Game"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: borderColor, width: 2),
            ),
            child: Column(
              children: [
                const Text(
                  "Current Count",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 400),
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                  ),
                  child: Text("${counter.count}"),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          AnimatedOpacity(
            opacity: counter.count < 0 ? 1 : 0,
            duration: const Duration(milliseconds: 300),
            child: const Text(
              "Negative territory!",
              style: TextStyle(color: Colors.red, fontSize: 18),
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                heroTag: "dec",
                onPressed: counter.decrement,
                backgroundColor: Colors.red,
                child: const Icon(Icons.remove, size: 30),
              ),
              const SizedBox(width: 30),
              FloatingActionButton(
                heroTag: "inc",
                onPressed: counter.increment,
                backgroundColor: Colors.green,
                child: const Icon(Icons.add, size: 30),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: counter.reset,
            icon: const Icon(Icons.refresh, color: Colors.white),
            label: const Text("Reset", style: TextStyle(color: Colors.white)),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
