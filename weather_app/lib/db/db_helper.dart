import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:weather_app/db/city_model.dart';

class DataBaseHelper{
  String tableName = 'weather_city';
  String id = 'id';
  String cityName = 'cityName';
  String lat = 'lat';
  String lng = 'lng';

  static Database? _database;
 static DataBaseHelper? _dataBaseHelper;
   DataBaseHelper._createInstance();
  factory DataBaseHelper(){
    _dataBaseHelper ??= DataBaseHelper._createInstance();
    return _dataBaseHelper!;
   }
  Future<Database> get database async{
     if(_database == null ){
       _database =  await initializeDatabase();
       return _database!;
     }
     return _database!;
  }

   Future<Database> initializeDatabase() async{
     Directory directory = await getApplicationDocumentsDirectory();
     var path = directory.path+"/test.db";
     print("hello$path");
     return _database = await openDatabase(path,version: 1, onCreate: _create);
   }

      _create(Database database, int version)async{
    return await database.execute("CREATE TABLE $tableName($id INTEGER PRIMARY KEY AUTOINCREMENT, $cityName STRING, $lat DOUBLE,$lng DOUBLE"
        ")");
   }
  Future<List<Map<String,dynamic>>> getCityMapList() async{
    Database database =await this.database;
    var results = await database.query(tableName);
    return results;
  }
  Future <List<CityModel>> getCityModels()async{
    List<Map<String,dynamic>> mapList = await getCityMapList();
    List<CityModel> cityListModels = [];
    for(int i =0 ; i < mapList.length ; i++ ){
      cityListModels.add(CityModel.fromMap(mapList[i]));
    }
    return cityListModels;
  }

 Future<int> insert(CityModel cityModel) async{
    Database database = await this.database;
    var result = database.isOpen;
    print("Database Is Open $result");

   var results = await  database.insert(tableName, cityModel.toMap());
   print("data inserted");
   return results;
 }
  Future<int> delete(int cid) async{
    Database database = await this.database;
    var results = await database.delete(tableName,where: '$id = $cid');
    return results;
  }

}