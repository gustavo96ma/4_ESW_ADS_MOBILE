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
  TextEditingController controladorTitulo = TextEditingController();
  TextEditingController controladorSubtitulo = TextEditingController();
  List<Tarefa> listaAfazeres = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Lista de afazeres',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) {
            double maxWidth =
                constraints.maxWidth > 800 ? 800 : constraints.maxWidth;
            return Center(
              child: Container(
                width: maxWidth,
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: listaAfazeres.length,
                        itemBuilder: (context, index) {
                          return CheckboxListTile(
                            activeColor: Colors.blue,
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
                    ),
                    Container(
                      height: 180,
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        spacing: 20,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: controladorTitulo,
                                  cursorColor: Colors.black,
                                  cursorErrorColor: Colors.red,
                                  decoration: InputDecoration(
                                    label: Text(
                                      'Nome da tarefa',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(style: BorderStyle.solid),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          style: BorderStyle.solid,
                                          color: Colors.blue),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: TextField(
                                  controller: controladorSubtitulo,
                                  cursorColor: Colors.black,
                                  cursorErrorColor: Colors.red,
                                  decoration: InputDecoration(
                                    label: Text(
                                      'Descrição da tarefa',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(style: BorderStyle.solid),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          style: BorderStyle.solid,
                                          color: Colors.blue),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 300,
                            height: 50,
                            child: TextButton(
                              style: ButtonStyle(
                                shape: WidgetStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.elliptical(10, 10)))),
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.blue),
                                fixedSize: WidgetStatePropertyAll(
                                  Size(300, 50),
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
                                        concluido: false),
                                  );

                                  controladorTitulo.clear();
                                  controladorSubtitulo.clear();
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 10,
                                children: [
                                  Text(
                                    'Adicionar Tarefa',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        letterSpacing: 1),
                                  ),
                                  Icon(
                                    size: 22,
                                    Icons.send,
                                    color: Colors.white,
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
