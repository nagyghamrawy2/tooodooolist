import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:todolistass/component/constants.dart';

import '../AddThings.dart';
import '../ShowLists.dart';
import '../models/tasks.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({required this.controller_Name,required this.num_width ,required this.num_hieght ,required this.keyboardtype ,required this.obsecure ,required this.text_hint ,required this.text_label ,required this.num_border ,required this.iconName });
  late double num_width;
  late double num_hieght;
  late TextInputType keyboardtype;
  late bool obsecure;
  late String text_hint;
  late String text_label;
  late double num_border;
  TextEditingController controller_Name = new TextEditingController();
  late Icon iconName;
  @override
  Widget build(BuildContext context) {
    return   Container(
      width: MediaQuery.of(context).size.width * num_width,
      height: num_hieght,
      child: TextFormField(
        controller: controller_Name ,
        keyboardType: keyboardtype,
        obscureText: obsecure,
        decoration: InputDecoration(
          hintText: text_hint,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintStyle: TextStyle(fontSize: 16),
          labelText: text_label,
          labelStyle: TextStyle(fontSize: 22 , fontWeight: FontWeight.bold ,color: Colors.black),
          border: OutlineInputBorder(
              borderSide:  BorderSide(color: Colors.black26, width: 3.0),
              borderRadius: BorderRadius.circular(num_border)
          ),
          focusedBorder:OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.black26, width: 3.0),
            borderRadius: BorderRadius.circular(num_border),
          ),
          suffixIcon: iconName


        ),
        onChanged: (value) {
          // do something
        },
      ),
    );
  }
}
class CustomBottomNavBar extends StatefulWidget {
  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedTap,

      onTap: (int index){
       setState(() {
         selectedTap = index;
       });
      },

      selectedItemColor: Colors.amber[800],
    items: [
    BottomNavigationBarItem(
    icon: IconButton(
    onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>AddLists() ));
    selectedTap=0;
    },
    icon: Icon(Icons.post_add_outlined)
    ),
    label: "Add",
    ),
    BottomNavigationBarItem(
    icon: IconButton(
    onPressed: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ShowLists() ));
    selectedTap=1;
    },
    icon: Icon(Icons.list_alt_outlined)
    ),
    label: "Show",
    ),
    ],
    );
  }
}

class CustomTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
      condition: tasks.length >0 ,
      builder: (context) => ListView.separated(
          itemBuilder: (context , index) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40.0,
                    child: Text(
                        "${tasks[index].name}"
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          " ${tasks[index].title}",
                          style: TextStyle(fontSize: 18 ,fontWeight: FontWeight.bold),
                        ),

                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context , index) => Padding(
            padding: const EdgeInsetsDirectional.only(start: 20.0),
            child: Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey[300],
            ),
          ),
          itemCount: tasks.length
      ),
      fallback: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.menu,
              size: 100.0,
              color: Colors.grey,
            ),
            Text(
              "No Tasks Yet Please Add Some Tasks",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey
              ),
            )
          ],
        ),
      ),

    );
  }
}