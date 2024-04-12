import 'package:floor/floor.dart';

import '../../data/model/Note.dart';

@dao
abstract class NoteDAO {
  @Query('SELECT * FROM note WHERE note LIKE :query OR title LIKE :query')
  Stream<List<Note>> getAllItem(String query);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> saveItem(Note note);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> update(Note note);

  @delete
  Future<void> deleteNote(Note note);
}
