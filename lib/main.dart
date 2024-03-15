import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController valorGasolina = TextEditingController();
  TextEditingController valorAlcool = TextEditingController();
  double resultado = 0;
  String abastecer = '';

 

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          children: [
            TextField(
              controller: valorGasolina,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Digite o valor da gasolina: ',
                fillColor: Colors.white70,
                filled: true
              ),
            ),
            TextField(
              controller: valorAlcool,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Digite o valor do alcool: ',
                fillColor: Colors.white70,
                filled: true
              ),
            ),
            ElevatedButton(
              onPressed: (){
                setState(() {
                   valorAlcool.text;
                   valorGasolina.text;
                  resultado = (int.parse(valorAlcool.text) / int.parse(valorGasolina.text) * 100);
                });
                int valorGConvert = int.parse(valorGasolina.text);
                int valorAConvert = int.parse(valorAlcool.text);
                if(resultado >= 70){
                  abastecer = 'Abasteça com alcool';
                } else {
                  abastecer = 'Abasteça com gasolina';
                }
              },
              child: Text('Calcular'),
            ),
            Text(resultado.toString() + ' ' + abastecer)
          ],
        ),
      ),
      
    );
  }
}
