import 'package:flutter/material.dart';
import 'package:todolistass/component/constants.dart';


import 'AddThings.dart';
import 'component/shared.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
     TextEditingController nameController = new TextEditingController() ;

   TextEditingController emailController = new TextEditingController() ;

   List<String> gendertype = ['male', 'female'];
 // Option 2
   String? selectedgender;
 // Option 2
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:SingleChildScrollView(
         child: SafeArea(
           child: Column(
             children: [
                  Container(
                    height: 400,
                    child:Image.asset(
                        'assets/images/register.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
               SizedBox(height: 40,),
               CustomTextField(controller_Name: nameController, num_width: 0.87, num_hieght: 60,
                   keyboardtype: TextInputType.name, obsecure: false, text_hint: "Please Write Your Name Here",
                   text_label: "Name", num_border: 23.0, iconName: Icon(Icons.drive_file_rename_outline)),
               SizedBox(height: 20,),
               CustomTextField(controller_Name: emailController, num_width: 0.87, num_hieght: 60,
                   keyboardtype: TextInputType.emailAddress, obsecure: false, text_hint: "Please Write Your Email Here",
                   text_label: "E mail", num_border: 23.0, iconName: Icon(Icons.email)),
               SizedBox(height: 20,),
               DropdownButton(
                 hint: Text('Please choose your gender'),
                 value: selectedgender,
                 onChanged: (newValue) {
                   setState(() {
                     selectedgender = newValue as String?;
                   });
                 },
                 items: gendertype.map((gender) {
                   return DropdownMenuItem(
                     child: new Text(gender),
                     value: gender,
                   );
                 }).toList(),
               ),
               SizedBox(height: 20,),
               Container(
                 width: MediaQuery.of(context).size.width * 0.65,
                 child: ElevatedButton(
                   child: const Text('Sign Up'),
                   onPressed: () {

                     print ("sssssss");
                     print(nameController.text);
                     setState(() {
                       print ("aaaaaaaaaa");
                       userName = nameController.text;
                       print ("xxxxxxxx");

                     });
                     Navigator.push(context, MaterialPageRoute(builder: (context) => AddLists() ));
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
