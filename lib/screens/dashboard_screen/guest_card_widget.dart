import 'package:flutter/material.dart';

import '../../core/utils/custom_theme_data.dart';
import '../../core/utils/routers/app_routes.dart';
import '../../core/data_models/built_guest_model/built_guest.dart';

Card GuestCard(BuildContext context, BuiltGuest guest) {
  return Card(
    margin: const EdgeInsets.all(8),
    elevation: 5,
    child: InkWell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BoxMainDetails(title: guest.name, imagePath: 'images/check_icon.png'),
            const Divider(color: Colors.grey, thickness: 1, endIndent: 260, indent: 8),
            IntrinsicHeight(
              child: Row(
                children: [
                  BoxDetails(title: 'Phone number', subTitle: guest.phone, imagePath: 'images/call_icon.png'),
                  const VerticalDivider(color: Colors.grey, thickness: 1, endIndent: 3, indent: 3),
                  BoxDetails(title: 'Email Address', subTitle: guest.email, imagePath: 'images/alternate_email_icon.png'),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.guestDetails, arguments: guest);
      },
    ),
  );
}

class BoxMainDetails extends StatelessWidget {
  final String title;
  final String imagePath;
  const BoxMainDetails({
    super.key,
    required this.title,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            width: 22,
            image: AssetImage(imagePath),
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: CustomTextStyle.mainDetailsTextStyle,
          ),
          const SizedBox(width: 8),
          const Spacer(),
          const Icon(Icons.navigate_next),
        ],
      ),
    );
  }
}

class BoxDetails extends StatelessWidget {
  final String title;
  final String subTitle;
  final String imagePath;
  const BoxDetails({
    super.key,
    required this.title,
    required this.subTitle,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            width: 22,
            image: AssetImage(imagePath),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subTitle,
                style: CustomTextStyle.valueDetailsTextStyle,
              ),
              const SizedBox(height: 4),
              Text(
                title,
                style: CustomTextStyle.hintDetailsTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
