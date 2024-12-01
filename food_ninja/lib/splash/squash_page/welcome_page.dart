import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_ninja/core/images/app_vectors.dart';
import 'package:food_ninja/splash/widgets/splash.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  // @override
  // void initState() {
  //   super.initState();
  //   _dismissKeyBoard();
  // }

  // Future<void> _dismissKeyBoard() async {
  //   SystemChannels.textInput.invokeMethod('TextInput.hide');
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     FocusManager.instance.primaryFocus?.unfocus();
  //   });
    // FocusScope.of(context).requestFocus(FocusNode());
  // }
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.light
        ? AppVectors.welcomeImage
        : AppVectors.darkWelcomeImage;
    const String title = "Find your  Comfort\nFood here";
    const String buttonName = "Next";
    const String subTitle =
        "Here You Can find a chef or dish for every\ntaste and color. Enjoy!";

    void onPressed() {
      Navigator.pushNamedAndRemoveUntil(
          context, "/welcome_next", (route) => false);
    }

    return Scaffold(
      body: Splash(
        isDark: isDark,
        title: title,
        buttonName: buttonName,
        subTitle: subTitle,
        onPressed: onPressed,
      ),
    );
  }
}
