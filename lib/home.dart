import 'package:flutter/material.dart';
import 'package:note_app/cubits/view_note/view_note_cubit.dart';
import 'package:note_app/custom_appbar.dart';
import 'package:note_app/custom_bottom_sheet.dart';
import 'package:note_app/note_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'note_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {
  @override
void initState(){
  BlocProvider.of<ViewNoteCubit>(context).fetchNotes();
  super.initState();
}
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewNoteCubit(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return CustomBottomSheet();
              },
            );
          },
          child: Icon(Icons.add),
        ),
        body: Column(
          children: [
            SizedBox(height: 15),
            CustomAppbar(title: "note ", icon: Icons.search),
            Expanded(child: NoteListView()),
          ],
        ),
      ),
    );
  }
}

class NoteListView extends StatelessWidget {
   const NoteListView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewNoteCubit, ViewNoteState>(
      builder: (context, state) {
        final List<NoteModel> note = BlocProvider.of<ViewNoteCubit>(context).note?? [];
        return ListView.builder(
          itemCount:note.length ,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, top: 8),
              child:  NoteItem(note:note[index] ,),
            );
          },
        );
      },
    );
  }
}
