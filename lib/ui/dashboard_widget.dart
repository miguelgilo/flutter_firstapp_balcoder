import 'package:flutter/material.dart';

class DashboardWidget extends StatefulWidget {
  DashboardWidget({this.count});
  int count;

  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 240,
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Spacer(),
          Text(widget.count.toString(),
              style: TextStyle(color: Colors.white, fontSize: 32)),
          Spacer(),
          Text("Usuarios", style: TextStyle(color: Colors.white, fontSize: 24)),
          Spacer(),
        ],
      ),
    );
  }
}
