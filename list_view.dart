import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListPage extends StatefulWidget {
  ListPage({required this.title, Key? key}) : super(key: key);
  String title;

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<int> items = List.generate(100, (index) => index + 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(elevation: 1, centerTitle: false, title: Text(widget.title)),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: ((context, index) {
            return Slidable(
              key: Key(items[index].toString()),
              startActionPane: ActionPane(
                motion: const ScrollMotion(),
                dismissible: DismissiblePane(onDismissed: () {
                  setState(() {
                    items.removeAt(index);
                  });
                }),
                children: [
                  SlidableAction(
                    onPressed: (_) {},
                    backgroundColor: const Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                ],
              ),
              endActionPane: ActionPane(
                dismissible: DismissiblePane(onDismissed: () {
                  setState(() {
                    items.removeAt(index);
                  });
                }),
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    // An action can be bigger than the others.
                    onPressed: (_) {},
                    backgroundColor: const Color(0xFF7BC043),
                    foregroundColor: Colors.white,
                    icon: Icons.archive,
                    label: 'Archive',
                  ),
                ],
              ),
              child: ListTile(
                shape: const RoundedRectangleBorder(
                    side: BorderSide(color: Colors.black26)),
                leading: const Icon(Icons.person, color: Colors.grey, size: 30),
                title: Text('items${items[index]}'),
              ),
            );
          })),
    );
  }
}
