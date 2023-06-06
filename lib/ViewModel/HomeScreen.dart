import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:utor_demo/ViewModel/HomeDrawerWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return body();
  }

  Widget body(){
    return  Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text("UTOR DEMO"),
      ),
      body: Center(
        child: SizedBox(
            width: MediaQuery.of(context).size.width/2,
            child: const Text("This is task given by Utor implemented by Samra Khan",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),)),
      ),
    );
  }
}
