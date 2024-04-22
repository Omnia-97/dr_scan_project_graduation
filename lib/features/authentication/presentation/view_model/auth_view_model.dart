import 'package:dr_scan_graduation_project/features/authentication/presentation/view/registration_intro_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:dr_scan_graduation_project/core/helpers/error_handler.dart';
import 'package:dr_scan_graduation_project/core/presentation/view/home_page.dart';
import 'package:dr_scan_graduation_project/core/utils/enums.dart';
import 'package:dr_scan_graduation_project/features/authentication/data/models/user_model.dart';
import 'package:dr_scan_graduation_project/features/authentication/data/repository/authentication_repository.dart';

class AuthViewModel extends GetxController {
  AuthViewModel(this.authRepoImpl);
  final AuthRepository authRepoImpl;

  late final TextEditingController userNameController,
      phoneController,
      countryCodeController,
      birthDateController,
      diseaseController,
      emailController,
      passwordController,
      confirmPasswordController;

  final RxString userName = ''.obs;
  final RxBool isLogin = false.obs;
  final Rx<Gender> selectedGender = Rx<Gender>(Gender.male);
  final RxBool isSmoker = false.obs;

  @override
  void onInit() {
    super.onInit();
    addTextEditingControllers();
  }

  void selectMale() {
    selectedGender.value = Gender.male;
  }

  void selectFemale() {
    selectedGender.value = Gender.female;
  }

  Future<void> login() async {
    String email = emailController.text;
    String password = passwordController.text;
    final user = await authRepoImpl.login(email, password);
    user.fold((error) => ErrorHandler.handleError(error), (token) {
      Get.offAll(() => const HomePage());
      isLogin.value = true;
    });
  }

  Future<void> signUp() async {
    UserModel user = UserModel(
      name: userNameController.text,
      email: emailController.text,
      phone: '${countryCodeController.text}${phoneController.text}',
      isSmoker: isSmoker.value,
      gender: selectedGender.value,
      password: passwordController.text,
      birthDate: birthDateController.text,
      confirmPassword: confirmPasswordController.text,
      disease: diseaseController.text,
    );
    final token = await authRepoImpl.signUp(user);
    token.fold(
      (error) => ErrorHandler.handleError(error),
      (token) {
        Get.to(() => const HomePage());
        isLogin.value = true;
      },
    );
  }

  Future<void> signOut() async {
    final result = await authRepoImpl.signOut();
    result.fold((error) => ErrorHandler.handleError(error), (token) {
      Get.offAll(() => const RegistrationIntroPage());
      isLogin.value = false;
    });
    isLogin.value = false;
  }

  Future<String?> getCurrentUser() async {
    final user = await authRepoImpl.getCurrentUser();
    String? currentUser;
    user.fold(
      (error) => ErrorHandler.handleError(error),
      (token) => currentUser = token,
    );
    return currentUser;
  }

  checkAuth() async {
    final user = await getCurrentUser();
    if (user != null) {
      return const HomePage();
    } else {
      return const RegistrationIntroPage();
    }
  }

  void addTextEditingControllers() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    userNameController = TextEditingController();
    phoneController = TextEditingController();
    countryCodeController = TextEditingController();
    birthDateController = TextEditingController();
    diseaseController = TextEditingController();
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
