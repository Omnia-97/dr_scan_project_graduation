// import 'package:dr_scan_graduation_project/constants.dart';
// import 'package:dr_scan_graduation_project/pages/home_page.dart';
// import 'package:dr_scan_graduation_project/pages/madicalanalysis_page.dart';
// import 'package:dr_scan_graduation_project/pages/medicalDiagnosis_page.dart';
// import 'package:dr_scan_graduation_project/pages/saved_page.dart';
// import 'package:dr_scan_graduation_project/pages/setting_page.dart';
// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:line_icons/line_icons.dart';
//
// class NavBar extends StatefulWidget {
//   const NavBar({Key? key}) : super(key: key);
//   static String id = 'NavBar';
//
//   @override
//   State<NavBar> createState() => _NavBarState();
// }
//
// class _NavBarState extends State<NavBar> {
//   int _selectedIndex = 0;
//
//   static List<Widget> _widgetOptions = <Widget>[
//     SettingPage(),
//     SavedPage(),
//     MedicalDiagnosisPage(),
//     MedicalAnalysisPage(),
//
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           boxShadow: [
//             BoxShadow(
//               blurRadius: 20,
//               color: Colors.black.withOpacity(.1),
//             )
//           ],
//         ),
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
//             child: GNav(
//               rippleColor: kWhiteColor,
//               gap: 5,
//               activeColor: kPrimaryColor,
//               iconSize: 24,
//               padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
//               duration: Duration(milliseconds: 400),
//               tabBackgroundColor: kWhiteColor,
//               color: Color(0xffB9BCBE),
//               tabs: [
//                 GButton(
//                   onPressed: (){},
//                   icon: LineIcons.stethoscope,
//                   text: 'Likes',
//                   textStyle: TextStyle(
//                       fontSize: 14,
//                       fontFamily: kRoboto,
//                       color: kPrimaryColor,
//                       fontWeight: FontWeight.w600),
//                 ),
//                 GButton(
//                   icon: LineIcons.search,
//                   text: 'Search',
//                   textStyle: TextStyle(
//                       fontSize: 14,
//                       fontFamily: kRoboto,
//                       color: kPrimaryColor,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 GButton(
//                   icon: LineIcons.user,
//                   text: 'Profile',
//                   textStyle: TextStyle(
//                       fontSize: 14,
//                       fontFamily: kRoboto,
//                       color: kPrimaryColor,
//                       fontWeight: FontWeight.w600),
//                 ),
//                 GButton(
//                   icon: LineIcons.user,
//                   text: 'Profile',
//                   textStyle: TextStyle(
//                       fontSize: 14,
//                       fontFamily: kRoboto,
//                       color: kPrimaryColor,
//                       fontWeight: FontWeight.w600),
//                 ),
//               ],
//               selectedIndex: _selectedIndex,
//               onTabChange: (index) {
//                 setState(() {
//                   _selectedIndex = index;
//                 });
//               },
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// import 'package:dr_scan_graduation_project/pages/medicalDiagnosis_page.dart';
// import 'package:dr_scan_graduation_project/pages/setting_page.dart';
// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
//
//
// class NavBar extends StatefulWidget {
//   const NavBar({super.key});
//   static String id = 'NavBar';
//
//   @override
//   State<NavBar> createState() => _NavBarState();
// }
//
// class _NavBarState extends State<NavBar> {
//
//   bool status = false;
//   int index = 0;
//   @override
//   Widget build(BuildContext context) {
//     return
//       // body: _pages[_index],
//       SingleChildScrollView(
//         // scrollDirection: Axis.horizontal,
//         child: GNav(
//           // onTabChange: (index) {
//           //   setState(() {
//           //     _index = index;
//           //   });
//           // },
//           curve: Curves.easeInOut,
//           backgroundColor: Colors.black,
//           color: Colors.white,
//           activeColor: Colors.blue,
//           tabBackgroundColor: Colors.transparent,
//           gap: 3,
//           hoverColor: Colors.grey,
//           iconSize: 30,
//           tabs:  [
//             GButton(
//               text: 'HOME',
//               icon: Icons.home,
//               onPressed:(){
//                 index=1;
//               },
//             ),
//             GButton(
//               text: 'PREVIOUS',
//               icon: Icons.restart_alt,
//               onPressed:(){
//                 index=2;
//               },
//             ),
//             GButton(
//               text: 'UPCOMING',
//               icon: Icons.rocket_launch,
//               onPressed:(){
//                 setState(() {
//                   index=3;
//
//                 });
//               },
//             ),
//
//             GButton(
//               text: 'ABOUT',
//               icon: Icons.info,
//               onPressed:(){
//                 setState(() {
//                   index=4;
//
//                 });
//               },
//             ),
//           ],
//           onTabChange: pagechange(),
//         ),
//       );
//   }
//
//   pagechange() {
//     if (index==1)
//     {
//       Navigator.pushNamed(context, SettingPage.id);
//     }
//     if (index==2)
//     {
//       Navigator.pushNamed(context, MedicalDiagnosisPage.id);
//     }
//     if (index==3)
//     {
//       Navigator.pushNamed(context, SettingPage.id);
//     }
//     if (index==4)
//     {
//       Navigator.pushNamed(context, MedicalDiagnosisPage.id);
//     }
//   }
// }

import 'package:dr_scan_graduation_project/features/medical_diagnosis/presentation/view/medical_diagnosis_page.dart';
import 'package:dr_scan_graduation_project/features/medical_history/presentation/view/saved_page.dart';
import 'package:dr_scan_graduation_project/core/presentation/view/setting_page.dart';
import 'package:dr_scan_graduation_project/features/medical_test_analysis/presentation/view/madical_analysis_page.dart';
import 'package:dr_scan_graduation_project/core/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class NavBar extends StatefulWidget {
  NavBar(
      {super.key,
      required this.istabbed,
      required this.istabbed1,
      required this.istabbed2,
      required this.istabbed3});
  static String id = 'NavBar';
  bool istabbed = false;
  bool istabbed1 = false;
  bool istabbed2 = false;
  bool istabbed3 = false;
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      child: Container(
        height: 57.h,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: const Color(0xff3D5B59).withOpacity(.25),
              blurRadius: 17,
              offset: const Offset(0, -2),
              spreadRadius: 0)
        ], color: kWhiteColor, borderRadius: BorderRadius.circular(23)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.w),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.settings,
                    size: 24,
                    color: widget.istabbed
                        ? kPrimaryColor
                        : const Color(0xffB9BCBE)),
                onPressed: () {
                  Get.off(() => SettingPage());
                  setState(() {
                    widget.istabbed = true;
                    widget.istabbed1 = false;
                    widget.istabbed2 = false;
                    widget.istabbed3 = false;
                  });
                },
              ),
              Text(
                widget.istabbed ? 'Setting' : '',
                style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    fontFamily: kRoboto),
              ),
              widget.istabbed || widget.istabbed1
                  ? SizedBox(
                      width: 24.w,
                    )
                  : SizedBox(
                      width: 20.w,
                    ),
              IconButton(
                icon: Icon(FontAwesomeIcons.bookmark,
                    size: 22,
                    color: widget.istabbed1
                        ? kPrimaryColor
                        : const Color(0xffB9BCBE)),
                onPressed: () {
                  setState(() {
                    widget.istabbed1 = true;
                    Get.off(() => SettingPage());
                    widget.istabbed = false;
                    widget.istabbed2 = false;
                    widget.istabbed3 = false;
                  });
                },
              ),
              Text(
                widget.istabbed1 ? 'Saved' : '',
                style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: kRoboto),
              ),
              widget.istabbed || widget.istabbed1
                  ? SizedBox(
                      width: 24.w,
                    )
                  : SizedBox(
                      width: 20.w,
                    ),
              IconButton(
                icon: Icon(LineIcons.stethoscope,
                    size: 26,
                    color: widget.istabbed2
                        ? kPrimaryColor
                        : const Color(0xffB9BCBE)),
                onPressed: () {
                  setState(() {
                    Get.off(() => const MedicalDiagnosisPage());

                    widget.istabbed2 = true;
                    widget.istabbed1 = false;
                    widget.istabbed = false;
                    widget.istabbed3 = false;
                  });
                },
              ),
              Text(
                widget.istabbed2 ? 'Diagnosis' : '',
                style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: kRoboto),
              ),
              widget.istabbed || widget.istabbed1
                  ? SizedBox(
                      width: 24.w,
                    )
                  : SizedBox(
                      width: 20.w,
                    ),
              IconButton(
                icon: Icon(FontAwesomeIcons.fileMedical,
                    size: 22,
                    color: widget.istabbed3
                        ? kPrimaryColor
                        : const Color(0xffB9BCBE)),
                onPressed: () {
                  setState(() {
                    Get.off(() => const MedicalAnalysisPage());
                    widget.istabbed3 = true;
                    widget.istabbed1 = false;
                    widget.istabbed2 = false;
                    widget.istabbed = false;
                  });
                },
              ),
              Text(
                widget.istabbed3 ? 'Analysis' : '',
                style: const TextStyle(
                    color: kPrimaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    fontFamily: kRoboto),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
