import 'package:flutter/material.dart';
import 'package:solid_principles/src/module/home/presenter/pages/add_todo_page/widgets/models/slide_item_text.dart';
import 'package:solid_principles/src/module/home/presenter/pages/add_todo_page/widgets/slider_field.dart';

class SlideListField extends StatefulWidget {
  const SlideListField({Key? key}) : super(key: key);

  @override
  State<SlideListField> createState() => _SlideListFieldState();
}

class _SlideListFieldState extends State<SlideListField> {
  final List<String> priority = ['Low', 'Medium', 'High'];
  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: [
          _rowLineContainer(lista: []),
          Positioned(top: 5, child: _lineContainer(media: media))
        ],
      ),
    );
  }

  Widget _lineContainer({required Size media}) {
    return Container(
      width: media.width,
      height: 4,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10)),
    );
  }

  Widget _rowLineContainer({required List<SlideItemText> lista}) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int index = 0; index < priority.length; ++index)
            SliderField(
              item: SlideItemText(title: priority[index], selected: index == 0),
            )
        ],
      ),
    );
  }
}
