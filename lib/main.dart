
import 'package:crud_applacation_02/screens/ProductGridViewScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const CrudApp());
}

class CrudApp extends StatelessWidget {
  const CrudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title:'Crud App',
      debugShowCheckedModeBanner:false,
      home:Productgridviewscreen(),
    );
  }
}