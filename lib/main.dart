import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CalculadoraPage(),
    );
  }
}

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  double _numero1 = 0;
  double _numero2 = 0;
  double _resultado = 0;

  String _operacao = '+';

  void _calcular() {
    setState(() {
      if (_operacao == '+') {
        _resultado = _numero1 + _numero2;
      } else if (_operacao == '-') {
        _resultado = _numero1 - _numero2;
      } else if (_operacao == '*') {
        _resultado = _numero1 * _numero2;
      } else if (_operacao == '/') {
        if (_numero2 != 0) {
          _resultado = _numero1 / _numero2;
        } else {
          _resultado = 0;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Primeiro número',
                border: OutlineInputBorder(),
              ),
              onChanged: (valor) {
                _numero1 = double.tryParse(valor) ?? 0;
              },
            ),

            const SizedBox(height: 15),

            TextField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Segundo número',
                border: OutlineInputBorder(),
              ),
              onChanged: (valor) {
                _numero2 = double.tryParse(valor) ?? 0;
              },
            ),

            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _operacao = '+';
                  },
                  child: const Text('+'),
                ),

                ElevatedButton(
                  onPressed: () {
                    _operacao = '-';
                  },
                  child: const Text('-'),
                ),

                ElevatedButton(
                  onPressed: () {
                    _operacao = '*';
                  },
                  child: const Text('*'),
                ),

                ElevatedButton(
                  onPressed: () {
                    _operacao = '/';
                  },
                  child: const Text('/'),
                ),
              ],
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: _calcular,
              child: const Text('Calcular'),
            ),

            const SizedBox(height: 30),

            Text(
              'Resultado: $_resultado',
              style: const TextStyle(
                fontSize: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}