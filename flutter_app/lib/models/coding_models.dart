class CodingProfile {
  final String platform;
  final String username;
  final Map<String, String> stats;
  final String link;
  final String color; // 'primary', 'secondary', 'accent'

  CodingProfile({
    required this.platform,
    required this.username,
    required this.stats,
    required this.link,
    required this.color,
  });
}

class Achievement {
  final String title;
  final String platform;
  final String date;

  Achievement({
    required this.title,
    required this.platform,
    required this.date,
  });
}
