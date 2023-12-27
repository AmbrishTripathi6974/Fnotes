class NoteImpNames {
  static final String id = "id";
  static final String pin = "pin";
  static final String title = "title";
  static final String content = "content";
  static final String isArchive = "isArchive";
  static final String createdTime = "createdTime";
  static final String TableName = "Notes";

  static final List<String> values = [id, isArchive, pin, title, content, createdTime];
}

class Note {
  final int? id;
  final bool pin;
  final bool isArchive;
  final String title;
  final String content;
  final DateTime createdTime;

  Note({
    this.id,
    required this.pin,
    required this.isArchive,
    required this.title,
    required this.content,
    required this.createdTime,
  });

  Note copy({
    int? id,
    bool? pin,
    bool? isArchive,
    String? title,
    String? content,
    DateTime? createdTime,
  }) {
    return Note(
        id: id ?? this.id,
        pin: pin ?? this.pin,
        isArchive: isArchive ?? this.isArchive,
        title: title ?? this.title,
        content: content ?? this.content,
        createdTime: createdTime ?? this.createdTime);
  }

  static Note fromJson(Map<String, dynamic> json) {
  try {
    return Note(
      id: json[NoteImpNames.id] as int?,
      pin: json[NoteImpNames.pin] == 1,
      isArchive: json[NoteImpNames.isArchive] == 1,
      title: json[NoteImpNames.title] as String,
      content: json[NoteImpNames.content] as String,
      createdTime: DateTime.tryParse(json[NoteImpNames.createdTime] as String) ?? DateTime.now(),
    );
  } catch (e) {
    // Handle the error or provide a default DateTime value
    print('Error parsing date: $e');
    return Note(
      id: json[NoteImpNames.id] as int?,
      pin: json[NoteImpNames.pin] == 1,
      isArchive: json[NoteImpNames.isArchive] == 1,
      title: json[NoteImpNames.title] as String,
      content: json[NoteImpNames.content] as String,
      createdTime: DateTime.now(), // Default value or handle the error differently
    );
  }
}

  Map<String, Object?> toJson() {
    return {
      NoteImpNames.pin: pin ? 1 : 0,
      NoteImpNames.isArchive: isArchive ? 1 : 0,
      NoteImpNames.id: id,
      NoteImpNames.title: title,
      NoteImpNames.content: content,
      NoteImpNames.createdTime: createdTime.toIso8601String(),
    };
  }
}
