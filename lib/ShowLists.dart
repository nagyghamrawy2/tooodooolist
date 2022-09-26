
import 'package:flutter/material.dart';
import 'component/shared.dart';
class ShowLists extends StatelessWidget {
  const ShowLists({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavBar(),
      body: CustomTasks(),
    );
  }
}

