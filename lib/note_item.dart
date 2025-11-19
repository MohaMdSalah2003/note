import 'package:flutter/material.dart';
import 'package:note_app/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return const EditNoteView();
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
            ListTile(title: Text("data"),
            subtitle: Text("my name is mohamed salah"),
            trailing:IconButton(onPressed: (){}, icon:Icon(Icons.delete)),),
            Padding(
              padding: const EdgeInsets.only(right:26),
              child: Text('data'),
            )
          ],
        )),
    );
  }
}