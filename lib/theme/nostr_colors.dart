// import 'package:flutter/material.dart';
//
// import 'color_theme.dart';
//
// class NostrColors extends ThemeExtension<NostrColors> {
//   final ThemeType themeType;
//
//   final Color background;
//   final Color backgroundAppBar;
//
//   NostrColors({
//     required this.themeType,
//     required this.background,
//     required this.backgroundAppBar,
//   });
//
//   factory NostrColors.fromNostrColorTheme(NostrColorTheme colorTheme) {
//     return NostrColors(
//         themeType: colorTheme.themeType,
//         background: colorTheme.background,
//         backgroundAppBar: colorTheme.backgroundAppBar);
//   }
//
//   @override
//   ThemeExtension<NostrColors> copyWith({
//     ThemeType? themeType,
//     Color? background,
//     Color? backgroundAppBar,
//   }) {
//     return NostrColors(
//       themeType: themeType ?? this.themeType,
//       background: background ?? this.background,
//       backgroundAppBar: backgroundAppBar ?? this.backgroundAppBar,
//     );
//   }
//
//   @override
//   ThemeExtension<NostrColors> lerp(
//     covariant ThemeExtension<NostrColors>? other,
//     double t,
//   ) {
//     if (other is! NostrColors) {
//       return this;
//     }
//
//     return NostrColors(
//       themeType: other.themeType,
//       background: Color.lerp(
//         background,
//         other.background,
//         t,
//       )!,
//       backgroundAppBar: Color.lerp(
//         backgroundAppBar,
//         other.backgroundAppBar,
//         t,
//       )!,
//     );
//   }
// }
