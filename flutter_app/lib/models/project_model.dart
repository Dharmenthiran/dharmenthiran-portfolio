class Project {
  final String title;
  final String description;
  final List<String> tags;
  final String github;
  final String? demo;

  Project({
    required this.title,
    required this.description,
    required this.tags,
    required this.github,
    this.demo,
  });
}
