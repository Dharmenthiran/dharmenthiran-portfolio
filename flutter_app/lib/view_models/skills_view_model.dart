import 'package:flutter/material.dart';
import '../models/skill_models.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SkillsViewModel extends ChangeNotifier {
  final List<SkillCategory> categories = [
    SkillCategory(
      title: "Backend Development",
      icon: FontAwesomeIcons.code,
      skills: [
        Skill(name: "Python", level: 95),
        Skill(name: "Flask", level: 90),
        Skill(name: "Django", level: 90),
        Skill(name: "FastAPI", level: 85),
        Skill(name: "REST API", level: 90),
        Skill(name: "JWT", level: 90),
      ],
    ),
    SkillCategory(
      title: "Mobile & Desktop",
      icon: FontAwesomeIcons.mobileScreen,
      skills: [
        Skill(name: "Flutter", level: 85),
        Skill(name: "Dart", level: 85),
        Skill(name: "Kivy", level: 80),
        Skill(name: "PyQT", level: 75),
      ],
    ),
    SkillCategory(
      title: "Frontend Development",
      icon: FontAwesomeIcons.display,
      skills: [
        Skill(name: "HTML", level: 95),
        Skill(name: "CSS", level: 90),
        Skill(name: "JavaScript", level: 85),
        Skill(name: "Bootstrap", level: 85),
      ],
    ),
    SkillCategory(
      title: "Databases",
      icon: FontAwesomeIcons.cloud,
      skills: [
        Skill(name: "MySQL", level: 85),
        Skill(name: "SQLite", level: 80),
      ],
    ),
    SkillCategory(
      title: "Networking & Communication",
      icon: FontAwesomeIcons.networkWired,
      skills: [
        Skill(name: "WebSocket", level: 80),
        Skill(name: "TCP/IP", level: 75),
        Skill(name: "Serial Comm", level: 85),
      ],
    ),
    SkillCategory(
      title: "DevOps & Tools",
      icon: FontAwesomeIcons.wrench,
      skills: [
        Skill(name: "Git", level: 90),
        Skill(name: "Docker", level: 85),
        Skill(name: "GitHub Actions", level: 85),
      ],
    ),
    SkillCategory(
      title: "Quality Assurance",
      icon: FontAwesomeIcons.layerGroup,
      skills: [
        Skill(name: "Flutter Unit Testing", level: 85),
      ],
    ),
  ];
}
