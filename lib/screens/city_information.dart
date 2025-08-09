import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/utils/utils.dart';
import 'package:weather_app/widgets/display_color_text.dart';
import '../data/models/city_information_model.dart';

class CityInformation extends StatelessWidget {
  const CityInformation({super.key, required this.cityName});

  final String cityName;

  Future<CurrentCity?> _getCityByName(String cityName) async {
    final jsonCity = await rootBundle.loadString(
      "assets/data/city_information/turkiye_sehirleri_8_adet.json",
    );

    final List<dynamic> jsonList = json.decode(jsonCity);

    final List<CurrentCity> cities =
        jsonList.map((e) => CurrentCity.fromJson(e)).toList();

    try {
      return cities.firstWhere(
        (city) => city.city!.toLowerCase() == cityName.toLowerCase(),
      );
    } catch (e) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: FutureBuilder<CurrentCity?>(
        future: _getCityByName(cityName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Bir Hata Oluştu : ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.hasData == null) {
            return Center(child: Text("Şehir Bulunamadı"));
          } else {
            final city = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(10),
                  Container(
                    height: context.deviceSize.height * 0.37,
                    width: context.deviceSize.width ,
                    child: Image.asset("${city.image_path}", fit: BoxFit.fill),
                  ),
                  const Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      DisplayColorText(
                        text: "${city.city}",
                        textColor: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      const Gap(10),
                      DisplayColorText(
                        text: "(Enlem: ${city.lat}, Boylam: ${city.lng})",
                        textColor: Colors.black,
                        fontSize: 11,
                      ),
                    ],
                  ),
                  const Gap(15),
                  DisplayColorText(
                    text: "• ${city.location}",
                    textColor: Colors.black,
                    fontSize: 14,
                  ),
                  const Gap(5),
                  DisplayColorText(
                    text: "• ${city.explain}",
                    textColor: Colors.black,
                    fontSize: 14,
                  ),
                  const Gap(5),
                  DisplayColorText(
                    text: "• ${city.famous_dish}",
                    textColor: Colors.black,
                    fontSize: 14,
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
