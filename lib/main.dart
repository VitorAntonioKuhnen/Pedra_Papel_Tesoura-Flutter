import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List jogadas = [
    'pedra',
    'papel',
    'tesoura'
  ];
  var _resultado = "";
  var _imagemComputador = AssetImage("assets/images/vazio.png");

  void geraJogada(String jogadaUser) {
    var jogadaMaquina = jogadas[Random().nextInt(jogadas.length)];
    setState(() {
      _imagemComputador = AssetImage("assets/images/" + jogadaMaquina + ".png");
      if (jogadaUser == jogadaMaquina) {
        _resultado = "Empate!";
      } else if ((jogadaUser == "pedra" && jogadaMaquina == "tesoura") ||
          (jogadaUser == "papel" && jogadaMaquina == "pedra") ||
          (jogadaUser == "tesoura" && jogadaMaquina == "papel")) {
        _resultado = "Você ganhou!";
      } else {
        _resultado = "O computador ganhou!";
      }
    }); 

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedra, Papel, Tesoura...'),
        backgroundColor: Color.fromARGB(255, 101, 108, 145),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Escolha uma opção'),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: (){
                        geraJogada('pedra');
                        print("Pedra");
                      },
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/pedra.png'),
                        radius: 60,
                        backgroundColor: Color.fromARGB(255, 189, 189, 189),
                      )),
                  GestureDetector(
                      onTap: () {
                        geraJogada('papel');
                        print("Papel");
                      },
                      child: CircleAvatar(
                        backgroundImage: AssetImage('assets/images/papel.png'),
                        radius: 60,
                        backgroundColor: Color.fromARGB(255, 189, 189, 189),
                      )),
                  GestureDetector(
                      onTap: () {
                        geraJogada('tesoura');
                        print("Tesoura");
                      },
                      child: CircleAvatar(
                        backgroundImage:
                            AssetImage('assets/images/tesoura.png'),
                        radius: 60,
                        backgroundColor: Color.fromARGB(255, 189, 189, 189),
                      ))
                ],
              ),
            ),
            Text('Jogada do computador'),
            CircleAvatar(backgroundImage: _imagemComputador, radius: 60),
            Text('Resultado'),
            Text(_resultado),

          ],
        ),
      ),
    );
  }
}
