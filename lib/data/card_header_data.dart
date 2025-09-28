class CardHeaderData {
  final String title;
  final String iconPath;

  CardHeaderData({required this.title, required this.iconPath});

  static final List<CardHeaderData> headerList = [
    CardHeaderData(
      title: "Hava Durumu",
      iconPath: "assets/images/home_screen/weather_image.svg",
    ),
    CardHeaderData(
      title: "Turistik Mekanlar",
      iconPath: "assets/images/home_screen/location_image.svg",
    )
  ];
}
