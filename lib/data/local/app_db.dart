import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../model/Note.dart';
import 'note_dao.dart';

part 'app_db.g.dart';

@Database(version: 2, entities: [Note])
abstract class ItemDB extends FloorDatabase {
  NoteDAO get noteDao;
}
