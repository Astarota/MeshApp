import 'package:flutter/material.dart';

class SlaveOne extends StatefulWidget {

  @override
  State<SlaveOne> createState() => SlaveOneState();
}

class SlaveOneState extends State<SlaveOne> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Slave'),
            backgroundColor:Color(0x8292E100)
        ));
  }
}