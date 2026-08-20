import 'dart:io';

import 'package:flutter/material.dart';

//Ponto de entrada do aplicativo Flutter
void main() {
  runApp(const MainApp());
}

// App principal que configura MaterialApp
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    //MaterialApp fornece tema e navegação básica para o app
    return const MaterialApp(
      debugShowCheckedModeBanner: false, //remover o selo do DEBUG
      home: const TelaSoma(), // Tela inicial do app
    );
    }
}

//-------Tela Soma -------

// Tela que precisa manter estado (valores dos inputs e resultado)
class TelaSoma extends StatefulWidget{
  const TelaSoma({super.key});

  @override
  State<TelaSoma> createState() => _TelaSomaState();

}

//Estado da telaSoma: é aqui que guardamos os controllers e o resultado
class _TelaSomaState extends State<TelaSoma>{

  //CRIAÇÃO DOS INPUTS
  // TextEditingController perimite ler/alterar o texto dos TextFields
  final TextEditingController numero1Controller = TextEditingController();
  final TextEditingController numero2Controller = TextEditingController();
  final TextEditingController numero3Controller = TextEditingController();

  //Variável que armazena o resultado da soma e que será exibida na tela
  double resultadoTotal = 0;
  double resultadoPontos = 0;
  double resultadoPercentual = 0;

  //Função chamada ao pressionar o botão "somar"
  void total(){

    //Tenta converter o texto para double; se falhar , usa o 0 como padrão
    double n1=double.tryParse(numero1Controller.text) ?? 0;
    double n2=double.tryParse(numero2Controller.text) ?? 0;

    setState((){
      resultadoTotal = n1 + n2;
    });
  }

  void pontos(){

    double n1=double.tryParse(numero1Controller.text) ?? 0;
    double n3=double.tryParse(numero3Controller.text) ?? 0;

    setState((){
      resultadoPontos = n1 * n3;
    });
  }

  void porcentagem(){

    double n1=double.tryParse(numero1Controller.text) ?? 0;
    double n2=double.tryParse(numero2Controller.text) ?? 0;

    setState((){
      resultadoPercentual = ((n1 / (n1 + n2)) * 100);
    });
  }

  void resultados(){
    setState(() {
      total();
      pontos();
      porcentagem();
    });
  }

  

  @override
  Widget build(BuildContext context){

    //Scaffold fornece estrutura visual básica (AppBar, body, etc.)
    return Scaffold(
      appBar: AppBar(
        title: const Text("Campeonanto"),
        backgroundColor: Colors.deepPurple,
      ),


      body: Padding(
        padding: const EdgeInsets.all(20),
        // Column organiza os widgets verticalmente
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Primeiro campo de texto para o número 1

            TextField(
              controller: numero1Controller,
              decoration: const InputDecoration(
                labelText: "Digite o número de vitorias",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number, //Abre teclado numérico
            ),
            const SizedBox(height: 20),

            // Segundo campo de texto para o número 2
            TextField(
              controller: numero2Controller,
              decoration: const InputDecoration(
                labelText: "Digite o número de derrotas",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),

            TextField(
              controller: numero3Controller,
              decoration: const InputDecoration(
                labelText: "Digite o valor dos pontos",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),

            // Botão que dispara a função somar
            ElevatedButton(
              onPressed:  resultados,
              child: const Text("Resultados"),
            ),
            const SizedBox(height: 20),

            // Exibe o resultado atual
            Text(
              "Total de Partidas: $resultadoTotal",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),


            const SizedBox(height: 20),

            // Exibe o resultado atual
            Text(
              "Total de Pontos: $resultadoPontos",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),


            const SizedBox(height: 20),

            // Exibe o resultado atual
            Text(
              "Porcentagem de Vitorias: $resultadoPercentual%",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}