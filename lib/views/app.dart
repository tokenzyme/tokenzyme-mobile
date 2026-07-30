import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tokenzyme_mobile/constants/app_padding.dart';
import 'package:tokenzyme_mobile/constants/app_radius.dart';
import 'package:tokenzyme_mobile/constants/branding.dart';
import 'package:tokenzyme_mobile/extensions/theme.dart';
import 'package:tokenzyme_mobile/hooks/use_route_visibility.dart';
import 'package:tokenzyme_mobile/providers/providers.dart';
import 'package:tokenzyme_mobile/utils/graphql.dart';
import 'package:tokenzyme_mobile/views/splash.dart';

class App extends HookConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<ThemeMode> themeAsyncValue = ref.watch(themeProvider);

    ValueNotifier<GraphQLClient> gqlClient = useMemoized(
      () => ValueNotifier<GraphQLClient>(getGqlClient()),
      <dynamic>[],
    );

    ThemeData getThemeData(Brightness brightness) => useMemoized(
          () {
            ColorScheme colorScheme = ColorScheme.fromSeed(
              seedColor: Colors.blueAccent,
              brightness: brightness,
              dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
            );
            return ThemeData(
              fontFamily: 'Ubuntu',
              colorScheme: colorScheme,
              extensions: <ThemeExtension<dynamic>>[
                brightness == Brightness.light ? AppThemeExtension.light : AppThemeExtension.dark,
              ],
              filledButtonTheme: FilledButtonThemeData(
                style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.sm)),
                ),
              ),
              outlinedButtonTheme: OutlinedButtonThemeData(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppRadius.sm)),
                ),
              ),
              inputDecorationTheme: InputDecorationTheme(
                contentPadding: EdgeInsets.symmetric(horizontal: AppPadding.content, vertical: 0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                  borderSide: BorderSide(color: colorScheme.outlineVariant),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                  borderSide: BorderSide(color: colorScheme.outlineVariant),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                  borderSide: BorderSide(color: colorScheme.error),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppRadius.sm),
                  borderSide: BorderSide(color: colorScheme.error),
                ),
              ),
              cardTheme: CardThemeData(margin: EdgeInsets.zero),
              useMaterial3: true,
            );
          },
          <dynamic>[],
        );

    return GraphQLProvider(
      client: gqlClient,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appName,
        home: const Splash(),
        themeMode: themeAsyncValue.hasValue ? themeAsyncValue.requireValue : ThemeMode.system,
        theme: getThemeData(Brightness.light),
        darkTheme: getThemeData(Brightness.dark),
        navigatorObservers: <NavigatorObserver>[routeObserver],
      ),
    );
  }
}
