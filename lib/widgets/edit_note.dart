
import 'package:flutter/material.dart';
import 'package:sql_lite/first_sql.dart';

class EditNote extends StatefulWidget {
  EditNote({ Key? key,required this.body1,required this.color1,required this.id,required this.title1});

String title1;
String body1;
String color1;
String id;


  @override
  
  State<EditNote> createState() => _EditNoteState();
}



class _EditNoteState extends State<EditNote> {

  sqL mysql=sqL();

  TextEditingController title=TextEditingController();
  TextEditingController body=TextEditingController();
  TextEditingController color=TextEditingController();
  
  @override
   initState() {
  
  title.text=widget.title1;
  body.text=widget.body1;
  color.text=widget.color1;

    super.initState();
  }

  @override

  
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        child: Container(
          padding:const EdgeInsets.only(top:30,left:20),  
          child:Form(
          child: Column(children: [
          TextFormField(controller:title,),
          TextFormField(controller:body),
          TextFormField(controller:color),
        
          TextButton(onPressed:()async{
          int re=await mysql.updatedata(
            
          '''
          update note set title='${title.text}',body='${body.text}',color='${color.text}' where id=${widget.id}
          
          '''
        );
           if(re>0){
            Navigator.popAndPushNamed(context, 'homepage');
           }
          }, child:Text("edit note"))
          
        
          ]),
        ),),
      ),
    );
  }
}