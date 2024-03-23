import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// Método que extiende de StatefulWidget para tener un estado
class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  // Creamos el estado y le pasamos el método _RandomWordsState
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

// Método que contiene el estado
class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];      // El estado

  // Si modifico el tamaño del texto que se supone que es estático no cambia porque cambiaría
  // el estado de la app y podría dar problemas
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {    //
    //final wordPair = WordPair.random();

    // "asPascalCase" es la primera mayúscula y luego minúscula "GreatSky"
    //return Text(wordPair.asPascalCase);  // quitamos el "const" para usar textos dinámicos

    return Scaffold(
      appBar: AppBar(
        title: const Text("Primera App con Flutter de Ziwi"),
        centerTitle: true,
      ),
      body: _buildSuggestions(),    // Llama a al método _buildSuggestions();
    );
  }

  // Método que devuelve la lista
  Widget _buildSuggestions() {
    // Devolvemos la lista
    return ListView.builder(      // El builder se ejecuta sólo cuando es necesario
      padding: const EdgeInsets.all(16),

      // Ver el siguiente elemento que necesita la lista
      itemBuilder: (context, i) {   // Si llega al final y necesita más resultados ejecuta esto
        if (i.isOdd) return const Divider(); // Si el número es impar devuelve el separador

        // Si es par crea una nueva palabra
        final index = i ~/ 2;  // Para poder tener 1,2,3,4,5... aun habiendo saltado los impares
        // Este índice es mayor que las sugerencias que tenemos en el estado
        if (index >= _suggestions.length) {
          // Añadimos 10 nuevas palabras al final de cada sugerencia
          _suggestions.addAll(generateWordPairs().take(10));
        }

        // Construimos una nueva fila y le pasa un par de palabras de la lista de sugerencias
        return _buildRow(_suggestions[index]);
      },
    );
  }

  // Método que construye las palabras
  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,    // Nombre de la palabra. Si pongo "aaa" salen todos con ese nombre
        style: _biggerFont,   // El estilo que hemos creado arriba de tamaño 18
      ),
    );
  }
}
