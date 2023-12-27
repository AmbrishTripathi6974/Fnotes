import 'package:flutter/material.dart';
import 'package:fnotes/home.dart';
import 'package:fnotes/model/my_note_model.dart';
import 'package:fnotes/services/db.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateNoteView extends StatefulWidget {
  const CreateNoteView({super.key});

  @override
  State<CreateNoteView> createState() => _CreateNoteViewState();
}

class _CreateNoteViewState extends State<CreateNoteView> {
  TextEditingController title = new TextEditingController();
  TextEditingController content = new TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    title.dispose();
    content.dispose();
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
              await NotesDatabase.instance.insertEntry(Note(
                  title: title.text,
                  content: content.text,
                  pin: false,
                  isArchive: false,
                  createdTime: DateTime.now()));
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
            },
            icon: const Icon(Icons.save_outlined),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              controller: title,
              // cursorColor: white,
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
                            ?.withOpacity(0.5),
                      ),
                ),
              ),
            ),
            Container(
              height: 300,
              child: TextField(
                controller: content,
                keyboardType: TextInputType.multiline,
                minLines: 50,
                maxLines: null,
                style: GoogleFonts.openSans(
                  textStyle: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(fontSize: 14),
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: "Note",
                  hintStyle: GoogleFonts.openSans(
                    textStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
                          fontSize: 14,
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.color
                              ?.withOpacity(0.5),
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
