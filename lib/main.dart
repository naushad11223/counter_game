import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/counter/counter_controller.dart';
import 'features/counter/presentation/counter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterController(),
      child: Consumer<CounterController>(
        builder: (context, counter, _) {
          return MaterialApp(
            title: 'Counter Game',
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light().copyWith(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            darkTheme: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple,
                brightness: Brightness.dark,
              ),
            ),
            themeMode: counter.themeMode,
            home: const CounterScreen(),
          );
        },
      ),
    );
  }
}
