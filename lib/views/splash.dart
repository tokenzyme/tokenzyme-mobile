import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:tokenzyme_mobile/views/home/home.dart';

class Splash extends HookWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        context.pushReplacement(const Home());
        WidgetsBinding.instance.addPostFrameCallback((_) {
          FlutterNativeSplash.remove();
        });
      });
      return null;
    }, <dynamic>[]);

    return const SizedBox.shrink();
  }
}
