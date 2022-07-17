import 'package:flutter/material.dart';
// import 'package:sql_lite/first_sql.dart';
import 'package:sql_lite/screens/homepage.dart';
import 'package:sql_lite/widgets/add_note.dart';
// import 'package:sql_lite/widgets/edit_note.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'sql ',
      home:Homepage(),
      routes: {
        "addnote":((context) => AddNote()),
        "homepage":((context) => Homepage())
      },
    );
  }
  }


//  class Homepage  extends StatelessWidget {
//     Homepage ({ Key? key }) : super(key: key);
//    sqL sqldata=sqL();
//    var notenum=0;
//    var resp_in=0;
//    @override
//    Widget build(BuildContext context) {
//      return Scaffold( 
//        body:Container(padding:EdgeInsets.only(top: 40,left: 50),child:Column(children: [
//         MaterialButton(onPressed: ()async{
//               notenum=resp_in;
//         resp_in=await sqldata.insertdata("insert into 'note' ('notes','color') values ('$notenum','red')");
//         print(resp_in);
//         },child: Text("insert data"),),
//         MaterialButton(onPressed: ()async
//         {var resp=await sqldata.getdata("select * from 'note'");
//         print(resp);
        
//         },child:Text("view data"),),
//         MaterialButton(onPressed: ()async{var resp=await sqldata.deletdata("delete from 'note' where id=1");
//         print(resp);
        
//         },child:Text("delect data"),),
//         MaterialButton(onPressed: ()async{var resp=await sqldata.getdata("update 'note' set 'notes'='testupdate' where id=2");
//         print(resp);
        
//         },child:Text("updata data"),),
//         ]),),
//      );
//    }
//  }