import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/local/app_db.dart';
import '../../../data/local/note_dao.dart';
import '../../../data/model/Note.dart';

class ItemsViewModel extends Cubit<List<Note>> {
  ItemsViewModel() : super([]) {
    _initializeItemDB();
  }

  late ItemDB itemDB;
  late NoteDAO itemDAO;

  Future<void> _initializeItemDB() async {
    itemDB = await $FloorItemDB.databaseBuilder("app_db").build();
    itemDAO = itemDB.noteDao;
    getAllData(query: "");
  }

  void getAllData({String query = ""}) {
    itemDAO.getAllItem("%$query%").listen((event) {
      state.clear();
      state.addAll(event);
      emit(event);
    });
  }

  Future<void> addNote(Note item) async {
    itemDAO.saveItem(item);
  }

  Future<void> deleteNote(Note item) async {
    itemDAO.deleteNote(item);
  }

  void updateNote({required Note item}) {
    itemDAO.update(item);
  }
}
