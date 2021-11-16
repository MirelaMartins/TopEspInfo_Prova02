import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  const Home(this.name, {Key? key}) : super(key: key);
  final String name;
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Container(
        margin: const EdgeInsets.all(36),
        alignment: Alignment.center,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            textBaseline: TextBaseline.alphabetic,
            children: <Widget>[Text('Bem vindo ${widget.name}!')]),
      ));
}
