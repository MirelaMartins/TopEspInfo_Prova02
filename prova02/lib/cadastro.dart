// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:prova02/api/backend.dart';
import 'package:prova02/login.dart';


class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CadastroState();
  }
}
class CadastroState extends State<Cadastro> {
  final Api api = Api();
  late String nome;
  late String email;
  late String senha;

  int operation = 1;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();

  String? numeroValido(value) {
    final valorCampo = num.tryParse(value);
    if (valorCampo == null) {
      return 'Digite um valor válido!';
    }
    return null;
  }

  Widget buildTextCadastro(){
   return const Text(
      "Cadastro",
      style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Colors.purple,
      ),
      textAlign: TextAlign.center,
      );
  }

  Widget buildCampoNome() {
    return TextFormField(
      autofocus: true,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          icon: Icon(Icons.account_box_outlined),
          labelText: 'Nome'),
      onSaved: (value) => setState(() => nome = value!),
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

  Widget buildCampoSenha() {
    return TextFormField(
      autofocus: true,
      obscureText: true,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          icon: Icon(Icons.lock_outline),
          labelText: 'Senha'),
      onSaved: (value) => setState(() => senha = value!),
    );
  }

  Future<dynamic> dadosValidos() => showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Ooops! :/'),
          content: const Text("Dados inválidos! Não foi possível realizar o cadastro"),
          actions: [
            TextButton(
              child: const Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      });

  Widget buildBotaoCadastrar() {
    return ElevatedButton(
        child: const Text('Cadastrar',
            style: TextStyle(color: Colors.white, fontSize: 14)),
        onPressed: () async {
          final isValid = _formKey.currentState!.validate();
          if (isValid) {
            _formKey.currentState!.save();
            // ignore: unused_local_variable
            final user = await api.create(email, nome, senha);
            if (user != null) {
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => const Login()),
            );
            } else {
              dadosValidos();
            }
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
        appBar: AppBar(title: const Text("")),
        body: Container(
          margin: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                buildTextCadastro(),
                const SizedBox(height: 20),
                buildCampoNome(),
                const SizedBox(height: 20),
                buildCampoEmail(),
                const SizedBox(height: 20),
                buildCampoSenha(),
                const SizedBox(height: 20),
                buildBotaoCadastrar(),
                const SizedBox(height: 20),
                buildBotaoCancelar(),
              ],
            ),
          ),
        ),
      );
}
