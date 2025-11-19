import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/add_note_cubit/addnote_cubit.dart';
import 'package:note_app/cubits/view_note/view_note_cubit.dart';
import 'package:note_app/note_model.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => AddnoteCubit(),
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15,top: 15,
         bottom: MediaQuery.of(context).viewInsets.bottom),
        child: BlocListener(
          
          listener: (context, state) {
            if(state is AddnoteFailure){
              print("Failure");
            }
            if(state is AddnoteSuccess){
              BlocProvider.of<ViewNoteCubit>(context).fetchNotes();
              Navigator.pop(context);
            }
          },
          child: SingleChildScrollView(child: AddNoteForm())
          ,
          ),
      ),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title , description;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autovalidateMode,
      key: formkey,
      child: Column(
       children: [
         
         CustomTextField(
           errmessage: "title",
           onsaved: (value){
             title = value;
           },
           hintText: "the title",activeColor: Colors.green,),
         SizedBox(height: 5,),
         CustomTextField(
           errmessage: "decription",
           onsaved: (value) {
             description = value;
           },
           hintText: "Description ",maxline: 5,activeColor: Colors.green,),
         
         
         BlocBuilder<AddnoteCubit,AddnoteState>(
        builder: (context, state) {
          return CustomButton(
            isloading: state is AddnoteLoading ? true: false,
             ontap: () {
               if(formkey.currentState!.validate()){
                 formkey.currentState!.save();
                 var noteModel = NoteModel(title: title!, description: description!, date: DateTime.now.toString());
                 BlocProvider.of<AddnoteCubit>(context).addNote(noteModel);
               }
               else{
                 autovalidateMode = AutovalidateMode.always;
                 setState(() {
                   
                 });
               }
             },
           );
        },
           
         )
         
       ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
const   CustomTextField({required this.errmessage,this.onchange,this.onsaved,this.activeColor=Colors.white,required this.hintText,this.maxline =1,
    super.key,
  });
final Color activeColor;
final String hintText;
final int maxline;
final void Function(String?)? onsaved;
final void Function(String?)? onchange;
final String errmessage;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchange,
      onSaved: onsaved,
      maxLines: maxline,
      validator: (value) {
        if(value?.isEmpty?? true){
          return "field is $errmessage";
        }
        else{
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: hintText,
        focusedBorder:buildBorder(activeColor) ,
      
        border: buildBorder()
      ),
    );
  }
}
class CustomButton extends StatelessWidget {
  const CustomButton({this.isloading = false,this.ontap,super.key});
  final void Function()? ontap;
  final bool isloading;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: ontap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        decoration: BoxDecoration(
      
          color: Colors.green,
          borderRadius: BorderRadius.circular(15)
        ),
        child: isloading? CircularProgressIndicator(): Center(child: Text('data'),),
      ),
    );
  }
}

OutlineInputBorder buildBorder([ color]){
  return OutlineInputBorder( 
          borderSide:BorderSide(
            color:color ?? Colors.white ) ,
          borderRadius: BorderRadius.circular(15),
        );
}