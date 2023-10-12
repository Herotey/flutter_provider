import 'package:development/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    final myList = context.watch<IconProvider>().mylist;
    return Scaffold(
      appBar: AppBar(
        title: Text(" List Favorite(${myList.length})"),
      ),
      body: ListView.builder(
          itemCount: myList.length,
          itemBuilder: (_, index) {
            final currentIcon = myList[index];
            return Card(
              key: ValueKey(currentIcon.title),
              elevation: 4,
              child: ListTile(
                title: Text(currentIcon.title.toString()),
                subtitle: Text(currentIcon.subtitle.toString()),
                trailing: TextButton(
                  child: const Text(
                    'Remove',
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    context.read<IconProvider>().removeFromList(currentIcon);
                  },
                ),
              ),
            );
          }),
    );
  }
}
