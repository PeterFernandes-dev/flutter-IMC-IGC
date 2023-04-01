import 'package:atividade_imc/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class imc extends StatelessWidget {
  imc({Key? key}) : super(key: key);

  final dropValue = ValueNotifier('');
  final dropOp = ['Homem', 'Mulher'];

  TextEditingController _altcontroller = TextEditingController();
  TextEditingController _pesocontroller = TextEditingController();
  TextEditingController _idadecontroller = TextEditingController();
  TextEditingController _sexocontroller = TextEditingController();

  double alt = 0.0, peso = 0.0, idade = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 57, 56, 56),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 100),
              child: const Icon(
                Icons.person,
                color: Colors.blue,
                size: 250,
              ),
            ),

            //INPUT 1

            Container(
              width: 500,
              margin: const EdgeInsets.only(top: 15, bottom: 25),
              child: TextField(
                controller: _altcontroller,
                keyboardType: const TextInputType.numberWithOptions(
                    decimal: true, signed: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                ],
                decoration: InputDecoration(
                  labelText: 'Altura',
                  labelStyle: const TextStyle(
                    color: Color.fromARGB(255, 0, 211, 253),
                  ),
                  hintText: 'Entre com a altura',
                  hintStyle: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 162, 235, 255)),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 122, 239, 255),
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(16),
                ),
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),

            // INPUT 2

            Container(
              width: 500,
              margin: const EdgeInsets.only(top: 15, bottom: 25),
              child: TextField(
                controller: _pesocontroller,
                keyboardType: const TextInputType.numberWithOptions(
                    decimal: true, signed: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                ],
                decoration: InputDecoration(
                  labelText: 'Peso',
                  labelStyle: const TextStyle(
                    color: Color.fromARGB(255, 0, 211, 253),
                  ),
                  hintText: 'Entre com o peso',
                  hintStyle: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 162, 235, 255)),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 122, 239, 255),
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(16),
                ),
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),

            // INPUT 3

            Container(
              width: 500,
              margin: const EdgeInsets.only(top: 15, bottom: 25),
              child: TextField(
                controller: _idadecontroller,
                keyboardType: const TextInputType.numberWithOptions(
                    decimal: true, signed: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  labelText: 'Idade',
                  labelStyle: const TextStyle(
                    color: Color.fromARGB(255, 0, 211, 253),
                  ),
                  hintText: 'Entre com a idade',
                  hintStyle: const TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 162, 235, 255)),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 122, 239, 255),
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(16),
                ),
                style: const TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),

            // SELECIONAR GENERO

            Container(
              width: 500,
              margin: const EdgeInsets.only(top: 15, bottom: 25),
              child: ValueListenableBuilder(
                valueListenable: dropValue,
                builder: (BuildContext context, dynamic value, Widget? child) {
                  return DropdownButtonFormField(
                    dropdownColor: const Color.fromARGB(255, 57, 56, 56),
                    decoration: InputDecoration(
                      label: const Text('Sexo'),
                      hintText: 'Escolha o sexo',
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      labelStyle: const TextStyle(
                        color: Color.fromARGB(255, 0, 211, 253),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 162, 235, 255),
                          )),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 122, 239, 255),
                        ),
                      ),
                    ),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 122, 239, 255),
                    ),
                    value: (value.isEmpty) ? null : value,
                    onChanged: (escolha) =>
                        dropValue.value = escolha.toString(),
                    items: dropOp
                        .map((op) => DropdownMenuItem(
                              value: op,
                              child: Text(op),
                            ))
                        .toList(),
                  );
                },
              ),
            ),

            // BOTÃO
            Container(
              width: 500,
              height: 50,
              margin: const EdgeInsets.only(top: 15, bottom: 25),
              child: ElevatedButton(
                onPressed: () {
                  valores();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(
                          alt: alt,
                          peso: peso,
                          idade: idade,
                          sexo: dropValue.value,
                        ),
                      ));
                },
                child: const Text(
                  'Resultado',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontSize: 23,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void valores() {
    alt = double.parse(_altcontroller.text);
    peso = double.parse(_pesocontroller.text);
    idade = double.parse(_idadecontroller.text);
  }
}
