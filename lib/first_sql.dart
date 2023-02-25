import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


// ignore: camel_case_types
class sqL {

static Database? _db;

Future<Database?> get db async{
if(_db==null){
 _db=await initialdb();
 return _db;
}else{
  return _db;
}
}
/////////////////////////////////////////////////////////////////////////////   //// /////  ///// ///  ///
initialdb()async{
  String databasepath=await getDatabasesPath();
  String path=join(databasepath,"osman.db");
  Database mydb=await openDatabase(path,onCreate: _create,version:1,onUpgrade:_upcreate);
  return mydb;
}


Future<Database?>_upcreate(Database db,int version,int new_version)async{

}

_create(Database db,int version)async{                        
await db.execute(
'''                                     
create table "note"(
  'id' integer  not null primary key AUTOINCREMENT ,
  'body'  string not null,
  'title'   string not null,
  'color'  string not null
)
'''
);
}

getdata(String sqlQ)async{
Database? mydb=await db;
var  reponse=await mydb!.rawQuery(sqlQ);
return reponse;
}

//////////////////////////////
updatedata(String sqlQ)async{
Database? mydb=await db;
var  reponse=await mydb!.rawUpdate(sqlQ);
return reponse;
}
insertdata(String sqlQ)async{
Database? mydb=await db;
var  reponse=await mydb!.rawInsert(sqlQ);
return reponse;
}
deletdata(String sqlQ)async{
Database? mydb=await db;
var  reponse=await mydb!.rawDelete(sqlQ);
return reponse;
}

delectdb()async{
  String databasepath=await getDatabasesPath();
  String path=join(databasepath,"osman.db");
  
  return deleteDatabase(path);
}

}