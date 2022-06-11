import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:n7geekstalk/allConstants/all_constants.dart';
import 'package:n7geekstalk/providers/auth_provider.dart';
import 'package:n7geekstalk/screens/home_page.dart';
import 'package:n7geekstalk/screens/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      checkSignedIn();
    });
  }

  void checkSignedIn() async {
    AuthProvider authProvider = context.read<AuthProvider>();
    bool isLoggedIn = await authProvider.isLoggedIn();
    if (isLoggedIn) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
      return;
    }
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Welcome to N7geeks Talk",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: Sizes.dimen_18),
            ),

            const SizedBox(
              height: 20,
            ),

            Lottie.asset('assets/images/splash1.json'),

            const SizedBox(
              height: 20,
            ),
            const Text(
              "N7geeks Community Application",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: Sizes.dimen_18),
            ),
            const SizedBox(
              height: 20,
            ),
            const CircularProgressIndicator(
              color: AppColors.lightGrey,
            ),
          ],
        ),
      ),
    );
  }
}
