import 'dart:async';
import 'package:flutter/material.dart';
import 'package:plants_app/shared/components.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../shared/constants.dart';
import 'login/SignIn.dart';

class StartedPage extends StatefulWidget {
  const StartedPage({super.key});



  @override
  State<StartedPage> createState() => _StartedPageState();
}

class _StartedPageState extends State<StartedPage> {
   PageController pageController = PageController();
   int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 20, top: 20),
        //     child: InkWell(
        //       onTap: (){
        //         Navigator.pushReplacement(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context)=>SignIn())
        //         );
        //       },
        //       child: const Text(
        //         "Skip",
        //         style: TextStyle(
        //           color: Colors.grey,
        //           fontSize: 20.0,
        //           fontWeight: FontWeight.w400,
        //         ),
        //       ),
        //     ),
        //   )
        // ],
      ),
      body:
      Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            controller: pageController,
            physics: const BouncingScrollPhysics(),
            onPageChanged: (index){
              setState(() {
                currentPage = index;
              });
            },
            children: [
              createPageView(
                image: 'asset/images/plant-one.png',
                title: Constants.titleOne,
                description: Constants.descriptionOne,
              ),
              createPageView(
                image: 'asset/images/plant-two.png',
                title: Constants.titleTwo,
                description: Constants.descriptionTwo,
              ),
              createPageView(
                image: 'asset/images/plant-three.png',
                title: Constants.titleThree,
                description: Constants.descriptionThree,
              ),

            ],
          ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                     // dotColor: Colors.black,
                      dotHeight: 10,
                      dotWidth: 10,
                      activeDotColor: Colors.green,
                      dotColor: Colors.grey,
                      spacing: 20,
                      //jumpScale: 2,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: GestureDetector(
                   onTap: (){
                     if (currentPage == 2){
                       Navigator.pushReplacement(
                           context,
                           MaterialPageRoute(
                               builder: (context)=>const SignIn())
                       );
                     }
                     else{
                       pageController.nextPage(duration:
                       const Duration(milliseconds: 100),
                           curve: Curves.linear);

                     }

                  },
                    child: Container(
                      height: 60,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(20.0),
                        color: Colors.green,

                      ),
                      child: Center(
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
         // Text("data",style: TextStyle(fontSize: 100),),

        ],
      ),
    );
  }
}
