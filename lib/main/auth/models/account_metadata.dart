class AccountMetadata {
  final String uid;
  final String name;
  final String lastname;
  final String username;
  final String avatarUrl;

  const AccountMetadata({
    required this.uid,
    required this.name,
    required this.lastname,
    required this.username,
    required this.avatarUrl,
  });

  AccountMetadata.fromJson(Map<String, Object?> json)
      : this(
          uid: json['uid']! as String,
          name: json['name']! as String,
          lastname: json['lastname']! as String,
          username: json['username']! as String,
          avatarUrl: json['avatarUrl']! as String,
        );

  Map<String, Object?> toJson() => {
        'uid': uid,
        'name': name,
        'lastname': lastname,
        'username': username,
        'avatarUrl': avatarUrl,
      };
}
