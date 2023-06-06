import 'package:flutter/material.dart';
import 'package:utor_demo/ViewModel/CategoriesViewModel.dart';

import '../View/CategoriesView.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  String selectedMenuItem = 'Home';
  int selectedOption = 0;

  void selectMenuItem(String menuItem) {
    setState(() {
      selectedMenuItem = menuItem;
      Navigator.pop(context); // Closes the drawer
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
           DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: radioGroupWidget()
           ),

          Expanded(child: CategoriesView()),
        ],
      ),
    );
  }


  Widget radioGroupWidget(){
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          customRadioButtonWidget(text: 'Days', value: 1),
          customRadioButtonWidget(text: 'Weeks', value: 2),
        ],
      ),
    );
  }

  Widget customRadioButtonWidget({required String text, required int value}){
    return RadioListTile<int>(
      title:  Text(text,style: const TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w500),),
      value: value,
      controlAffinity: ListTileControlAffinity.trailing,
      groupValue: selectedOption,
      activeColor: Colors.white,
      onChanged: (value) {
        setState(() {
          selectedOption = value!;
        });
      },
    );
  }
}

