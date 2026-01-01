import 'package:flutter/material.dart';
import '../models/project_model.dart';

class ProjectsViewModel extends ChangeNotifier {
  final List<Project> projects = [
    Project(
      title: "FluentFlow",
      description: "A highly interactive English communication learning platform built with React. Features vocabulary modules, grammar lessons, tenses, real-time communication examples, and immersive 3D animations.",
      tags: ["React", "TypeScript", "Tailwind CSS", "Vite", "Portfolio"],
      github: "https://github.com/Dharmenthiran/fluent-flow.git",
      demo: "https://fluent-flow.web.app/",
    ),
    Project(
      title: "Portfolio Website",
      description: "Modern, responsive portfolio website built with React, TypeScript, and Tailwind CSS. Features include dark/light mode, smooth animations, and a fully responsive design showcasing my projects and skills.",
      tags: ["React", "TypeScript", "Tailwind CSS", "Vite", "Portfolio"],
      github: "https://github.com/Dharmenthiran/dharmenthiran-portfolio",
      demo: "https://dharmenthiran-t-portfolio.web.app/",
    ),
    Project(
      title: "Makeup | Artist Website",
      description: "Modern, responsive portfolio website built with React, TypeScript, and Tailwind CSS. Features include dark/light mode, smooth animations, and a fully responsive design showcasing my projects and skills.",
      tags: ["React", "TypeScript", "Tailwind CSS", "Vite", "Website"],
      github: "https://github.com/Dharmenthiran/dharmenthiran-portfolio",
      demo: "https://makeup-artist-portfolio.web.app/",
    ),
    Project(
      title: "E-Commerce",
      description: "Full-stack e-commerce solution built with Python. Features include product management, shopping cart, and order processing.",
      tags: ["Python", "E-Commerce"],
      github: "https://github.com/Dharmenthiran/E-Commerce",
    ),
    Project(
      title: "Expensive Tracker",
      description: "Expensive Tracker is a Flutter and SQLite–based mobile and Windows app that helps users easily track, manage, and analyze their daily expenses offline.",
      tags: ["Flutter", "SQLite"],
      github: "https://github.com/Dharmenthiran/My_Expense_Tracker.git",
    ),
    Project(
      title: "Grocery Shopping",
      description: "Web application for grocery shopping with user-friendly interface. Built with modern CSS and responsive design.",
      tags: ["CSS", "Web Development"],
      github: "https://github.com/Dharmenthiran/Grocery_Shopping",
    ),
    Project(
      title: "Flutter Responsive Window",
      description: "Flutter application demonstrating responsive window management and adaptive UI design for different screen sizes.",
      tags: ["Flutter", "Dart", "Responsive Design"],
      github: "https://github.com/Dharmenthiran/FlutterResponsiveWindow",
    ),
  ];
}
