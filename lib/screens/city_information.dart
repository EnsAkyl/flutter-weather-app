import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:weather_app/providers/get_city_provider.dart';
import 'package:weather_app/utils/utils.dart';
import 'package:weather_app/widgets/display_color_text.dart';

class CityInformation extends ConsumerWidget {
  const CityInformation({super.key, required this.cityName});

  final String cityName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncCity = ref.watch(cityByNameProvider(cityName));

    return asyncCity.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error:
          (err, stack) =>
              Center(child: Text("Verileri Getirirken Bir Hata Oluştu : $err")),
      data: (city) {
        if (city == null) return const Center(child: Text("Şehir Bulunamadı!"));
        return SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(10),
                Container(
                  height: context.deviceSize.height * 0.37,
                  width: context.deviceSize.width,
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
          ),
        );
      },
    );
  }
}

/*return
            );*/
