import 'package:flutter/material.dart';
import 'package:solid_principles/src/core/utils/constants.dart';
import 'package:solid_principles/src/module/home/presenter/pages/add_todo_page/widgets/models/slide_item_text.dart';

class SliderField extends StatelessWidget {
  SlideItemText item;
  SliderField({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            height: item.selected ? 15 : 15,
            width: item.selected ? 15 : 15,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                    color: item.selected
                        ? floatingButtonColor
                        : Colors.grey.withOpacity(0.4)),
                borderRadius: BorderRadius.circular(50)),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            item.title,
            style: TextStyle(color: Colors.black.withOpacity(0.9)),
          ),
        ],
      ),
    );
  }
}
