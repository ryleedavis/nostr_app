abstract class Assets {
  static const svg = _SVG();
  static const png = _PNG();
}

class _PNG {
  const _PNG();
}

class _SVG {
  const _SVG();

  String get gear => "assets/svg/gear.svg";
  String get bell => "assets/svg/bell.svg";
}
