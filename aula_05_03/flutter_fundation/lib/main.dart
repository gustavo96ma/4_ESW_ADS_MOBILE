import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  TextEditingController controladorTitulo = TextEditingController();
  TextEditingController controladorSubtitulo = TextEditingController();
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
          title: const Text(
            'Lista de afazeres',
            style: TextStyle(color: Colors.white),
          ),
        ),
        // LayoutBuilder para adaptar conforme o espaço disponível
        body: LayoutBuilder(
          builder: (context, constraints) {
            // Define uma largura máxima para manter a consistência (ex.: 800)
            double maxWidth = constraints.maxWidth > 800 ? 800 : constraints.maxWidth;
            return Center(
              child: Container(
                width: maxWidth,
                child: Column(
                  children: [
                    // O ListView ocupa o espaço restante
                    Expanded(
                      child: ListView.builder(
                        itemCount: listaAfazeres.length,
                        itemBuilder: (context, index) {
                          return CheckboxListTile(
                            activeColor: Colors.blue,
                            onChanged: (newValue) {
                              setState(() {
                                listaAfazeres[index].concluido = newValue ?? false;
                              });
                            },
                            value: listaAfazeres[index].concluido,
                            title: Text(listaAfazeres[index].nome),
                            subtitle: Text(listaAfazeres[index].descricao),
                          );
                        },
                      ),
                    ),
                    // Área de entrada com altura fixa
                    Container(
                      height: 180,
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: controladorTitulo,
                                  cursorColor: Colors.black,
                                  decoration: const InputDecoration(
                                    labelText: 'Nome da tarefa',
                                    labelStyle: TextStyle(color: Colors.black),
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.blue),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  controller: controladorSubtitulo,
                                  cursorColor: Colors.black,
                                  decoration: const InputDecoration(
                                    labelText: 'Descrição da tarefa',
                                    labelStyle: TextStyle(color: Colors.black),
                                    border: OutlineInputBorder(),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.blue),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: 300,
                            height: 50,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              onPressed: () {
                                if (controladorTitulo.text.isEmpty ||
                                    controladorSubtitulo.text.isEmpty) {
                                  return;
                                }

                                setState(() {
                                  listaAfazeres.add(
                                    Tarefa(
                                      nome: controladorTitulo.text,
                                      descricao: controladorSubtitulo.text,
                                      concluido: false,
                                    ),
                                  );
                                  controladorTitulo.clear();
                                  controladorSubtitulo.clear();
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Adicionar Tarefa',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Icon(
                                    Icons.send,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
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
