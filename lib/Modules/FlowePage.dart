import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:plants_app/Modules/AboutItem.dart';
import 'package:plants_app/shared/components.dart';
import 'package:plants_app/shared/constants.dart';

class FlowScreen extends StatelessWidget {
  FlowScreen({super.key,this.title,});

  String? title;
  final List<DataItem> Flowers=[
    DataItem('asset/images/Flowers/peace Lily.jpg', 'Peace Lily', 'Spathiphyllum wallisii', 'Medium', FontAwesomeIcons.cloudSun , FontAwesomeIcons.cloud),
    DataItem('asset/images/Flowers/jad_plant.jpg', 'Jade plant', 'Spathiphyllum wallisii', 'Medium', Icons.sunny, FontAwesomeIcons.cloudSun),
    DataItem('asset/images/Flowers/الجهنمية.jpg', 'الجهنمية', 'Spathiphyllum wallisii', 'Medium', Icons.sunny,FontAwesomeIcons.cloud),
    DataItem('asset/images/Flowers/gardenia.jpg', 'Gardenia', 'Spathiphyllum wallisii', 'Medium', FontAwesomeIcons.cloudSun, FontAwesomeIcons.cloud),
    DataItem('asset/images/Flowers/oilcloth.jpg', 'Oilcloth flower', 'Spathiphyllum wallisii', 'Medium', FontAwesomeIcons.cloudSun, FontAwesomeIcons.cloud),
    DataItem('asset/images/Flowers/jasmine.jpg', 'Jasmine', 'Spathiphyllum wallisii', 'Medium', FontAwesomeIcons.cloudSun, FontAwesomeIcons.sun),
    DataItem('asset/images/Flowers/flaming katy.jpg', 'Flaming Katy', 'Spathiphyllum wallisii', 'Medium', FontAwesomeIcons.cloudSun, FontAwesomeIcons.sun),
    DataItem('asset/images/Flowers/petunia.jpg', 'Petunia', 'Spathiphyllum wallisii', 'Medium', Icons.sunny, FontAwesomeIcons.cloudSun),
    DataItem('asset/images/Flowers/madagascar.jpg', 'Madagascar periwinkle', 'Spathiphyllum wallisii', 'Medium', Icons.sunny, FontAwesomeIcons.cloudSun),
    DataItem('asset/images/Flowers/poinsettia.jpg', 'Poinsettia', 'Spathiphyllum wallisii', 'Medium', FontAwesomeIcons.cloudSun, FontAwesomeIcons.sun),
    DataItem('asset/images/Flowers/sylinder.jpg', 'Cylinder Snake Plant', 'Spathiphyllum wallisii', 'Medium', Icons.sunny, FontAwesomeIcons.cloudSun),
    DataItem('asset/images/Flowers/desert rose.jpg', 'Desert Rose', 'Spathiphyllum wallisii', 'Medium', FontAwesomeIcons.cloudSun, FontAwesomeIcons.sun),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(title!,style: TextStyle(
          color: Colors.white,
          fontWeight:FontWeight.bold,
          fontSize: 20,
        ),),
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: ListView.separated(itemBuilder: (context, index) =>
      CategoryItem(Data: Flowers[index]),
          separatorBuilder: (context, index) => SizedBox(height: 15,),
          itemCount: Flowers.length),
    );
  }
}
