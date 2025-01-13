import 'package:flutter_svg/svg.dart';

class PreviewSubscription {
  final String title;
  final SvgPicture icon;
  final String currency;
  final String ammount;
  final int daysLeft;

  PreviewSubscription({
    required this.title,
    required this.icon,
    required this.currency,
    required this.ammount,
    required this.daysLeft,
  });
}
