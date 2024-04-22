import 'dart:io';
import 'dart:ui';
import 'package:dr_scan_graduation_project/core/utils/constants.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/custom_button.dart';
import 'package:dr_scan_graduation_project/core/presentation/widgets/nav_bar.dart';
import 'package:dr_scan_graduation_project/features/medical_diagnosis/presentation/view/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:text_divider/text_divider.dart';

class MedicalAnalysisPage extends StatefulWidget {
  const MedicalAnalysisPage({Key? key}) : super(key: key);
  static String id = 'MedicalAnalysisPage';

  @override
  State<MedicalAnalysisPage> createState() => _MedicalAnalysisPageState();
}

class _MedicalAnalysisPageState extends State<MedicalAnalysisPage> {
  File? imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Stack(children: [
        Positioned(
          left: 32,
          top: 142,
          child: Image.asset(
            'assets/images/medical_analysis.png',
          ),
        ),
        Column(
          children: [
            const SizedBox(
              height: 95,
            ),
            const Center(
                child: Text(
              'Medical Analysis',
              style: TextStyle(
                  letterSpacing: .8,
                  fontFamily: kRoboto,
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: kWhiteColor),
            )),
            const SizedBox(
              height: 365,
            ),
            const Text(
              'You need to upload your',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: kRoboto,
                  color: kWhiteColor),
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(
              'Medical Test Result ',
              style: TextStyle(
                  letterSpacing: 1,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  fontFamily: kRoboto,
                  color: kWhiteColor),
            ),
            const SizedBox(
              height: 12,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Center(
                child: Text(
                  """To read your medical test, you must upload your medical test, So we put to you some options to       
                                 upload test . """,
                  style: TextStyle(
                      height: 1.6,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: kRoboto,
                      color: Color(0xffEBEBEB)),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                    barrierColor: const Color(0xff2C2C2C).withOpacity(.5),
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                        child: AlertDialog(
                            insetPadding: const EdgeInsets.symmetric(
                                vertical: 94, horizontal: 10),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12))),
                            title: Row(
                              children: [
                                const SizedBox(
                                  width: 7,
                                ),
                                const Text(
                                  'To upload your test',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: kRoboto,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  width: 97,
                                ),
                                IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Icon(Icons.cancel_outlined))
                              ],
                            ),
                            content: Column(
                              children: [
                                Image.asset('assets/images/medical_scan.png'),
                                Button(
                                  ontap: () {
                                    getImage(source: ImageSource.camera);
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        context = context;
                                        return const LoadingPage();
                                      },
                                    );
                                  },
                                  icon: const Icon(Icons.camera_alt_outlined),
                                  iconText: 'Use camera',
                                  width: 54,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                TextDivider.horizontal(
                                    text: const Text(
                                      ' OR',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13,
                                        fontFamily: kRoboto,
                                      ),
                                    ),
                                    thickness: 1,
                                    color: const Color(0xff565656),
                                    indent: 8,
                                    endIndent: 8),
                                const SizedBox(
                                  height: 30,
                                ),
                                Button(
                                  ontap: () =>
                                      getImage(source: ImageSource.gallery),
                                  icon: const Icon(FontAwesomeIcons.filePdf),
                                  iconText: 'Upload file / photo',
                                  width: 35,
                                ),
                              ],
                            )),
                      );
                    });
              },
              child: CustomButton(
                text: 'Next',
                size: 16,
                width: 315,
                height: 47,
                color: kWhiteColor,
                borderRadius: 10,
                textColor: const Color(0xff3D5B59),
                borderColor: kWhiteColor,
                fontweight: FontWeight.w600,
              ),
            )
          ],
        ),
      ]),
      bottomNavigationBar: NavBar( 
        istabbed1: false,
        istabbed2: false,
        istabbed: false,
        istabbed3: true,
      ),
    );
  }

  void getImage({required ImageSource source}) async {
    final file = await ImagePicker().pickImage(
      source: source,
    );

    if (file?.path != null) {
      setState(() {
        imageFile = File(file!.path);
      });
    }
  }
}

class Button extends StatelessWidget {
  Button(
      {super.key,
      required this.icon,
      required this.iconText,
      required this.width,
      this.ontap});
  Widget icon;
  String iconText;
  double width;
  var ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        width: 300,
        height: 45,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              blurRadius: 13,
              offset: const Offset(0, 1),
            )
          ],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: IconButton(
                onPressed: () {},
                icon: icon,
                color: kWhiteColor,
              ),
            ),
            SizedBox(
              width: width,
            ),
            Text(
              iconText,
              style: const TextStyle(
                  fontSize: 16,
                  fontFamily: kRoboto,
                  fontWeight: FontWeight.w600,
                  color: kWhiteColor),
            ),
          ],
        ),
      ),
    );
  }
}
