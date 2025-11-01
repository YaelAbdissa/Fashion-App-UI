import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

class TextFormPhoneField extends StatefulWidget {
  const TextFormPhoneField({super.key});

  @override
  State<TextFormPhoneField> createState() => TextFormdPhoneFieldState();
}

class TextFormdPhoneFieldState extends State<TextFormPhoneField> {
  Country selectedCountry = Country(
    phoneCode: '62',
    countryCode: 'ID',
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: 'Indonesia',
    example: '',
    displayName: '',
    displayNameNoCountryCode: '',
    e164Key: '',
  );

  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        // color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: Colors.white.withValues(alpha: 0.4)),
      ),
      child: Row(
        children: [
          // 🌍 Circular flag + code
          GestureDetector(
            onTap: () {
              showCountryPicker(
                context: context,
                countryListTheme: CountryListThemeData(
                  backgroundColor: Colors.black87,
                  textStyle: const TextStyle(color: Colors.white),
                  bottomSheetHeight: 500,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(25),
                  ),
                ),
                onSelect: (country) {
                  setState(() {
                    selectedCountry = country;
                  });
                },
              );
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  // Circular flag
                  // ClipOval(
                  //   child: Image.asset(
                  //     'icons/flags/png/${selectedCountry.countryCode.toLowerCase()}.png',
                  //     package:
                  //         'country_icons', // 👈 you’ll add this package below
                  //     width: 22,
                  //     height: 22,
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),

                  CircleAvatar(
                    radius: 10,
                    backgroundImage: NetworkImage(
                        "https://flagcdn.com/w40/${selectedCountry.countryCode.toLowerCase()}.png"),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '+${selectedCountry.phoneCode}',
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  const Icon(Icons.keyboard_arrow_down,
                      color: Colors.white, size: 20),
                ],
              ),
            ),
          ),
          const SizedBox(width: 20),

          // 📞 Phone Number Input
          Flexible(
            child: TextField(
              controller: phoneController,
              style: const TextStyle(color: Colors.white, fontSize: 16),
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: "834 856 346",
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
