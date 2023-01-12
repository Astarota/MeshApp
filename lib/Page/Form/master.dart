import 'package:flutter/material.dart';

class Master extends StatefulWidget {

  @override
  State<Master> createState() => MasterState();
}

class MasterState extends State<Master> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Master'),
    backgroundColor:Color(0x8292E100)
    ));
  }
}