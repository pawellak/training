import 'package:flutter/material.dart';

class ColorDetailPage extends StatelessWidget {
  const ColorDetailPage({required this.color, required this.title, this.materialIndex= 500,Key? key}): super(key: key);
  final MaterialColor color;
  final String title;
  final int materialIndex;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(
          '$title[$materialIndex]',
        ),
      ),
      body: Container(
        child: Center(child: FittedBox(child: Text('$title[$materialIndex]',style: const TextStyle(fontSize: 50),))),
        color: color[materialIndex],
      ),
    );
  }
}