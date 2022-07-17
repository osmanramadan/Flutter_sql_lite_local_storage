import 'package:flutter/material.dart';
import 'package:sql_lite/first_sql.dart';
import 'package:sql_lite/widgets/edit_note.dart';

class Homepage extends StatefulWidget {
  Homepage({ Key? key }) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}
class _HomepageState extends State<Homepage> {
sqL mysql=sqL();
 List mydata=[];
bool isfull=false;

  readdata()async{
  List<Map> response=await mysql.getdata("select * from 'note'");
  setState(() {  mydata.addAll(response); });

  isfull=true;
  // print(mydata);
  return response;
  }

  @override
void initState() {
    // TODO: implement initState
    readdata();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked,
      floatingActionButton:FloatingActionButton(onPressed:(){Navigator.popAndPushNamed(context, "addnote");}
      ,child:Icon(Icons.add)),
      body: Container(
        child:
            
          ListView.builder(shrinkWrap:true,itemCount:mydata.length,itemBuilder:((context, index) {
              return Dismissible(
                onDismissed:((direction) async{
                setState(() {
                var del= mysql.deletdata("delete from note where id=${mydata[index]['id']}");
                
                mydata.removeWhere((element) => element['id']==mydata[index]['id']);
                        
                });
                }),
                key:ValueKey<Map>(mydata[index]),
                
                background:Container(color:Colors.blue),
                child: ListTile(
                
                title:Text("${mydata[index]['body']}"),
                subtitle:Text("${mydata[index]['title']}"),
                trailing:IconButton(onPressed: (){Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder:(context) => EditNote(body1: '${mydata[index]['body']}', color1: '${mydata[index]['color']}', id: '${mydata[index]['id']}', title1:'${mydata[index]['title']}')), (route) => false);} ,icon:Icon(Icons.edit)),
                ),
              );
            })),
    
          
        ),
      );
  }
}