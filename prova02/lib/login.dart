import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:prova02/api/backend.dart';
import 'package:prova02/cadastro.dart';
import 'package:prova02/home.dart';
import 'package:prova02/recuperarSenha.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ScreenLoginState();
  }
}

class ScreenLoginState extends State<Login> {
  final Api api = Api();
  late String email;
  late String senha;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();

  Widget buildTextLogin(){
   // ignore: prefer_const_constructors
   return const Text(
      "Login",
      style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w400,
            color: Colors.purple,
      ),
      textAlign: TextAlign.center,
      );
  }

  Widget buildCampoUsuario() {
    return TextFormField(
      autofocus: true,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
          border: OutlineInputBorder(),
          icon: Icon(Icons.account_box_outlined),
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

  Future<dynamic> invalidCredentials() => showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Ooops! :/'),
          content: const Text("Dados inválidos! Não foi possível realizar o login"),
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

  Widget buildBotaoEntrar() {
    return ElevatedButton(
        child: const Text('Entrar',
            style: TextStyle(color: Colors.white, fontSize: 14)),
        onPressed: () async {
          final isValid = _formKey.currentState!.validate();
          if (isValid) {
            _formKey.currentState!.save();
            // ignore: unused_local_variable
            final name = await api.login(email, senha);
            if (name != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home(name)),
            );
          } else {
            invalidCredentials();
          }
            //chamar Api, tratar retorno, redirecionar
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
            style: TextStyle(color: Colors.purple, fontSize: 14)),
           
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
                buildTextLogin(),
                const SizedBox(height: 20),
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
