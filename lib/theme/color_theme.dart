// import 'package:flutter/material.dart';
// import 'package:nostr_app/theme/light_colors.dart';
//
// enum ThemeType {
//   light,
// }
//
// extension ThemeTypeExt on ThemeType {
//   static ThemeType fromName(String name) {
//     switch (name) {
//       case "light":
//         return ThemeType.light;
//       default:
//         throw ArgumentError("Invalid theme name");
//     }
//   }
//
//   NostrColorTheme get colorTheme {
//     switch (this) {
//       case ThemeType.light:
//         return LightColors();
//     }
//   }
// }
//
// abstract class NostrColorTheme {
//   ThemeType get themeType;
//
//   Color get background;
//   Color get backgroundAppBar;
// }
