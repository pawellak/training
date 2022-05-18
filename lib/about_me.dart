import 'package:flutter/material.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(appBar: AppBar(title: const Text('info')),body: const Center(child: Text('Informacje o fimie')));
  }
}
