import 'package:flutter/material.dart';
import 'package:note_app/edit_note_body.dart';
import 'note_model.dart';
class EditNoteView extends StatelessWidget {
  const EditNoteView({required this.note,super.key});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      body: EditViewBody(note: note,),
    );
  }
}