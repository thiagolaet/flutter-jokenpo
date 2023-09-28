import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String> options = ["pedra", "papel", "tesoura"];
  String imageApp = "default";
  String result = "Escolha uma opção abaixo";


  void _play (String option) {
    int index = Random().nextInt(options.length);
    imageApp = options[index];
    print("teste");
    setState (() {
      if (
        (option == "pedra" && imageApp == "tesoura") ||
        (option == "tesoura" && imageApp == "papel") ||
        (option == "papel" && imageApp == "pedra")
      ) {
        result = "Você ganhou!";
      } else if (
        (imageApp == "pedra" && option == "tesoura") ||
        (imageApp == "tesoura" && option == "papel") ||
        (imageApp == "papel" && option == "pedra")
      ) {
        result = "Você perdeu!";
      } else {
        result = "Empate!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("JokenPo")),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(bottom: 100),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Escolha do App",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                )
              ),
              Image.asset("images/$imageApp.png", height: 150,),
              Text(
                result,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => _play("pedra"),
                    child: Image.asset("images/pedra.png", height: 80,),
                  ),
                  GestureDetector(
                    onTap: () => _play("papel"),
                    child: Image.asset("images/papel.png", height: 80,),
                  ),
                  GestureDetector(
                    onTap: () => _play("tesoura"),
                    child: Image.asset("images/tesoura.png", height: 80,),
                  ),
                ],
              )
            ],
          )
        )
      ),
    );
  }
}