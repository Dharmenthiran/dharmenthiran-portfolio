import 'package:flutter/material.dart';
import '../models/experience_model.dart';
import 'package:intl/intl.dart';

class ExperienceViewModel extends ChangeNotifier {
  List<Experience> get experiences => [
        Experience(
          title: "Software Developer",
          company: "SPI Equipment",
          location: "Coimbatore, Tamil Nadu, India · On-site",
          period: _formatDateRange("2024-01-01", null),
          employmentType: "Full-time",
          description:
              "Developing and maintaining software solutions using Python frameworks (Flask, Django, FastAPI) and mobile applications with Flutter. Working on full-stack solutions with MySQL and SQLite databases. Building scalable applications and implementing efficient backend systems.",
          technologies: ["Python", "Flask", "Django", "FastAPI", "Flutter", "Dart", "MySQL", "SQLite", "Git"],
          linkedin: "https://www.linkedin.com/in/dharmenthiran-t-248173276",
        ),
      ];

  String _formatDateRange(String startDate, String? endDate) {
    final start = DateTime.parse(startDate);
    final end = endDate != null ? DateTime.parse(endDate) : DateTime.now();

    final startStr = DateFormat('MMM yyyy').format(start);
    final endStr = endDate != null ? DateFormat('MMM yyyy').format(end) : 'Present';

    final duration = _calculateExperience(start, end);
    return "$startStr - $endStr · $duration";
  }

  String _calculateExperience(DateTime start, DateTime end) {
    int years = end.year - start.year;
    int months = end.month - start.month;

    if (months < 0) {
      years--;
      months += 12;
    }

    if (years == 0) {
      return "$months ${months == 1 ? 'mo' : 'mos'}";
    } else if (months == 0) {
      return "$years ${years == 1 ? 'yr' : 'yrs'}";
    } else {
      return "$years ${years == 1 ? 'yr' : 'yrs'} $months ${months == 1 ? 'mo' : 'mos'}";
    }
  }
}
