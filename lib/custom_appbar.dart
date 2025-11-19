import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Note app'),
          GestureDetector(
             behavior: HitTestBehavior.translucent,
            onTap: (){},
            child: Container(
              child: 
              Icon(Icons.search),
            ),
          )
        ],
      ),
    );
  }}