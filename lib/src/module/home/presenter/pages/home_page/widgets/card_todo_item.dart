import 'package:flutter/material.dart';
import 'package:solid_principles/src/module/home/domain/entity/todo.dart';
import 'package:solid_principles/src/module/home/domain/enum/priority.dart';

import 'ship_item.dart';

class CardTodoItem extends StatelessWidget {
  final Todo todo;
  const CardTodoItem({required this.todo});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(5),
        height: 120,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(flex: 1, child: _removeTodoIcon()),
            Expanded(
              flex: 4,
              child: _todoDetail(),
            ),
            Expanded(
              flex: 1,
              child: _checkBox(),
            )
          ],
        ));
  }

  Widget _removeTodoIcon() {
    return Container(
      child: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.remove_circle_outline_outlined,
            color: Colors.grey,
          )),
    );
  }

  Widget _todoDetail() {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            todo.title,
            style: const TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
            maxLines: 1,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            todo.category,
            style: const TextStyle(
                color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          ShipItem(
            color: getPriorityColor(todo.priority),
            message: todo.priority.name,
          )
        ],
      ),
    );
  }

  Widget _checkBox() {
    return Container(
      child: Checkbox(
        value: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            side: BorderSide(color: Colors.white70)),
        onChanged: (bool? value) {},
      ),
    );
  }
}
