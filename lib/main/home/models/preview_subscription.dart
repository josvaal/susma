class PreviewSubscription {
  final String title;
  final String icon;
  final String currency;
  final String ammount;
  final int daysLeft;
  final DateTime renewalDate;
  final String renewalFrequency;

  PreviewSubscription({
    required this.title,
    required this.icon,
    required this.currency,
    required this.ammount,
    required this.daysLeft,
    required this.renewalDate,
    required this.renewalFrequency,
  });
}
