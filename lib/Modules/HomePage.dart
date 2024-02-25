//import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
//import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
//import 'package:carousel_pro/carousel_pro.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:plants_app/Models/CacPage.dart';
import 'package:plants_app/Models/HerbPage.dart';
import 'package:plants_app/Modules/FlowePage.dart';
import 'package:plants_app/Modules/ScannPage.dart';
import 'package:plants_app/Modules/VegPage.dart';
import 'package:plants_app/shared/HomeComp.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var items = [
    Image(image: AssetImage("asset/images/grapes-2715711_1280.jpg")),
    Image(image: AssetImage("asset/images/istockphoto-124642449-1024x1024.jpg")),
    Image(image: AssetImage("asset/images/istockphoto-483451251-1024x1024.jpg")),
    Image(image: AssetImage("asset/images/istockphoto-1399364326-1024x1024.jpg")),
    Image(image: AssetImage("asset/images/istockphoto-1480690870-1024x1024.jpg")),
  ];

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: const Text("Dr Plants",style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30.0,
        ),
        ),
      ),
     body:
     Padding(
       padding: const EdgeInsets.all(8.0),
       child: SingleChildScrollView(
         child: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Padding(
               padding: const EdgeInsets.all(8.0),
               child:    CarouselSlider(
                 items: items,
                 options: CarouselOptions(
                   autoPlay: true,
                   enlargeCenterPage: true,
                   viewportFraction: .7,
                   aspectRatio:2.0,
                 ),
               ),
             ),
             SizedBox(height: 10,),
             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 children: [
                   Text("Find out what's wrong with your plant and"
                       " get a plan to bring it back to full health. ",
                     style: TextStyle(
                         fontSize: 19 ,
                     //fontWeight: FontWeight.bold,
                     color: Colors.white,
                     ),
                     maxLines: 2,
                     overflow: TextOverflow.ellipsis,
                   ),
                 SizedBox(height: 20,),
                 Container(
                   decoration: BoxDecoration(
                     color: Colors.green[400],
                     borderRadius: BorderRadiusDirectional.circular(30.0)
                   ),
                   width: double.infinity,
                   height: 50,

                   child: Center(
                     child: InkWell(
                       onTap: (){
                         Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context)=> const ScannScreen(),)
                        );
                       },
                       child: Text("Scan Now ",style: TextStyle(
                         fontSize: 20,
                         fontWeight: FontWeight.bold
                       ),
                       ),
                     ),
                   ),
                 ),
                 ],
               ),
             ),
             const SizedBox(child: Divider(
               color: Colors.white,
               //width: 20,
               thickness: .4 ,
               endIndent: 20,
               indent: 20,

             ),),

             Padding(
               padding: const EdgeInsets.all(15.0),
               child: Text("Category..",style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 30,
                 color: Colors.white,
               ),),
             ),
             Column(
               children: [
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     GestureDetector(
                       onTap: (){
                         Navigator.push(context,
                             MaterialPageRoute(builder: (context)
                             =>VegScreen(title: "Vegetables",)));
                       },
                       child: category(
                         img: "asset/images/Vegetables.webp",
                         txt: "Vegetables"
                       ),
                     ),
                     GestureDetector(
                       onTap: (){
                         Navigator.push(context,
                             MaterialPageRoute(builder: (context)
                             =>FlowScreen(title: "Flowering",)));
                       },
                       child: category(
                         txt: "Flowering",
                         img: "asset/images/Flowering.webp"
                       ),
                     ),
                   ],
                 ),
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     GestureDetector(
                       onTap: (){
                         Navigator.push(context,
                             MaterialPageRoute(builder: (context)
                             =>HerbScreen(title: "Herbs",)));
                       },
                       child: category(
                           img: "asset/images/Herbs.jpeg",
                           txt: "Herbs"
                       ),
                     ),
                     GestureDetector(
                       onTap: (){
                         Navigator.push(context,
                             MaterialPageRoute(builder: (context)
                             =>CacScreen(title: "Cacti",)));
                       },
                       child: category(
                           txt: "Cacti",
                           img: "asset/images/Cacti.jpeg"
                       ),
                     ),
                   ],
                 ),
               ],
             )
           ],
         ),
       ),
     ),


    );
  }
}
