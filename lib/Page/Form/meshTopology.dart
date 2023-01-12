import 'package:flutter/material.dart';
import 'package:openwrt_manager/Page/Form/master.dart';
import 'package:openwrt_manager/Page/Form/slaveOne.dart';

class MeshTopology extends StatefulWidget {

  @override
  State<MeshTopology> createState() => MeshTopologyState();
}

class MeshTopologyState extends State<MeshTopology> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('MeshTopology'),
            backgroundColor:Color(0x8292E100)
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: Stack(
              children: <Widget>[
                 Container(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Master()));
                      },
                      child:Image.asset('assets/mesh.png',
                        height: 300,
                        width: 300,

                    // color: Color.fromARGB(255, 15, 147, 59),
                    ))),
                  Container(
                      alignment: Alignment.topRight,child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SlaveOne()));
                      },
                      child:Image.asset(
                          'assets/mesh.png',
                          height: 300,
                          width: 300,
                        ))),
                Container(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SlaveOne()));
                      },
                    child:Image.asset(
                      'assets/mesh.png',
                      height: 300,
                      width: 300,
                    ))),
              ],
            )));
  }
}