import 'package:flutter/material.dart';
import 'package:note_app/custom_appbar.dart';
import 'package:note_app/custom_bottom_sheet.dart';

class EditViewBody extends StatelessWidget {
  const EditViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: 20,),
        CustomAppbar(title: "edit note",icon: Icons.done,)
        ,SizedBox(height: 20,),
        CustomTextField(hintText: 'title',),
        SizedBox(height: 50,),
        CustomTextField(hintText: 'description',maxline: 5,)
      ],
    );
  }
}