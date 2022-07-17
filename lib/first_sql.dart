
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
/////////////          //////////////
class sqL{

static Database? _db;

Future<Database?> get db async{
if(_db==null){
 _db=await initialdb();
 return _db;
}else{
  return _db;
}
}
initialdb()async{
  String databasepath=await getDatabasesPath();
  String path=join(databasepath,"osman.db");
  Database mydb=await openDatabase(path,onCreate: _create,version:1,onUpgrade:_upcreate);
  return mydb;
}
Future<Database?>_upcreate(Database db,int version,int new_version)async{
// db.execute("alter table note add column string not null");
}
// Batch batch= Batch();

_create(Database db,int version)async{

  // Batch batch=db.batch();
  // batch.execute(sql_code);
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

getdata(String sql_q)async{
Database? mydb=await db;
var  reponse=await mydb!.rawQuery(sql_q);
return reponse;
}
updatedata(String sql_q)async{
Database? mydb=await db;
var  reponse=await mydb!.rawUpdate(sql_q);
return reponse;
}
insertdata(String sql_q)async{
Database? mydb=await db;
var  reponse=await mydb!.rawInsert(sql_q);
return reponse;
}
deletdata(String sql_q)async{
Database? mydb=await db;
var  reponse=await mydb!.rawDelete(sql_q);
return reponse;
}

delectdb()async{
  String databasepath=await getDatabasesPath();
  String path=join(databasepath,"osman.db");
  // Database mydb=await openDatabase(path,onCreate: _create,version: 6,onUpgrade:_upcreate);
  return deleteDatabase(path);
}

}