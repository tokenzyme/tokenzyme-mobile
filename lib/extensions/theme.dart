import 'package:flutter/material.dart';

@immutable
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  final Color buy;
  final Color sell;

  const AppThemeExtension({
    required this.buy,
    required this.sell,
  });

  @override
  AppThemeExtension copyWith({Color? buy, Color? sell}) {
    return AppThemeExtension(
      buy: buy ?? this.buy,
      sell: sell ?? this.sell,
    );
  }

  @override
  AppThemeExtension lerp(ThemeExtension<AppThemeExtension>? other, double t) {
    if (other is! AppThemeExtension) {
      return this;
    }
    return AppThemeExtension(
      buy: Color.lerp(buy, other.buy, t)!,
      sell: Color.lerp(sell, other.sell, t)!,
    );
  }

  static const AppThemeExtension light = AppThemeExtension(
    buy: Colors.green,
    sell: Colors.red,
  );

  static const AppThemeExtension dark = AppThemeExtension(
    buy: Color.fromRGBO(74, 222, 128, 1),
    sell: Color.fromRGBO(248, 113, 113, 1),
  );
}
