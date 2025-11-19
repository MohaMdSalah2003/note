import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/view_note/view_note_cubit.dart';
import 'package:note_app/edit_note_view.dart';
import 'package:note_app/note_model.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({required this.note,super.key});
  final NoteModel note;

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return  EditNoteView(note: note,);
        }));
      },
      child: Container(
       
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(15)
      ),
       
        
      
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(title: Text(note.title),
            subtitle: Text(note.description),
            trailing:IconButton(onPressed: (){
              note.delete();
              BlocProvider.of<ViewNoteCubit>(context).fetchNotes();
            }, icon:Icon(Icons.delete)),),
            Padding(
              padding: const EdgeInsets.only(right:26),
              child: Text(note.date),
            )
          ],
        )),
    );
  }
}