import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:plants_app/Modules/HomeLayout.dart';

class ScannScreen extends StatefulWidget {
  const ScannScreen({Key? key}) : super(key: key);

  @override
  State<ScannScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ScannScreen> {
  String selectedImagePath = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffc4f7ed),
      appBar: AppBar(
        backgroundColor:const Color(0xffc4f7ed) ,
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context)=>const HomeLayout(),)
              );
        },
            icon: const Icon(Icons.arrow_back,size: 30,color: Colors.black,)),
      ),
      //green.shade800,
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            selectedImagePath == ''
                ? ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                'asset/images/plant_scan.png',
                height: 350,
                width: 350,
                fit: BoxFit.cover,
              ),
            )
                : ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.file(
                  File(selectedImagePath),
                  height: 350,
                  width: 350,
                  fit: BoxFit.cover,
                )),
            const SizedBox(
              height: 25,
            ),
            // const Text(
            //   'Select Image',
            //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            // ),
            // const SizedBox(
            //   height: 20.0,
            // ),
            // ElevatedButton(
            //     style: ButtonStyle(
            //         backgroundColor: MaterialStateProperty.all(Colors.green),
            //         padding:
            //         MaterialStateProperty.all(const EdgeInsets.all(20)),
            //         textStyle: MaterialStateProperty.all(
            //             const TextStyle(fontSize: 14, color: Colors.white))),
            //     onPressed: () async {
            //       selectImage();
            //       setState(() {});
            //     },
            //     child: const Text('Select')),
            //const SizedBox(height: 10),
            AnimatedTextKit(
              animatedTexts: [
                WavyAnimatedText('Select Image ??',
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      fontFamily: 'Pacifico',
                      //color: const Color(0xffc4f7ed),
                     // backgroundColor: const Color(0xffc4f7ed)
                    )),
                // WavyAnimatedText('Look at the waves',
                //     textStyle: TextStyle(
                //       color: Colors.green[600],
                //       fontSize: 30,
                //     )),
              ],
              repeatForever: true,
              onTap: () async {
                selectImage();
                setState(() {});
              },
            ),
/*
            TextButton( onPressed: () async {
              selectImage();
              setState(() {});
            },
                child: const Text('Select Image ??',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'Pacifico'),)),*/
          ],
        ),
      ),
    );
  }

  Future selectImage() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Colors.teal,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: SizedBox(
              height: 250,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Select Image From !',
                      style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            selectedImagePath = await selectImageFromGallery();
                            print('Image_Path:-');
                            print(selectedImagePath);
                            if (selectedImagePath != '') {
                              Navigator.pop(context);
                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("No Image Selected !"),
                              ));
                            }
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'asset/images/gallery.jpg',
                                      height: 50,
                                      width: 50,
                                    ),
                                    const Text('Gallery'),
                                  ],
                                ),
                              )),
                        ),
                        GestureDetector(
                          onTap: () async {
                            selectedImagePath = await selectImageFromCamera();
                            print('Image_Path:-');
                            print(selectedImagePath);

                            if (selectedImagePath != '') {
                              Navigator.pop(context);
                              setState(() {});
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text("No Image Captured !"),
                              ));
                            }
                          },
                          child: Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'asset/images/camera.jpg',
                                      height: 50,
                                      width: 50,
                                    ),
                                    const Text('Camera'),
                                  ],
                                ),
                              )),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          );
        });
  }

  selectImageFromGallery() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }

  //
  selectImageFromCamera() async {
    XFile? file = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 10);
    if (file != null) {
      return file.path;
    } else {
      return '';
    }
  }
}
