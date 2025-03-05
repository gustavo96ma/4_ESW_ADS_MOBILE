import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFa4bc98),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'https://unicv.edu.br/wp-content/uploads/2020/12/logo-verde-280X100.png',
                scale: 1,
              ),
              Card(
                color: Color(0xFFf4f6ec),
                margin: EdgeInsets.all(50),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    spacing: 16,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          label: Text('Email'),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          focusedBorder: OutlineInputBorder(),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          label: Text('Senha'),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          focusedBorder: OutlineInputBorder(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton.icon(
                            style: ButtonStyle(),
                            onPressed: () {},
                            label: Text(
                              'Cadastrar',
                              style: TextStyle(
                                color: Color(0xFF50713c),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            label: Text(
                              'Entrar',
                              style: TextStyle(
                                color: Color(0xFF50713c),
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            icon: Icon(
                              Icons.login,
                              color: Color(0xFF50713c),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
