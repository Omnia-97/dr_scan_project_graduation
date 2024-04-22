import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:dr_scan_graduation_project/core/utils/binding.dart';
import 'package:dr_scan_graduation_project/core/utils/firebase_options.dart';
import 'package:dr_scan_graduation_project/features/authentication/presentation/view_model/auth_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Binding().dependencies();
  final intialRoute = await sl<AuthViewModel>().checkAuth();
  runApp(DrScan(intialScreen: intialRoute));
}

class DrScan extends StatelessWidget {
  final Widget intialScreen;
  const DrScan({Key? key, required this.intialScreen}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          initialBinding: Binding(),
          debugShowCheckedModeBanner: false,
          home: intialScreen,
        );
      },
    );
  }
}
