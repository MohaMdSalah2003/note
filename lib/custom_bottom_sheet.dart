import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:note_app/cubits/add_note_cubit/addnote_cubit.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(left: 15, right: 15,top: 15),
      child: SingleChildScrollView(
        child: BlocConsumer(
          
          listener: (context, state) {
            
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: state is AddnoteLoading? true:false,
              child: AddNoteForm());
          },
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
         
         
         CustomButton(
           ontap: () {
             if(formkey.currentState!.validate()){
               formkey.currentState!.save();
             }
             else{
               autovalidateMode = AutovalidateMode.always;
               setState(() {
                 
               });
             }
           },
         )
         
       ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
const   CustomTextField({required this.errmessage,this.onsaved,this.activeColor=Colors.white,required this.hintText,this.maxline =1,
    super.key,
  });
final Color activeColor;
final String hintText;
final int maxline;
final void Function(String?)? onsaved;
final String errmessage;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
  const CustomButton({this.ontap,super.key});
  final void Function()? ontap;
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
        child: Center(child: Text("data")),
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