import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../views/home/home_view.dart';
import '../views/skills/skills_view.dart';
import '../views/projects/projects_view.dart';
import '../views/experience/experience_view.dart';
import '../views/contact/contact_view.dart';
import '../views/blog/blog_view.dart';
import '../views/coding_profiles/coding_profiles_view.dart';
import '../widgets/main_layout.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const MainLayout(child: HomeView()),
      ),
      GoRoute(
        path: '/skills',
        builder: (context, state) => const MainLayout(child: SkillsView()),
      ),
      GoRoute(
        path: '/projects',
        builder: (context, state) => const MainLayout(child: ProjectsView()),
      ),
      GoRoute(
        path: '/experience',
        builder: (context, state) => const MainLayout(child: ExperienceView()),
      ),
      GoRoute(
        path: '/contact',
        builder: (context, state) => const MainLayout(child: ContactView()),
      ),
      GoRoute(
        path: '/blog',
        builder: (context, state) => const MainLayout(child: BlogView()),
      ),
      GoRoute(
        path: '/coding-profiles',
        builder: (context, state) => const MainLayout(child: CodingProfilesView()),
      ),
    ],
  );
}
