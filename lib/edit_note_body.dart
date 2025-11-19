import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/view_note/view_note_cubit.dart';
import 'package:note_app/custom_appbar.dart';
import 'package:note_app/custom_bottom_sheet.dart';
import 'note_model.dart';
class EditViewBody extends StatefulWidget {
  const EditViewBody({required this.note,super.key});
 final NoteModel note;
  
  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {
   String? title;
   String? description;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: 20,),
        CustomAppbar(title: "edit note",icon: Icons.done,
        ontap: (){
          widget.note.title = title ?? widget.note.title;
          widget.note.description = description ?? widget.note.description;
        widget.note.save();
        BlocProvider.of<ViewNoteCubit>(context).fetchNotes();
        Navigator.pop(context);
        },)
        ,SizedBox(height: 20,),
        CustomTextField(
          onchange: (value){
            title =value;
          },
          
          hintText: widget.note.title,errmessage: "title ",),
        SizedBox(height: 50,),
        CustomTextField(
          onchange: (value){{
            description = value;
          }},
          hintText: widget.note.description,maxline: 5,errmessage: "description",)
      ],
    );
  }
}