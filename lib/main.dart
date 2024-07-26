import 'package:flutter/material.dart';
import 'package:nativo_apps/nativo_pos.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Botões Exemplo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final SmartPos smartPos = SmartPos();

  MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Teste'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                await smartPos.doCardPayment();
              },
              child: const Text('Pagar'),
            ),
            const SizedBox(height: 20), // Espaçamento entre os botões
            ElevatedButton(
              onPressed: () async {
                var fileName = await smartPos.orderNoteBuilder(context);

                smartPos.printOrderNote(fileName);
              },
              child: const Text('Imprimir'),
            ),
          ],
        ),
      ),
    );
  }
}
