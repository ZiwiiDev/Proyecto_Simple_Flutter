import 'package:flutter/material.dart';
import 'random_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) :  super(key : key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Flutter',
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),   // Para cambiar el tema a rojo
        //useMaterial3: true,

        /* LO MISMO QUE ARRIBA */
        primarySwatch: Colors.red,      // Para cambiar el tema a rojo
      ),
        //Se llama al método RandomWords();
      home: const RandomWords());
  }
}
