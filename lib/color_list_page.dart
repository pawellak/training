import 'package:flutter/material.dart';

class ColorsListPage extends StatelessWidget {
  ColorsListPage({Key? key, required this.color, required this.title, required this.onPush}) : super(key: key);

  final MaterialColor color;
  final String title;
  final ValueChanged<int> onPush;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
        backgroundColor: color,
      ),
      body: Container(
        color: Colors.white,
        child: _buildList(),
      ),
    );
  }

  final List<int> materialIndices = [900, 800, 700, 600, 500, 400, 300, 200, 100, 50];

  Widget _buildList() {
    return ListView.builder(
        itemCount: materialIndices.length,
        itemBuilder: (BuildContext content, int index) {
          int materialIndex = materialIndices[index];
          return Container(
            height: 100,
            color: color[materialIndex],
            child: Center(
              child: ListTile(
                title: Text('$materialIndex', style: const TextStyle(fontSize: 24.0),textAlign: TextAlign.center),
                onTap: () => onPush(materialIndex),
              ),
            ),
          );
        });
  }
}
