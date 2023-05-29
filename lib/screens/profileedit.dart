import 'package:wsafe/services/database.dart';
import 'package:flutter/material.dart';

class ProfileEdit extends StatelessWidget {
  ProfileEdit({super.key});
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameTextEditingController =
      TextEditingController(text: auth.currentUser?.displayName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade100,
      body: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            TextFormField(
              controller: _nameTextEditingController,
              decoration: const InputDecoration(labelText: 'Name'),
              validator: (val) => val!.isEmpty ? 'Enter a name' : null,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor: Colors.blue[800]!.withOpacity(.9)),
                child: const Text("Submit"),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    auth.currentUser
                        ?.updateDisplayName(_nameTextEditingController.text);
                    auth.currentUser?.reload().then((value) {
                      Navigator.pop(context);
                    });
                  }
                })
          ])),
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () => Navigator.pop(context)),
      ),
    );
  }
}
