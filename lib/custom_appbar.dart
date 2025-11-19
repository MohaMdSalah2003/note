import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({required this.icon,required this.title,super.key});
  final String title;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          GestureDetector(
             
            onTap: (){},
            child: Container(
              child: 
              Icon(icon),
            ),
          )
        ],
      ),
    );
  }}