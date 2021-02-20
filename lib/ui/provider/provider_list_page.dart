import 'package:flutter/material.dart';

class ProviderList extends StatefulWidget {
  @override
  _ProviderListState createState() => _ProviderListState();
}

class _ProviderListState extends State<ProviderList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("LISTA DE PROVEEDORES", style: TextStyle(color: Colors.white, fount),)),
      ),
    );
  }
}
