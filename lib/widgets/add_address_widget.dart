import 'package:flutter/material.dart';

class AddAddressWidget extends StatelessWidget {
  const AddAddressWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Pamuruyan, Kec. Cibadak, Kabupaten Sukabumi, Jawa Barat 43351",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
            // height: 1.3,
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 38,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(34),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/icons/icon_home_white.png",
                width: 25,
                height: 25,
              ),
              SizedBox(width: 8),
              Text(
                "Home",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: Colors.white,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
