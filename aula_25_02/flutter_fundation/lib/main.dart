import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<Tarefa> listaAfazeres = [
    Tarefa(
      nome: 'Tarefa 1',
      descricao: 'Descrição da tarefa 1',
      concluido: false,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text('Lista de afazeres'),
        ),
        body: Column(
          children: [
            ListView.builder(
              itemCount: listaAfazeres.length,
              itemBuilder: (context, index) {
                return CheckboxListTile(
                  onChanged: (newValue) {
                    if (newValue == null) {
                      listaAfazeres[index].concluido = false;
                      return;
                    }
                    setState(() {
                      listaAfazeres[index].concluido = newValue;
                    });
                  },
                  value: listaAfazeres[index].concluido,
                  title: Text(listaAfazeres[index].nome),
                  subtitle: Text(listaAfazeres[index].descricao),
                );
              },
            ),
            Row(
              children: [
                TextField(),
                IconButton(onPressed: () {}, icon: Icon(Icons.send)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Tarefa {
  String nome;
  String descricao;
  bool concluido;

  Tarefa({
    required this.nome,
    required this.descricao,
    required this.concluido,
  });
}
