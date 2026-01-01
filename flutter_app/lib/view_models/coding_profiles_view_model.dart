import 'package:flutter/material.dart';
import '../models/coding_models.dart';

class CodingProfilesViewModel extends ChangeNotifier {
  final List<CodingProfile> profiles = [
    CodingProfile(
      platform: "LeetCode",
      username: "@dharmenthiran",
      stats: {
        "solved": "450+",
        "rank": "Top 5%",
        "contests": "25",
      },
      link: "https://leetcode.com/u/dharmenthiran/",
      color: "primary",
    ),
    CodingProfile(
      platform: "GitHub",
      username: "@dharmenthiran-t",
      stats: {
        "repos": "50+",
        "stars": "200+",
        "contributions": "1000+",
      },
      link: "https://github.com/Dharmenthiran",
      color: "secondary",
    ),
    CodingProfile(
      platform: "HackerRank",
      username: "@dharmenthiran",
      stats: {
        "stars": "5 ⭐",
        "badges": "25+",
        "rank": "Gold",
      },
      link: "https://www.hackerrank.com/profile/tdharmenthiran",
      color: "accent",
    ),
    CodingProfile(
      platform: "CodeChef",
      username: "@dharmen_t",
      stats: {
        "rating": "1850",
        "stars": "4 ⭐",
        "problems": "200+",
      },
      link: "https://www.codechef.com/users/dharmen_t",
      color: "primary",
    ),
  ];

  final List<Achievement> achievements = [
    Achievement(
      title: "Global Rank #250",
      platform: "LeetCode Weekly Contest",
      date: "2024",
    ),
    Achievement(
      title: "Problem Solving (Gold)",
      platform: "HackerRank",
      date: "2023",
    ),
    Achievement(
      title: "Open Source Contributor",
      platform: "GitHub",
      date: "2022-2024",
    ),
  ];
}
