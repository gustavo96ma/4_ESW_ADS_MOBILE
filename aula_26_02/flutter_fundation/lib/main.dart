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
          title: Text(
            'Lista de afazeres',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 400,
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
            SizedBox(
              height: 180,
              child: Column(
                spacing: 20,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          width: 320,
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
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          width: 320,
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
                      ),
                    ],
                  ),
                  TextButton(
                    style: ButtonStyle(
                      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.elliptical(10, 10)))),
                      backgroundColor: WidgetStatePropertyAll(Colors.blue),
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
                  )
                ],
              ),
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
