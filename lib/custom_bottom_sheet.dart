import 'package:flutter/material.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(left: 15, right: 15,top: 15),
      child: SingleChildScrollView(
        child: Column(
         children: [
           
           CustomTextField(hintText: "the title",activeColor: Colors.green,),
           SizedBox(height: 5,),
           CustomTextField(hintText: "Description ",maxline: 5,activeColor: Colors.green,),
           SizedBox(
             height: 20,
           ),
           CustomButton()
           
         ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
const   CustomTextField({this.activeColor=Colors.white,required this.hintText,this.maxline =1,
    super.key,
  });
final Color activeColor;
final String hintText;
final int maxline;
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxline,
      
      decoration: InputDecoration(
        hintText: hintText,
        focusedBorder:buildBorder(activeColor) ,
      
        border: buildBorder()
      ),
    );
  }
}
class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){

      },
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