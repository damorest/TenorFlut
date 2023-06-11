import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Tenor картинки'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.title),
      ),
      body:  Padding(
         padding: EdgeInsets.all(16.0),
         child: Column(
           children: [
             Expanded(
              child: TextField(
                enabled: true,
                decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Пошук картинок",
               ),
                  onChanged: (text) {
                    print("onChanged");
                    print("Введенный текст: $text");
                  },
             ),
        ),
               const SizedBox(
                 height: 70,
                 child: Text(
                     'Не знайдено жодної картинки',
                    textAlign: TextAlign.center,
                 ),
               ),
             ],
         ),
      ),
    );
  }
}
