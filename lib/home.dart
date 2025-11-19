import 'package:flutter/material.dart';
import 'package:note_app/custom_appbar.dart';
import 'package:note_app/custom_bottom_sheet.dart';
import 'package:note_app/note_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     floatingActionButton: FloatingActionButton(onPressed: (){
       showModalBottomSheet(context: context,
        builder: (context){
         return CustomBottomSheet();
       });
     },child: Icon(Icons.add),),
      body: Column(
        children: [
          SizedBox(height: 15,),
          CustomAppbar(title: "note ",icon: Icons.search,),
          Expanded(child: NoteListView())
        ],
      ),
    );
  }
}
class NoteListView extends StatelessWidget {
  const NoteListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return Padding(
        padding: const EdgeInsets.only(left:8.0,right: 8,top: 8),
        child: const NoteItem(),
      );
    },);
  }
}