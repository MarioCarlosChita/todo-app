import 'package:flutter/material.dart';
import 'package:solid_principles/src/core/utils/constants.dart';
import 'package:solid_principles/src/module/home/presenter/pages/home_page/widgets/card_todo_item.dart';

class DoneTodoList extends StatefulWidget {
  const DoneTodoList({Key? key}) : super(key: key);

  @override
  State<DoneTodoList> createState() => _DoneTodoListState();
}

class _DoneTodoListState extends State<DoneTodoList> {
  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;

    return Container(
      height: media.height / 2,
      child: ListView.separated(
        itemCount: LIST_TODO.length ?? 0,
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemBuilder: (context, index) => Material(
          elevation: 0.3,
          child: CardTodoItem(todo: LIST_TODO[index]),
        ),
      ),
    );
  }
}
