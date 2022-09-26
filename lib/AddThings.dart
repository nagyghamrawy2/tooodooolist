
import 'package:flutter/material.dart';
import 'package:todolistass/component/constants.dart' ;

import 'ShowLists.dart';
import 'component/shared.dart';
import 'models/tasks.dart';
class AddLists extends StatefulWidget {
  const AddLists({Key? key}) : super(key: key);

  @override
  State<AddLists> createState() => _AddListsState();
}

class _AddListsState extends State<AddLists> {
 TextEditingController addController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     bottomNavigationBar: CustomBottomNavBar(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: 400,
                child:Image.asset(
                  'assets/images/add.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 40,),
              CustomTextField(controller_Name: addController, num_width: 0.87, num_hieght: 80,
                  keyboardtype: TextInputType.name, obsecure: false, text_hint: "Things To Do",
                  text_label: "Title", num_border: 23.0, iconName: Icon(Icons.add)),
              SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width * 0.65,
                child: ElevatedButton(
                  child: const Text('Add'),
                  onPressed: () {
                    setState(() {
                      tasks.add(
                          To_Do_Tasks(name: userName, title: addController.text)
                      );

                    });
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ShowLists() ));
                  },
                  style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      textStyle:
                      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}