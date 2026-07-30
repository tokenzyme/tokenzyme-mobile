import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timeago/timeago.dart';
import 'package:tokenzyme_mobile/utils/dates.dart';
import 'package:tokenzyme_mobile/utils/reown.dart';
import 'package:tokenzyme_mobile/views/app.dart';

void main() async {
  // debugPaintSizeEnabled = true;
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await dotenv.load();
  await initAppKit();
  setLocaleMessages('en_short', EnShortLookupMessages());
  setLocaleMessages('en_short_with_ago', EnShortWithAgoLookupMessages());
  setLocaleMessages('en_without_from_now', EnWithoutFromNowLookupMessages());
  runApp(ProviderScope(child: const App()));
}
