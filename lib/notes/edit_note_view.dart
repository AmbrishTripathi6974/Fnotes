// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:fnotes/model/my_note_model.dart';
import 'package:fnotes/note_view.dart';
import 'package:fnotes/services/db.dart';
import 'package:google_fonts/google_fonts.dart';

class EditNoteView extends StatefulWidget {
  Note note;
  EditNoteView({super.key, required this.note});

  @override
  State<EditNoteView> createState() => _EditNoteViewState();
}

class _EditNoteViewState extends State<EditNoteView> {
  late String NewTitle;
  late String NewNoteDet;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.NewTitle = widget.note.title.toString();
    this.NewNoteDet = widget.note.content.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        actions: [
          IconButton(
            splashRadius: 17,
            onPressed: () async {
              Note newNote = Note(
                  content: NewNoteDet,
                  title: NewTitle,
                  createdTime: widget.note.createdTime,
                  pin: false,
                  isArchive: false,
                  id: widget.note.id);
              await NotesDatabase.instance.updateNote(newNote);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NoteView(note: newNote)));
            },
            icon: const Icon(Icons.save_outlined),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Form(
              child: TextFormField(
                initialValue: NewTitle,
                // cursorColor: white,
                onChanged: (value){
                  NewTitle = value;
                },
                style: GoogleFonts.openSans(
                  textStyle: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontSize: 24),
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "Title",
                  hintStyle: GoogleFonts.openSans(
                    textStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 24,
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.color
                              ?.withOpacity(0.9),
                        ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.zero,
              height: 300,
              child: Form(
                child: TextFormField(
                  onChanged: (value){
                    NewNoteDet = value;
                  },
                  initialValue: NewNoteDet,
                  keyboardType: TextInputType.multiline,
                  minLines: 50,
                  maxLines: null,
                  style: GoogleFonts.openSans(
                    textStyle: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(fontSize: 16),
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: "Note",
                    hintStyle: GoogleFonts.openSans(
                      textStyle:
                          Theme.of(context).textTheme.bodyText1?.copyWith(
                                fontSize: 16,
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    ?.color
                                    ?.withOpacity(0.8),
                              ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
