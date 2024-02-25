import 'package:flutter/material.dart';
class Constants {

  //Onboarding texts
  static var titleOne = "Learn more about plants";
  static var descriptionOne = "Read how to care for plants in our rich plants guide.";
  static var titleTwo = "Find a plant lover friend";
  static var descriptionTwo = "Are you a plant lover? Connect with other plant lovers.";
  static var titleThree = "Plant a tree, green the Earth";
  static var descriptionThree = "Find almost all types of plants that you like here.";

}
class DataItem{
  final String img;
  final String title;
  final String subTitle;
  final String SizeText;
  final IconData icon1;
  final IconData icon2;
  const DataItem( this.img, this.title, this.subTitle,this.SizeText, this.icon1, this.icon2);

}
