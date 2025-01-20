class ModelSubscription {
  final String title;
  final String icon;
  final String currency;
  final String ammount;
  final DateTime renewalDate;
  final String renewalFrequency;
  final String accountUID;

  const ModelSubscription({
    required this.title,
    required this.icon,
    required this.currency,
    required this.ammount,
    required this.renewalDate,
    required this.renewalFrequency,
    required this.accountUID,
  });

  ModelSubscription.fromJson(Map<String, Object?> json)
      : this(
          title: json['title']! as String,
          icon: json['icon']! as String,
          currency: json['currency']! as String,
          ammount: json['ammount']! as String,
          renewalDate: DateTime.parse(json["renewalDate"] as String),
          renewalFrequency: json['renewalFrequency']! as String,
          accountUID: json['accountUID']! as String,
        );

  Map<String, Object?> toJson() => {
        'title': title,
        'icon': icon,
        "currency": currency,
        "ammount": ammount,
        "renewalDate": renewalDate,
        "renewalFrequency": renewalFrequency,
        "accountUID": accountUID,
      };
}
