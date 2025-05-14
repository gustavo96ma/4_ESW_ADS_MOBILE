import 'package:ensala_mais/utils/project_colors.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class Modal extends StatefulWidget {
  const Modal({super.key});

  @override
  State<Modal> createState() => _ModalState();
}

class _ModalState extends State<Modal> {
  bool isFormVisible = false;
  bool insertSuccess = false;
  bool isLoading = false;
  bool emptySelect = false;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController areaController = TextEditingController();

// TODO: mudar a cor dos inputs
// TODO: validar campos
// TODO: Quando o form está visível não da para voltar
// TODO: na listview o mouse tem que ficar com onHover de click
// TODO: Componentizar essa tela pois está muito bagunçado!!

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Supabase.instance.client.from('professor').select(),
        builder: (context, snapshot) {
          isLoading = false;
          emptySelect = false;

          if (snapshot.connectionState == ConnectionState.waiting) {
            isLoading = true;
          }

          if (snapshot.data == null) {
            emptySelect = true;
          }

          return Dialog(
            child: SizedBox(
              width: 400,
              height: (isFormVisible || !emptySelect) ? 360 : 160,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 20, 40, 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      spacing: 12,
                      children: [
                        if (isFormVisible)
                          Text(
                            'Cadastro de professor',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                        if (!isFormVisible)
                          Expanded(
                              child: Column(
                            spacing: 12,
                            children: [
                              Row(
                                spacing: 12,
                                children: [
                                  Expanded(
                                    child: TextField(
                                      decoration: InputDecoration(
                                        label: Text('Pesquisar'),
                                        enabledBorder: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(),
                                        suffixIcon: Icon(Icons.search),
                                      ),
                                    ),
                                  ),
                                  if (!isFormVisible)
                                    IconButton(
                                        color: Colors.white,
                                        style: ButtonStyle(
                                            backgroundColor:
                                                WidgetStatePropertyAll(
                                                    ProjectColors().mainGreen)),
                                        onPressed: () {
                                          setState(() {
                                            isFormVisible = true;
                                          });
                                        },
                                        icon: Icon(Icons.add)),
                                ],
                              ),
                              if (isLoading)
                                Center(child: CircularProgressIndicator()),
                              if (emptySelect && !isLoading)
                                Text('Não há dados cadastrados'),
                              if (!emptySelect && !isLoading)
                                SizedBox(
                                  height: 250,
                                  child: ListView.builder(
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        
                                        onTap: () {
                                          setState(() {
                                            isFormVisible = true;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color: Colors.grey,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              vertical: 4, horizontal: 12),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    snapshot.data?[index]
                                                        ['name'],
                                                    style: TextStyle(
                                                        color: Colors.black),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(8, 0, 0, 0),
                                                    child: Text(
                                                      snapshot.data?[index]
                                                          ['area'],
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xFF6F6F6F)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Icon(
                                                Icons.remove_red_eye_outlined,
                                                size: 20,
                                                color: Color(0xFF6F6F6F),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                    itemCount: snapshot.data!.length,
                                  ),
                                ),
                            ],
                          )),
                      ],
                    ),
                    if (isFormVisible)
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(label: Text('Nome')),
                      ),
                    if (isFormVisible)
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(label: Text('Email')),
                      ),
                    if (isFormVisible)
                      TextField(
                        controller: areaController,
                        decoration: InputDecoration(label: Text('Área')),
                      ),
                    if (isFormVisible)
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Row(
                          spacing: 8,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton.icon(
                              label: Text(
                                'Editar',
                                style: TextStyle(
                                    color: ProjectColors().navbarTextColor),
                              ),
                              onPressed: () {},
                              icon: Icon(Icons.edit_outlined),
                              style: ButtonStyle(
                                iconColor: WidgetStatePropertyAll(
                                    ProjectColors().navbarTextColor),
                                backgroundColor: WidgetStatePropertyAll(
                                    ProjectColors().mainGreen),
                              ),
                            ),
                            TextButton.icon(
                              label: isLoading
                                  ? CircularProgressIndicator()
                                  : Text(
                                      'Salvar',
                                      style: TextStyle(
                                          color:
                                              ProjectColors().navbarTextColor),
                                    ),
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                });
                                try {
                                  await Supabase.instance.client
                                      .from('professor')
                                      .insert({
                                    'name': nameController.text,
                                    'email': emailController.text,
                                    'area': areaController.text
                                  });
                                  setState(() async {
                                    insertSuccess = true;
                                    isFormVisible = false;
                                  });
                                } catch (e) {}
                                setState(() {
                                  isLoading = false;
                                });
                              },
                              icon:
                                  isLoading ? null : Icon(Icons.save_outlined),
                              style: ButtonStyle(
                                iconColor: WidgetStatePropertyAll(
                                    ProjectColors().navbarTextColor),
                                backgroundColor: WidgetStatePropertyAll(
                                    ProjectColors().mainGreen),
                              ),
                            ),
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
