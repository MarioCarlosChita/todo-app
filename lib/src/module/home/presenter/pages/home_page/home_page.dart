import 'package:flutter/material.dart';
import 'package:solid_principles/src/core/theme/theme_data_ui.dart';
import 'package:solid_principles/src/module/home/presenter/pages/add_todo_page/add_todo_page.dart';

import 'widgets/done_todo_list.dart';
import 'widgets/logo.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.of(context).size;
    double kDevicePercent = media.height / media.width;
    double kScaleSize = kDevicePercent * 0.5;

    return Scaffold(
      backgroundColor: ThemeDataUi.themeData.scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Container(
          width: media.width,
          height: media.height,
          color: ThemeDataUi.themeData.scaffoldBackgroundColor,
          margin: EdgeInsets.symmetric(
              horizontal: kScaleSize * 25, vertical: kScaleSize * 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Logo(title: "Todos"),
              SizedBox(
                height: 5,
              ),
              DoneTodoList()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const AddTodoPage()));
        },
        backgroundColor:
            ThemeDataUi.themeData.floatingActionButtonTheme.backgroundColor,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
