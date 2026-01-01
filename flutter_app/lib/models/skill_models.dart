class Skill {
  final String name;
  final int level;

  Skill({required this.name, required this.level});
}

class SkillCategory {
  final String title;
  final List<Skill> skills;
  final dynamic icon; // We'll use IconData

  SkillCategory({required this.title, required this.skills, required this.icon});
}
