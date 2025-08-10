class WindDirection {
  static String fromDegree(int? degree) {
    if (degree == null) return "Rüzgar Yönü: ---";

    final d = degree.round();

    if (d >= 337 || d < 22) return "$d° - Kuzey (N)";
    if (d >= 22 && d < 67) return "$d° - Kuzeydoğu (NE)";
    if (d >= 67 && d < 112) return "$d° - Doğu (E)";
    if (d >= 112 && d < 157) return "$d° - Güneydoğu (SE)";
    if (d >= 157 && d < 202) return "$d° - Güney (S)";
    if (d >= 202 && d < 247) return "$d° - Güneybatı (SW)";
    if (d >= 247 && d < 292) return "$d° - Batı (W)";
    if (d >= 292 && d < 337) return "$d° - Kuzeybatı (NW)";

    return "$d ° - Bilinmiyor";
  }
}
