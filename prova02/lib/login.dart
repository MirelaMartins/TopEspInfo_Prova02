import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prova02/cadastro.dart';
import 'package:prova02/recuperarSenha.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ScreenLoginState();
  }
}

class ScreenLoginState extends State<Login> {
  late String primeiroCampo;
  late String segundoCampo;
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

  Widget buildCampoUsuario() {
    return TextFormField(
      autofocus: true,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          icon: Icon(Icons.account_box_outlined),
          labelText: 'Usuário'),
      onSaved: (value) => setState(() => primeiroCampo = value!),
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
      onSaved: (value) => setState(() => segundoCampo = value!),
    );
  }

  Widget buildBotaoEntrar() {
    return ElevatedButton(
        child: const Text('Entrar',
            style: TextStyle(color: Colors.white, fontSize: 14)),
        onPressed: () {
          final isValid = _formKey.currentState!.validate();
          if (isValid) {
            _formKey.currentState!.save();
          }
        });
  }

  Widget buildRecuperarSenha() {
    // ignore: deprecated_member_use
    return FlatButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RecuperarSenha(),
          ),
        );
      },
        child: const Text('Esqueceu a senha?',
            textAlign: TextAlign.right,
            style: TextStyle(color: Colors.blue, fontSize: 14)),
           
        );
  }
  

  Widget buildBotaoCadastrar() {
    // ignore: deprecated_member_use
    return FlatButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Cadastro(),
          ),
        );
      },
        child: const Text('Cadastrar-se',
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
                buildCampoUsuario(),
                const SizedBox(height: 20),
                buildCampoSenha(),
                const SizedBox(height: 20),
                buildBotaoEntrar(),
                const SizedBox(height: 20),
                buildRecuperarSenha(),
                const SizedBox(height: 20),
                buildBotaoCadastrar(),
              ],
            ),
          ),
        ),
      );
}
