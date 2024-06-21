import 'package:flutter/material.dart';

class ReorderableListViewClass extends StatefulWidget {
  @override
  _ReorderableListViewClassState createState() => _ReorderableListViewClassState();
}

class _ReorderableListViewClassState extends State {
  List items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reorderable ListView'),
      ),
      body: ReorderableListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            key: Key(items[index]),
            title: Text(items[index]),
          );
        },
        onReorder: (oldIndex, newIndex) {
          setState(() {
            if (newIndex > oldIndex) {
              newIndex -= 1;
            }
            final item = items.removeAt(oldIndex);
            items.insert(newIndex, item);
          });
        },
      ),
    );
  }
}