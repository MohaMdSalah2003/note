import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:note_app/note_model.dart';

part 'addnote_state.dart';

class AddnoteCubit extends Cubit<AddnoteState> {
  AddnoteCubit() : super(AddnoteInitial());
addNote(NoteModel note){
  emit(AddnoteLoading());
  try{
 var notesBox = Hive.box("note_box");
 notesBox.add(note);  
  }
  catch(e){
    AddnoteFailure(e.toString());
  }}

}


