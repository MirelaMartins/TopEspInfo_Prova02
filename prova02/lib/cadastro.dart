// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:prova02/login.dart';


class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CadastroState();
  }
}
class CadastroState extends State<Cadastro> {
  late String primeiroCampo;
  late String segundoCampo;
  late String terceiroCampo;
  late String resultado;

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

  Widget buildCampoNome() {
    return TextFormField(
      autofocus: true,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          icon: Icon(Icons.account_box_outlined),
          labelText: 'Nome'),
      onSaved: (value) => setState(() => primeiroCampo = value!),
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
      onSaved: (value) => setState(() => segundoCampo = value!),
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
      onSaved: (value) => setState(() => terceiroCampo = value!),
    );
  }

  Widget buildBotaoCadastrar() {
    return ElevatedButton(
        child: const Text('Cadastrar',
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
            style: TextStyle(color: Colors.blue, fontSize: 14)),
           
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
