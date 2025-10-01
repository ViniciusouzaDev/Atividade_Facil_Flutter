import 'package:flutter/material.dart';

void main() {
  runApp(const MinhaPrimeiraApp());
}

class MinhaPrimeiraApp extends StatelessWidget {
  const MinhaPrimeiraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Minha Primeira App Flutter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TelaPrincipal(),
    );
  }
}

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  Color _corFundo = Colors.lightBlue[100]!;
  int _indiceCor = 0;
  
  final List<Color> _cores = [
    Colors.lightBlue[100]!,
    Colors.lightGreen[100]!,
    Colors.pink[100]!,
    Colors.orange[100]!,
    Colors.purple[100]!,
    Colors.red[100]!,
    Colors.yellow[100]!,
    Colors.cyan[100]!,
  ];

  void _mudarCor() {
    setState(() {
      _indiceCor = (_indiceCor + 1) % _cores.length;
      _corFundo = _cores[_indiceCor];
    });
    
    // Mostrar mensagem "Olá Flutter!"
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Olá Flutter!'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _corFundo,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Título em destaque
            const Text(
              'Minha Primeira App Flutter',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            
            // Nome em destaque
            const Text(
              'Vinicius Souza',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 50),
            
            // Botão que muda a cor
            ElevatedButton(
              onPressed: _mudarCor,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                textStyle: const TextStyle(fontSize: 18),
              ),
              child: const Text('Mudar Cor!'),
            ),
          ],
        ),
      ),
    );
  }
}
