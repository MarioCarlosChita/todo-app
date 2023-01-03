import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:solid_principles/src/core/theme/theme_data_ui.dart';
import 'package:solid_principles/src/core/utils/constants.dart';
import 'package:solid_principles/src/module/home/presenter/pages/add_todo_page/widgets/text_label.dart';
import 'package:solid_principles/src/module/home/presenter/pages/home_page/home_page.dart';
import 'package:solid_principles/src/module/home/presenter/pages/home_page/widgets/logo.dart';

import 'widgets/slider_list_field.dart';

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({Key? key}) : super(key: key);

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage>
    with TickerProviderStateMixin {
  final TextEditingController title = TextEditingController();
  final TextEditingController label = TextEditingController();
  final form = GlobalKey<FormState>();

  late AnimationController _containerController;
  late Animation<double> _animationSize;

  late AnimationController _buttonAddController;
  late Animation<double> _buttonAnimation;

  bool buttonClicked = false;
  bool appBackground = false;
  bool containerTheme = false;

  @override
  void initState() {
    super.initState();

    _buttonAddController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
    _buttonAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(_buttonAddController);

    _containerController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 150));

    _animationSize = Tween<double>(
      begin: 0,
      end: 300,
    ).animate(_containerController);
    _onListenAnimation();
  }

  void _onListenAnimation() {
    _buttonAddController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          buttonClicked = true;
        });
        _containerController.forward();
      }
    });

    _containerController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          appBackground = true;
        });
        Future.delayed(const Duration(milliseconds: 950), () {
          setState(() {
            appBackground = false;
            buttonClicked = false;
          });
          _containerController.reverse();
        });
      }

      if (status == AnimationStatus.dismissed) {
        setState(() {
          containerTheme = false;
        });
        _buttonAddController.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    double kDevicePercent = media.height / media.width;
    double kScaleSize = kDevicePercent * 0.5;
    double maxHeight = media.height - 120;
    ;
    return Scaffold(
      backgroundColor: appBackground ? floatingButtonColor : Colors.white,
      body: !containerTheme
          ? SafeArea(
              child: Container(
              width: media.width,
              height: media.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => HomePage()));
                        },
                        icon: const Icon(
                          Icons.close,
                          size: 32,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: kScaleSize * 15),
                    child: const Logo(title: "Add Todo"),
                  ),
                  Container(
                    width: media.width,
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 12),
                    child: Form(
                      key: form,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextLabel(message: "To-do"),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 40,
                            child: TextFormField(
                              controller: title,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                  top: 10,
                                  left: 06,
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey.withOpacity(0.5))),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey.withOpacity(0.5))),
                                hintText: "What needs to be done?",
                              ),
                            ),
                          ),
                          const SizedBox(height: 35),
                          TextLabel(message: "Label"),
                          const SizedBox(height: 5),
                          Container(
                            height: 40,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                color: Colors.grey.withOpacity(0.3),
                              )),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                        isExpanded: true,
                                        value: CATEGORY_LIST[0],
                                        isDense: true,
                                        dropdownColor: Colors.white,
                                        items: CATEGORY_LIST.map((category) {
                                          return DropdownMenuItem(
                                            value: category,
                                            child: Text(category),
                                          );
                                        }).toList(),
                                        onChanged: (value) {})),
                              ),
                            ),
                          ),
                          const SizedBox(height: 35),
                          TextLabel(message: "Priority"),
                          const SizedBox(
                            height: 10,
                          ),
                          const SlideListField()
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ))
          : Stack(
              children: [
                AnimatedBuilder(
                  animation: _containerController,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(
                          0,
                          buttonClicked
                              ? media.height -
                                  (_animationSize.value + maxHeight) +
                                  media.height / 2 -
                                  210
                              : media.height - _animationSize.value),
                      child: child,
                    );
                  },
                  child: Container(
                    width: media.width,
                    height: media.height,
                    color: floatingButtonColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedScale(
                          duration: const Duration(milliseconds: 200),
                          scale: appBackground ? 1 : 0,
                          onEnd: () {
                            setState(() {
                              containerTheme = true;
                            });
                          },
                          child: const Icon(
                            Icons.check_circle,
                            size: 120,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const AnimatedCrossFade(
                            firstChild: SizedBox.shrink(),
                            secondChild: Text(
                              "Item Adicionado com Sucesso",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            crossFadeState: CrossFadeState.showSecond,
                            duration: Duration(milliseconds: 500))
                      ],
                    ),
                  ),
                )
              ],
            ),
      bottomNavigationBar: AnimatedBuilder(
        animation: _buttonAddController,
        builder: (context, child) {
          return Transform.scale(
            scale: _buttonAnimation.value,
            child: child,
          );
        },
        child: Container(
          height: 70,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 45),
          child: MaterialButton(
            onPressed: () {
              _buttonAddController.forward();
              setState(() {
                containerTheme = true;
              });
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            minWidth: double.infinity,
            color:
                ThemeDataUi.themeData.floatingActionButtonTheme.backgroundColor,
            child: const Text(
              "Done",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
