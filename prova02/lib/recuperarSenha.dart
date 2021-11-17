// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:prova02/login.dart';

class RecuperarSenha extends StatefulWidget {
  const RecuperarSenha({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RecuperarSenhaState();
  }
}
class RecuperarSenhaState extends State<RecuperarSenha> {
  late String email;

  int operation = 1;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();

  Widget buildTextSenha(){
   // ignore: prefer_const_constructors
   return const Text(
      "Recuperar Senha",
      style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: Colors.purple,
      ),
      textAlign: TextAlign.center,
      );
  }

  Widget buildTextEmail(){
   // ignore: prefer_const_constructors
   return const Text(
      "Por favor, informe o seu email que enviaremos um link para o mesmo com as instruções para restauração de sua senha.",
      style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
      ),
      textAlign: TextAlign.center,
      );
  }


  Widget buildCampoEmail() {
    return TextFormField(
      autofocus: true,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          icon: Icon(Icons.email_outlined),
          labelText: 'Email'),
      onSaved: (value) => setState(() => email = value!),
    );
  }


  Widget buildBotaoRecuperar() {
    return ElevatedButton(
        child: const Text('Enviar',
            style: TextStyle(color: Colors.white, fontSize: 14)),
        onPressed: () {
          final isValid = _formKey.currentState!.validate();
          if (isValid) {
            _formKey.currentState!.save();
          }
        });
  }

  Widget buildBotaoCancelar() {
    // ignore: deprecated_member_use
    return FlatButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Login(),
          ),
        );
      },
        child: const Text('Cancelar',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.purple, fontSize: 14)),
           
        );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Container(
          margin: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildTextSenha(),
                const SizedBox(height: 20),
                buildTextEmail(),
                const SizedBox(height: 20),
                buildCampoEmail(),
                const SizedBox(height: 20),
                buildBotaoRecuperar(),
                const SizedBox(height: 20),
                buildBotaoCancelar(),
              ],
            ),
          ),
        ),
      );
}
