// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:fnotes/archive/archive_view.dart';
import 'package:fnotes/home.dart';
import 'package:fnotes/model/my_note_model.dart';
import 'package:fnotes/notes/edit_note_view.dart';
import 'package:fnotes/services/db.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteView extends StatefulWidget {
  Note note;
  NoteView({super.key, required this.note});

  @override
  State<NoteView> createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {
  bool isPinned = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        actions: [
          IconButton(
            splashRadius: 18,
            onPressed: () async {
              await NotesDatabase.instance.pinNote(widget.note);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            icon: widget.note.pin
                ? const Icon(Icons.push_pin)
                : const Icon(Icons.push_pin_outlined),
          ),
          IconButton(
            splashRadius: 18,
            onPressed: () async {
              await NotesDatabase.instance.archNote(widget.note);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => ArchiveView()));
            },
            icon: widget.note.isArchive
                ? const Icon(Icons.archive)
                : const Icon(Icons.archive_outlined),
          ),
          IconButton(
            splashRadius: 18,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditNoteView(note: widget.note)));
            },
            icon: const Icon(Icons.edit_outlined),
          ),
          IconButton(
            splashRadius: 18,
            onPressed: () async {
              await NotesDatabase.instance.delteNote(widget.note);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            icon: const Icon(Icons.delete_forever_outlined),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.note.title,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 24,
                    color: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.color
                        ?.withOpacity(0.8),
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.note.content,
              style: GoogleFonts.openSans(
                  textStyle: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 16)),
            )
          ],
        ),
      ),
    );
  }
}
