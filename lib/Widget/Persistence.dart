//本地持久话
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';

// 1.sharePreferences 存储基本类型数据类似与iOS的default
// 支持这几种基础类型 bool double string stringList Int

class PersistenceTest1 extends StatefulWidget {
  @override
  _PersistenceTest1State createState() => _PersistenceTest1State();
}

class _PersistenceTest1State extends State<PersistenceTest1> {
  @override
  void initState() {
    _loadShared1();
    _dbFuncList();
    super.initState();
  }

  _loadShared1() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("firstLaunch", false);
    prefs.setString("stringTest", "String");
    List<String> _stringLists = ["1", '', "3", "4"];
    prefs.setStringList("stringList", _stringLists);
  }

  @override
  void didChangeDependencies() {
    _getShared1();
    super.didChangeDependencies();
  }

  @override
  void setState(fn) {
    super.setState(fn);
  }

  _getShared1() async {
    final prefs = await SharedPreferences.getInstance();

    print(prefs.getBool("firstLaunch"));
    print(prefs.getString("stringTest"));
    print(prefs.getStringList("stringList"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("数据持久化的三种方案"),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text("1.sharePreferences 存储基本类型数据类似与iOS的default"
                "支持这几种基础类型 bool double string stringList Int"
                "通过get方法获取值"
                "移除：调用remove(key)实现"),
          ),
          ListTile(
            title: Text("2.本地文件"
                "pubspec.yaml 描述文件添加path_provider的依赖"
                "通过getApplicationDocumentsDirectory获取沙盒文件路径"
                "判断目标文件夹是否存在，不存在需要创建一个目标文件夹"
                "然后在目标文件夹里创建目标文件，writeAsString（写入字符串为例）和readAsString实现写入和读取"
                "也可以写入字节"),
          ),
          ListTile(
            title: Text("3.sqlite数据库"
                "有增删改查的需求比较适用"
                "- pubspec.yaml 描述文件添加sqflite的依赖"
                "- 打开数据库：final Future<Datrebase> datebase = openDatabase("
                "join(await getDatabasesPath(), 'dbName),'"
                ")"
                "- 创建表 onCreate:(db, version( sqlite语句),)"
                "常见的insert，update，Delete等操作"),
          ),
        ],
      ),
    );
  }
}

// 3数据库操作
class Dog {
  final int id;
  final String name;
  final int age;

  Dog({this.id, this.name, this.age});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
    };
  }
}

void _dbFuncList() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 打开数据库
  final Future<Database> database = openDatabase(
    join(await getDatabasesPath(), 'dog.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
      );
    },
    version: 1,
  );
  // 增
  Future<void> insetDog(Dog dog) async {
    final Database db = await database;
    await db.insert(
      'dogs',
      dog.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // 删
  Future<void> deleteDog(int id) async {
    final db = await database;
    await db.delete(
      'dogs',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  // 改
  Future<void> updateDog(Dog dog) async {
    final db = await database;
    await db.update(
      'dogs',
      dog.toMap(),
      where: "id = ?",
      whereArgs: [dog.id],
    );
  }
  // 查

  Future<List<Dog>> queryDog() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('dogs');

    return List.generate(maps.length, (index) {
      return Dog(
        id: maps[index]["id"],
        name: maps[index]["name"],
        age: maps[index]["age"],
      );
    });
  }


  var fido = Dog(id: 0,name: "fido",age: 35);

  await insetDog(fido);

  print(await queryDog());

  var fido1 = Dog(id: 0,name: "fido",age: 25);
  await updateDog(fido1);

  print(await queryDog());

  await deleteDog(fido.id);
  print(await queryDog());

}

// 2.读写文件
class PersistenceDemo2 extends StatefulWidget {
  final LocalFileStorage storage;

  const PersistenceDemo2({Key key, this.storage}) : super(key: key);

  @override
  _PersistenceDemo2State createState() => _PersistenceDemo2State();
}

class _PersistenceDemo2State extends State<PersistenceDemo2> {
  String _content;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.storage.writeDataToLocalFile('测试写入字符串到本地文件');
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    widget.storage.getDataFromLocalFile().then((value) {
      setState(() {
        _content = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.cyan,
      width: 100,
      height: 100,
      child: Center(
        child: Text("${_content}"),
      ),
    );
  }
}

class LocalFileStorage {
  // 本地文件路径
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    var file = Directory("${path}/Flutter_exercise");
    try {
      bool exists = await file.exists();
      if (!exists) {
        await file.create();
      }
    } catch (e) {}
    return File("${path}/Flutter_exercise/exercise.txt");
  }

  Future<File> writeDataToLocalFile(String data) async {
    final file = await _localFile;

    return file.writeAsString(data);
  }

  Future<String> getDataFromLocalFile() async {
    try {
      final file = await _localFile;
      String content = await file.readAsString();
      return content;
    } catch (e) {
      return "get data error ${e}";
    }
  }
}
