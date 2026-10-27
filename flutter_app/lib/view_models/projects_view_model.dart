import 'package:flutter/material.dart';
import '../models/project_model.dart';

class ProjectsViewModel extends ChangeNotifier {
  final List<Project> projects = [
    Project(
      title: "Ollama AI Chat System",
      description:
          "Full-stack, 100% locally-hosted AI chat application powered by Ollama and DeepSeek-R1 with a FastAPI streaming backend, SQLite session history, and a modern Flutter client.",
      tags: ["FastAPI", "Python", "Flutter", "Dart", "Ollama", "DeepSeek-R1"],
      github: "https://github.com/Dharmenthiran/Ollama_AI_System",
    ),
    Project(
      title: "Aetheria Notebook (NotebookLM Rebuild)",
      description:
          "Source-grounded AI research assistant inspired by Google NotebookLM. Features multi-source ingestion (PDF, YouTube transcripts, Web), verifiable citations, and dual-host Audio Overview podcasts.",
      tags: ["Node.js", "Express", "JavaScript", "PDF.js", "YouTube API"],
      github: "https://github.com/Dharmenthiran/REA_NoteBookLLM",
    ),
    Project(
      title: "FluentFlow",
      description:
          "An interactive English communication learning platform featuring vocabulary modules, grammar lessons, tenses, real-time conversation practice, and 3D animations.",
      tags: ["React", "TypeScript", "Tailwind CSS", "Vite", "Three.js"],
      github: "https://github.com/Dharmenthiran/fluent-flow.git",
      demo: "https://speakzen.lovable.app",
    ),
    Project(
      title: "Portfolio Website",
      description:
          "Modern, dual-stack portfolio engineered with Flutter Web & React/TypeScript with Tailwind CSS, featuring particle animations, dark/light themes, and responsive design.",
      tags: ["Flutter", "Dart", "React", "TypeScript", "Tailwind CSS"],
      github: "https://github.com/Dharmenthiran/dharmenthiran-portfolio",
      demo: "https://dharmenthiran-t-portfolio.web.app/",
    ),
    Project(
      title: "Makeup | Artist Website",
      description:
          "A luxury bridal makeup artist web platform built with React, Three.js, and Supabase. Features interactive 3D elements, appointment booking workflows, and client galleries.",
      tags: ["React", "TypeScript", "Tailwind CSS", "Vite", "Three.js", "Supabase"],
      github: "https://github.com/Dharmenthiran/make_up_artist_website",
      demo: "https://artbynila-glow.lovable.app/",
    ),
    Project(
      title: "E-Commerce",
      description:
          "Full-stack e-commerce web platform built with Django & Python. Features product browsing, shopping cart, user authentication, checkout system, and an admin dashboard.",
      tags: ["Django", "Python", "SQLite", "JavaScript", "HTML/CSS"],
      github: "https://github.com/Dharmenthiran/E-Commerce",
      demo: "https://e-commerce-rho-three-98.vercel.app",
    ),
    Project(
      title: "Expensive Tracker",
      description:
          "Offline expense tracking application built with Flutter, Riverpod, and Drift (SQLite ORM). Features daily expense logging, analytics charts, and PDF/Excel report export.",
      tags: ["Flutter", "Dart", "Riverpod", "Drift (SQLite)", "fl_chart"],
      github: "https://github.com/Dharmenthiran/My_Expense_Tracker.git",
    ),
    Project(
      title: "Grocery Shopping",
      description:
          "Multi-branch online grocery ordering web system built with PHP and MySQL. Includes user authentication, product catalog, cart management, and order tracking.",
      tags: ["PHP", "MySQL", "JavaScript", "HTML/CSS", "Bootstrap"],
      github: "https://github.com/Dharmenthiran/Grocery_Shopping",
    ),
    Project(
      title: "Flutter Responsive Window",
      description:
          "Adaptive Flutter dashboard application demonstrating responsive window management, adaptive layouts, and interactive charts across mobile, tablet, and desktop viewports.",
      tags: ["Flutter", "Dart", "Provider", "fl_chart", "Responsive UI"],
      github: "https://github.com/Dharmenthiran/FlutterResponsiveWindow",
    ),
  ];
}
