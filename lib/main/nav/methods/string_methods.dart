String getInitials(String name) {
  List<String> words = name.trim().split(' ');
  String initials = words.map((word) => word.isNotEmpty ? word[0] : '').join();
  return initials.toUpperCase();
}
