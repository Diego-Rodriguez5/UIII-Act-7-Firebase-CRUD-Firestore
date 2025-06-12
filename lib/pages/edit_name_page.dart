import 'package:flutter/material.dart';
import 'package:myapp/services/firebase_services.dart';

class EditNamePage extends StatefulWidget {
  const EditNamePage({super.key});

  @override
  State<EditNamePage> createState() => _EditNamePageState();
}

class _EditNamePageState extends State<EditNamePage> {
  TextEditingController nameController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context)!.settings.arguments as Map;
    nameController.text = args['name'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Nombre'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 105, 172, 240),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: 'Ingrese la modificación',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                await updatePeople(args['uid'], nameController.text).then((_) {
                  Navigator.pop(context);
                });
              },
              child: const Text("Actualizar"),
            ),
          ],
        ),
      ),
    );
  }
}