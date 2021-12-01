import 'package:atvd_pratica_15/main.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: PrimeiraRota(),
      ),
    );

class PrimeiraRota extends StatefulWidget {
  PrimeiraRotaState createState() {
    return PrimeiraRotaState();
  }
}

class PrimeiraRotaState extends State<PrimeiraRota> {
  String mensagem = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Primeira Rota'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              '$mensagem',
              style: TextStyle(
                fontSize: 40,
                color: Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            ElevatedButton(
              child: Text('Ir para a Segunda Rota'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SegundaRota()),
                ).then((resposta) {
                  setState(() {
                    mensagem = resposta;
                  });
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SegundaRota extends StatelessWidget {
  Adicao adicao = Adicao();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Segunda Rota"),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: adicao.num01Controller,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => adicao.num01Controller.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'informe o primeiro número',
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: TextField(
              controller: adicao.num02Controller,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () => adicao.num02Controller.clear(),
                  icon: Icon(Icons.clear),
                ),
                border: OutlineInputBorder(),
                labelText: 'informe o segundo número',
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context, adicao.somar());
            },
            child: Text('Voltar para a Primeira Rota'),
          ),
        ],
      ),
    );
  }
}
