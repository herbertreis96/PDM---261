class User {
  const User({
    required this.name,
    required this.avatarUrl,
  });

  final String name;
  final String avatarUrl;
}

class Email {
  const Email({
    required this.sender,
    required this.time,
    required this.subject,
    required this.message,
  });

  final User sender;
  final String time;
  final String subject;
  final String message;
}