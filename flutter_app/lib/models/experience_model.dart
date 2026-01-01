class Experience {
  final String title;
  final String company;
  final String location;
  final String period;
  final String description;
  final List<String> technologies;
  final String linkedin;
  final String? employmentType;

  Experience({
    required this.title,
    required this.company,
    required this.location,
    required this.period,
    required this.description,
    required this.technologies,
    required this.linkedin,
    this.employmentType,
  });
}
