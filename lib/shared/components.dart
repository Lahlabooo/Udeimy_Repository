
import 'package:plants_app/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plants_app/Modules/AboutItem.dart';

class createPageView extends StatelessWidget {
  const createPageView({super.key, required this.image,
    required this.title,
    required this.description,});
  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
       return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 80),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 350,
            child: Image.asset(image),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xff296e48),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
class CustomTextfield extends StatelessWidget {
  final IconData icon;
  final bool obscureText;
  final String hintText;
  final TextInputType type;
  final String? Function(String?)? validate;
  Function(String)? onChanged;

   CustomTextfield({
    Key? key, required this.icon,this.onChanged, required this.obscureText,required this.validate, required this.hintText, required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      validator:validate,
      obscureText: obscureText,
      keyboardType: type,
      style: TextStyle(
        color: Colors.black54,
      ),
      decoration: InputDecoration(
        border: InputBorder.none,
        prefixIcon: Icon(icon, color: Colors.black54.withOpacity(.3),),
        hintText: hintText,
      ),
      cursorColor: Colors.black54.withOpacity(.5),

    );
  }
}

Widget CategoryItem (
{
    DataItem? Data,
}

    )=>Padding(
  padding: const EdgeInsets.all(10.0),
  child:
     Container(
   // height: 200,
    width: double.infinity,
     child: Row(

      mainAxisSize: MainAxisSize.min,

      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Container(
          width: 120,
            height: 100,
            child: Image(image:
            AssetImage(Data!.img),
              fit:BoxFit.cover,)),
        SizedBox(width: 10,),

        Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text(Data.title,style: TextStyle(

            fontSize: 20,

            fontWeight: FontWeight.bold,

            color: Colors.white,

          ),

          ),
           SizedBox(height: 8,),
          Text(Data.subTitle,

            overflow:TextOverflow.ellipsis ,

            maxLines: 1,

            style: TextStyle(

          fontSize: 15,

           color: Colors.grey,



          ),

          ),
            SizedBox(height: 20,),

            Row(

              children: [

                Container(
                   height: 25,
                  width: 80,
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red[400]

                  ),

                  child: Center(child: Text(Data.SizeText,
                    style: TextStyle(
                      fontSize: 15,
                    ),)),

                ),
                SizedBox(width: 10,),

                Container(
                  width: 30,
                  height: 25,
                  decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(20),
                    color: Colors.white10,

                  ),


                  child: Icon(Data.icon1,color: Colors.green[200],size: 15,),

                )

              ],

            )

          ],

        )

      ],





    ),
  ),
);

