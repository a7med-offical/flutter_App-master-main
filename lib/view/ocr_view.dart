import 'dart:io';
import 'package:bldapp/view/DonationView.dart';
import 'package:bldapp/view/chat_bot.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class OCR_View extends StatefulWidget {
  const OCR_View({super.key});

  @override
  _OCR_ViewState createState() => _OCR_ViewState();
}

class _OCR_ViewState extends State<OCR_View>
    with SingleTickerProviderStateMixin {
  File? _image;
  final picker = ImagePicker();

  num x1 = 0;
  num x2 = 0;
  num x3 = 0;
  num x4 = 0;

  bool textScanning = false;

  XFile? imageFile;

  String scannedText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('CBC Test Donation'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.grey[400],
            // ignore: sort_child_properties_last
            child: Center(
              child: imageFile == null
                  ? const Text('No image selected.')
                  : Image.file(
                      File(imageFile!.path),
                      fit: BoxFit.fill,
                    ),
            ),

            width: 200,
            height: 300,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.grey[400],
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                    ),
                    onPressed: () {
                      getImage(ImageSource.gallery);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.image,
                            size: 30,
                          ),
                          Text(
                            "Gallery",
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey[600]),
                          )
                        ],
                      ),
                    ),
                  )),
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shadowColor: Colors.grey[400],
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                    ),
                    onPressed: () {
                      getImage(ImageSource.camera);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.camera_alt,
                            size: 30,
                          ),
                          Text(
                            "Camera",
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey[600]),
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  void getImage(ImageSource source) async {
    try {
      final pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage != null) {
        textScanning = true;
        imageFile = pickedImage;
        setState(() {});
        getRecognisedText(pickedImage);
      }
    } catch (e) {
      textScanning = false;
      imageFile = null;
      scannedText = "Error occured while scanning";
      setState(() {});
    }
  }

  void getRecognisedText(XFile image) async {
    try {
      final inputImage = InputImage.fromFilePath(image.path);
      final textDetector = GoogleMlKit.vision.textRecognizer();
      RecognizedText recognisedText =
          await textDetector.processImage(inputImage);
      await textDetector.close();

      List<num> numbersList = [];

      for (TextBlock block in recognisedText.blocks) {
        for (TextLine line in block.lines) {
          String lineText = line.text.trim();
          RegExp regExp = RegExp(r'\b\d+(\.\d+)?\b');
          Iterable<Match> matches = regExp.allMatches(lineText);
          for (Match match in matches) {
            String number = match.group(0)!;
            if (number.startsWith('.') || number.endsWith('.')) {
              continue;
            }
            if (number.contains('.')) {
              numbersList.add(double.parse(number));
            } else {
              numbersList.add(int.parse(number));
            }
          }
        }
      }
      print(numbersList);

      textScanning = false;
      setState(() {
        x1 = numbersList[0];
        x2 = numbersList[1];
        x3 = numbersList[2];
        x4 = numbersList[8];

        setState(() {
          if (x1 >= 4 &&
              x1 <= 11 &&
              x2 >= 4.40 &&
              x2 <= 6 &&
              x3 >= 13.5 &&
              x3 <= 18 &&
              x4 >= 150 &&
              x4 <= 400) {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.success,
              animType: AnimType.rightSlide,
              title: 'Good analysis',
              desc: 'press Ok to complete your donation check $x1 ---$x2----$x3---$x4',
              btnCancelOnPress: () {
                Navigator.pop(context);
              },
              btnOkOnPress: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>  DonationView(HemoglobinLevel: x3.toDouble(),),
                    ));

                setState(() {});
              },
            ).show();
          } else {
            AwesomeDialog(
              context: context,
              dialogType: DialogType.warning,
              animType: AnimType.rightSlide,
              title: 'Sorry',
              desc: ' you can\'t donate press continue to check the reasons $x1----$x2----$x3---$x4 ',
              btnCancelOnPress: () {
                Navigator.pop(context);
              },
              btnOkOnPress: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChatTwoPage(),
                    ));

                setState(() {});
              },
            ).show();
          }
        });
      });
    } catch (e) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.warning,
        animType: AnimType.rightSlide,
        title: 'Error',
        desc: ' please select a valid CBC analysis $x1 ---$x2----$x3---$x4 ',
        btnCancelOnPress: () {
          Navigator.pop(context);
        },
        btnOkOnPress: () async {},
      ).show();
    }
  }
}