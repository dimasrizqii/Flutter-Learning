import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const CounterPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int counter = 0;

  void _decrementCounter() {
    setState(() {
      if (counter > 0) {
        counter--;
      }
    });
  }

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Intro Flutter - Counter Page'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: _decrementCounter,
              child: const Icon(Icons.remove),
            ),
            const SizedBox(width: 20),
            Text(
              'Nilai Counter: $counter',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(width: 20),
            InkWell(
              onTap: _incrementCounter,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

// ANALISIS TERHADAP SETSTATE
// setState() digunakan untuk memberi tahu Flutter bahwa UI dapat menampilkan data terbaru di layar

// APA KEGUNAAN STATELESSWIDGET?
// - Untuk UI statis yang tidak berubah setelah pertama kali dibangun

// APA KEGUNAAN STATEFULWIDGET?
// - Untuk UI dinamis yang dapat berubah sesuai dengan data dan dibantu dengan adanya setState()
