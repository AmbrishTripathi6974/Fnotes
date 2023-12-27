import 'package:fnotes/model/my_note_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._init();
  static Database? _database;
  NotesDatabase._init();

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initializeDB("NewNotes.db");
    return _database;
  }

  Future<Database?> _initializeDB(String filepath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filepath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const boolType = 'BOOLEAN NOT  NULL';
    const textType = 'TEXT NOT NULL';
    await db.execute('''CREATE TABLE Notes(
      ${NoteImpNames.id} $idType,
      ${NoteImpNames.pin} $boolType,
      ${NoteImpNames.isArchive} $boolType,
      ${NoteImpNames.title} $textType,
      ${NoteImpNames.content} $textType,
      ${NoteImpNames.createdTime} $textType
    )''');
  }

  Future<Note?> insertEntry(Note note) async {
    final db = await instance.database;
    final id = await db!.insert(NoteImpNames.TableName, note.toJson());
    return note.copy(id: id);
  }

  Future<List<Note>> readALLNotes() async {
    final db = await instance.database;
    final orderBy = '${NoteImpNames.createdTime} ASC';
    final query_result =
        await db!.query(NoteImpNames.TableName, orderBy: orderBy);
    return query_result.map((json) => Note.fromJson(json)).toList();
  }

  Future<Note?> readOneNote(int id) async {
    final db = await instance.database;
    final map = await db!.query(NoteImpNames.TableName,
        columns: NoteImpNames.values,
        where: '${NoteImpNames.id} = ?',
        whereArgs: [id]);
    if (map.isNotEmpty) {
      return Note.fromJson(map.first);
    } else {
      return null;
    }
  }

  Future updateNote(Note note) async {
    final db = await instance.database;
    await db!.update(NoteImpNames.TableName, note.toJson(),
        where: "${NoteImpNames.id} = ?", whereArgs: [note.id]);
  }

  Future pinNote(Note note) async {
    final db = await instance.database;
    await db!.update(NoteImpNames.TableName, {NoteImpNames.pin : !note.pin ? 1 : 0},
        where: "${NoteImpNames.id} = ?", whereArgs: [note.id]);
  }

  Future archNote(Note note) async {
    final db = await instance.database;
    await db!.update(NoteImpNames.TableName, {NoteImpNames.isArchive : !note.pin ? 1 : 0},
        where: "${NoteImpNames.id} = ?", whereArgs: [note.id]);
  }

  Future<List<int>> getNoteString(String query) async {
    final db = await instance.database;
    final result = await db!.query(NoteImpNames.TableName);
    List<int> resultIds = [];
    result.forEach((element) {
      if (element["title"].toString().toLowerCase().contains(query) ||
          element["content"].toString().toLowerCase().contains(query)) {
        resultIds.add(element["id"] as int);
      }
    });

    return resultIds;
  }

  Future delteNote(Note note) async {
    final db = await instance.database;

    await db!.delete(NoteImpNames.TableName,
        where: '${NoteImpNames.id} = ?', whereArgs: [note.id]);
  }

  Future closeDB() async {
    final db = await instance.database;
    db!.close();
  }
}
