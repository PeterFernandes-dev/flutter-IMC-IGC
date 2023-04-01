import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final double alt;
  final double peso;
  final double idade;
  final String sexo;

  const ResultPage({
    Key? key,
    required this.alt,
    required this.peso,
    required this.idade,
    required this.sexo,
  }) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPage();
}

class _ResultPage extends State<ResultPage> {
  late double imc;
  late double igc;

  @override
  void initState() {
    super.initState();
    imc = calcularIMC(widget.alt, widget.peso);
    igc = calcularIGC(widget.alt, widget.peso, widget.idade, widget.sexo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 57, 56, 56),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('IMC e IGC'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100),
              child: const Icon(
                Icons.person_add_alt_1_outlined,
                size: 150,
                color: Colors.blue,
              ),
            ),
            Container(
              width: 350,
              height: 100,
              margin: const EdgeInsets.only(top: 15, bottom: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'IMC: ${imc.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'IGC: ${igc.toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

double calcularIMC(double altura, double peso) {
  return peso / (altura * altura);
}

double calcularIGC(double altura, double peso, double idade, String sexo) {
  if (sexo == 'Homem') {
    return (1.2 * calcularIMC(altura, peso)) + (0.23 * 1) - 5.4;
  } else {
    return (1.2 * calcularIMC(altura, peso)) + (0.23 * 0.8) - 5.4;
  }
}
