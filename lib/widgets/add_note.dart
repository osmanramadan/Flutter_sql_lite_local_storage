
// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:sql_lite/first_sql.dart';
import 'package:sql_lite/screens/homepage.dart';

class AddNote extends StatefulWidget {
  const AddNote({ Key? key }) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {

  sqL mysql=sqL();

  TextEditingController title=TextEditingController();
  TextEditingController body=TextEditingController();
  TextEditingController color=TextEditingController();
  
  GlobalKey<FormState> fost=GlobalKey();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Container(
        padding:const EdgeInsets.only(top:30,left:20),  
        child:Form(
        child:
        Column(
          children: [
            
        TextFormField(controller:title),
        TextFormField(controller:body),
        TextFormField(controller:color),
      
        TextButton(onPressed:()async{
        var repos=await mysql.insertdata
        (
        '''
        insert into 'note' (title,body,color) values 
        ('${title.text}','${body.text}','${color.text}')  
        '''
        );

      if(repos>1){
        Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: ((context) =>const Homepage())), (route) => false);
      }
      }, child:const Text("add note"))
        ])
        
        )),
      ),
    );
  }
}