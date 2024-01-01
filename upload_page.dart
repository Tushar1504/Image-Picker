import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  FilePickerResult? result;
  String? _fileName;
  PlatformFile? pickedfile;
  File? imageToDisplay;

  void pickFile() async {
    try {
      setState(() {});

      result = await FilePicker.platform
          .pickFiles(
        type: FileType.image,
        allowMultiple: false,
      )
          .then((value) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                actions: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Icon(Icons.close),
                          ],
                        ),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      const Text('Uploaded Image',
                      style: TextStyle(
                        fontSize: 20,
                      ),),
                      Padding(padding: EdgeInsets.symmetric(
                        vertical: 7
                      )),
                      if (value != null)
                        SizedBox(
                          height: 300,
                          width: 400,
                          child: Image.file(
                              File(value.files.first.path.toString())),
                        ),
                        Padding(padding: EdgeInsets.symmetric(
                          vertical: 7,
                        )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            height: 50,
                            width: 55,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                                child: Text(
                              'Original',
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            )),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            height: 50,
                            width: 55,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                                child: Image.asset(
                              'assets/images/user_image_frame_1.png',
                              fit: BoxFit.scaleDown,
                            )),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            height: 50,
                            width: 55,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Image.asset(
                              'assets/images/user_image_frame_2.png',
                              fit: BoxFit.scaleDown,
                            )),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            height: 50,
                            width: 55,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Image.asset(
                              'assets/images/user_image_frame_3.png',
                              fit: BoxFit.scaleDown,
                            )),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            height: 50,
                            width: 55,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Image.asset(
                              'assets/images/user_image_frame_4.png',
                              fit: BoxFit.scaleDown,
                            )),
                          ),
                        ],
                      ),
                      Padding(padding: EdgeInsets.symmetric(
                        vertical: 5,
                      )),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                            if (value != null) {
                              _fileName = value.files.first.name;
                              pickedfile = value.files.first;
                              imageToDisplay =
                                  File(pickedfile!.path.toString());

                              print('File Name $_fileName');
                            }
                            setState(() {});
                          },
                          child: const Text('Use this image'))
                    ],
                  ),
                ],
              );
            });
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            SystemNavigator.pop();
          },
          child: const Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
        title: Text(
          "Images / Icon",
          style: GoogleFonts.abel(
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.normal,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 130,
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 15),
                    child: const Text(
                      'Upload Image',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 75,
                    ),
                    child: ElevatedButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.lightGreen,
                          backgroundColor: Color.fromARGB(255, 24, 145, 114),
                        ),
                        onPressed: () {
                          pickFile();
                        },
                        child: const Text(
                          'Choose from Device',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        )),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 8,
              )
              ),
            if (pickedfile != null)
              SizedBox(
                height: 500,
                width: 400,
                child: Image.file(imageToDisplay!),
              ),
          ],
        ),
      ),
    );
  }
}