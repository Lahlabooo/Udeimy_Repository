import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class category extends StatelessWidget {
   category({this.img,this.txt});
  String? img;
  String? txt;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,height: 150,
      child: Column(
        //alignment: AlignmentDirectional.bottomCenter,
        children: [
          Image.asset(img!,height: 120,width: 150,),
          Text(txt!,style: const TextStyle(
              color: Colors.white,
          fontSize: 18,
          ),
          ),
        ],
      ),
    );
  }
}
