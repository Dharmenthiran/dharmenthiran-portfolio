import 'package:flutter/material.dart';
import '../models/article_model.dart';

class BlogViewModel extends ChangeNotifier {
  final List<Article> articles = [
    Article(
      title: "Building Scalable APIs with FastAPI",
      excerpt: "Learn how to create high-performance REST APIs using FastAPI, async/await patterns, and best practices for production deployment.",
      date: "Mar 15, 2024",
      readTime: "8 min read",
      category: "Backend",
    ),
    Article(
      title: "Flutter State Management Guide",
      excerpt: "A comprehensive comparison of state management solutions in Flutter - Provider, Riverpod, BLoC, and GetX with real-world examples.",
      date: "Mar 10, 2024",
      readTime: "12 min read",
      category: "Mobile",
    ),
    Article(
      title: "Django Performance Optimization",
      excerpt: "Techniques to optimize Django applications including database queries, caching strategies, and middleware optimization.",
      date: "Mar 5, 2024",
      readTime: "10 min read",
      category: "Backend",
    ),
    Article(
      title: "Flask Best Practices 2024",
      excerpt: "Modern Flask patterns, blueprint architecture, performance optimization, and best practices for building scalable Python web applications.",
      date: "Feb 28, 2024",
      readTime: "7 min read",
      category: "Backend",
    ),
    Article(
      title: "Microservices with Docker",
      excerpt: "Building and deploying microservices architecture using Docker, Docker Compose, and container orchestration.",
      date: "Feb 20, 2024",
      readTime: "15 min read",
      category: "DevOps",
    ),
    Article(
      title: "PostgreSQL Query Optimization",
      excerpt: "Advanced SQL techniques, index strategies, and query planning to improve database performance significantly.",
      date: "Feb 15, 2024",
      readTime: "11 min read",
      category: "Database",
    ),
  ];
}
