import { motion } from "framer-motion";
import { ExternalLink, Github } from "lucide-react";
import { Card } from "@/components/ui/card";
import { Button } from "@/components/ui/button";

const Projects = () => {
  const projects = [
    {
      title: "Ollama AI Chat System",
      description: "Full-stack, 100% locally-hosted AI chat application powered by Ollama and DeepSeek-R1 with a FastAPI streaming backend, SQLite session history, and a modern Flutter client.",
      tags: ["FastAPI", "Python", "Flutter", "Dart", "Ollama", "DeepSeek-R1"],
      github: "https://github.com/Dharmenthiran/Ollama_AI_System",
      demo: null,
    },
    {
      title: "Aetheria Notebook (NotebookLM Rebuild)",
      description: "Source-grounded AI research assistant inspired by Google NotebookLM. Features multi-source ingestion (PDF, YouTube transcripts, Web), verifiable citations, and dual-host Audio Overview podcasts.",
      tags: ["Node.js", "Express", "JavaScript", "PDF.js", "YouTube API"],
      github: "https://github.com/Dharmenthiran/REA_NoteBookLLM",
      demo: null,
    },
    {
      title: "FluentFlow",
      description: "An interactive English communication learning platform featuring vocabulary modules, grammar lessons, tenses, real-time conversation practice, and 3D animations.",
      tags: ["React", "TypeScript", "Tailwind CSS", "Vite", "Three.js"],
      github: "https://github.com/Dharmenthiran/fluent-flow.git",
      demo: "https://speakzen.lovable.app",
    },
    {
      title: "Portfolio Website",
      description: "Modern, dual-stack portfolio engineered with Flutter Web & React/TypeScript with Tailwind CSS, featuring particle animations, dark/light themes, and responsive design.",
      tags: ["Flutter", "Dart", "React", "TypeScript", "Tailwind CSS"],
      github: "https://github.com/Dharmenthiran/dharmenthiran-portfolio",
      demo: "https://dharmenthiran-t-portfolio.web.app/",
    },
    {
      title: "Makeup | Artist Website",
      description: "A luxury bridal makeup artist web platform built with React, Three.js, and Supabase. Features interactive 3D elements, appointment booking workflows, and client galleries.",
      tags: ["React", "TypeScript", "Tailwind CSS", "Vite", "Three.js", "Supabase"],
      github: "https://github.com/Dharmenthiran/make_up_artist_website",
      demo: "https://artbynila-glow.lovable.app/",
    },
    {
      title: "E-Commerce",
      description: "Full-stack e-commerce web platform built with Django & Python. Features product browsing, shopping cart, user authentication, checkout system, and an admin dashboard.",
      tags: ["Django", "Python", "SQLite", "JavaScript", "HTML/CSS"],
      github: "https://github.com/Dharmenthiran/E-Commerce",
      demo: "https://e-commerce-rho-three-98.vercel.app",
    },
    {
      title: "Expensive Tracker",
      description: "Offline expense tracking application built with Flutter, Riverpod, and Drift (SQLite ORM). Features daily expense logging, analytics charts, and PDF/Excel report export.",
      tags: ["Flutter", "Dart", "Riverpod", "Drift (SQLite)", "fl_chart"],
      github: "https://github.com/Dharmenthiran/My_Expense_Tracker.git",
      demo: null,
    },
    {
      title: "Grocery Shopping",
      description: "Multi-branch online grocery ordering web system built with PHP and MySQL. Includes user authentication, product catalog, cart management, and order tracking.",
      tags: ["PHP", "MySQL", "JavaScript", "HTML/CSS", "Bootstrap"],
      github: "https://github.com/Dharmenthiran/Grocery_Shopping",
      demo: null,
    },
    {
      title: "Flutter Responsive Window",
      description: "Adaptive Flutter dashboard application demonstrating responsive window management, adaptive layouts, and interactive charts across mobile, tablet, and desktop viewports.",
      tags: ["Flutter", "Dart", "Provider", "fl_chart", "Responsive UI"],
      github: "https://github.com/Dharmenthiran/FlutterResponsiveWindow",
      demo: null,
    },
  ];

  const containerVariants = {
    hidden: { opacity: 0 },
    visible: {
      opacity: 1,
      transition: {
        staggerChildren: 0.1,
      },
    },
  };

  const itemVariants = {
    hidden: { opacity: 0, y: 20 },
    visible: { opacity: 1, y: 0 },
  };

  return (
    <div className="min-h-screen pt-24 md:pt-32 pb-20 md:pb-20">
      <div className="container mx-auto px-4">
        <motion.div
          initial={{ opacity: 0, y: -20 }}
          animate={{ opacity: 1, y: 0 }}
          className="text-center mb-12 md:mb-16"
        >
          <h1 className="text-3xl sm:text-4xl md:text-5xl lg:text-6xl font-bold mb-3 md:mb-4">
            <span className="gradient-text">My Projects</span>
          </h1>
          <p className="text-base sm:text-lg md:text-xl text-muted-foreground max-w-2xl mx-auto px-4">
            A collection of my recent work showcasing full-stack development, mobile apps, and API services
          </p>
        </motion.div>

        <motion.div
          variants={containerVariants}
          initial="hidden"
          animate="visible"
          className="grid md:grid-cols-2 lg:grid-cols-3 gap-6"
        >
          {projects.map((project, index) => (
            <motion.div
              key={index}
              variants={itemVariants}
              whileHover={{ scale: 1.05, rotateY: 5 }}
              className="group"
            >
              <Card className="glass p-6 h-full flex flex-col justify-between hover:glow-primary transition-all duration-300">
                <div>
                  <h3 className="text-2xl font-bold mb-3 group-hover:text-primary transition-colors">
                    {project.title}
                  </h3>
                  <p className="text-muted-foreground mb-4">
                    {project.description}
                  </p>
                  <div className="flex flex-wrap gap-2 mb-4">
                    {project.tags.map((tag) => (
                      <span
                        key={tag}
                        className="px-3 py-1 text-xs rounded-full bg-primary/20 text-primary border border-primary/30"
                      >
                        {tag}
                      </span>
                    ))}
                  </div>
                </div>
                <div className="flex gap-3 mt-4">
                  <Button 
                    variant="outline" 
                    size="sm" 
                    className="flex-1 border-primary/50 hover:bg-primary/10"
                    asChild
                  >
                    <a href={project.github} target="_blank" rel="noopener noreferrer" className="flex items-center justify-center">
                      <Github className="mr-2 h-4 w-4" />
                      View Code
                    </a>
                  </Button>
                  {project.demo && (
                    <Button size="sm" className="flex-1 glow-primary" asChild>
                      <a href={project.demo} target="_blank" rel="noopener noreferrer" className="flex items-center justify-center">
                        <ExternalLink className="mr-2 h-4 w-4" />
                        Demo
                      </a>
                    </Button>
                  )}
                </div>
              </Card>
            </motion.div>
          ))}
        </motion.div>
      </div>
    </div>
  );
};

export default Projects;
