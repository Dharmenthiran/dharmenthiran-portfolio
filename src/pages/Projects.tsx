import { motion } from "framer-motion";
import { ExternalLink, Github } from "lucide-react";
import { Card } from "@/components/ui/card";
import { Button } from "@/components/ui/button";

const Projects = () => {
  const projects = [
    {
      title: "E-Commerce Platform",
      description: "Full-stack e-commerce solution built with Django, React, and PostgreSQL. Features include real-time inventory, payment integration, and admin dashboard.",
      tags: ["Django", "React", "PostgreSQL", "Stripe"],
      github: "#",
      demo: "#",
    },
    {
      title: "Task Management App",
      description: "Cross-platform task management application built with Flutter. Includes offline sync, push notifications, and team collaboration features.",
      tags: ["Flutter", "Firebase", "Dart"],
      github: "#",
      demo: "#",
    },
    {
      title: "AI Chatbot API",
      description: "RESTful API service powered by FastAPI and OpenAI. Provides natural language processing and conversation management with rate limiting.",
      tags: ["FastAPI", "Python", "OpenAI", "Redis"],
      github: "#",
      demo: "#",
    },
    {
      title: "Real-time Analytics Dashboard",
      description: "Interactive dashboard for data visualization with real-time updates. Built using React, D3.js, and WebSocket connections.",
      tags: ["React", "D3.js", "WebSocket", "Node.js"],
      github: "#",
      demo: "#",
    },
    {
      title: "Social Media App",
      description: "Instagram-like social media platform with photo sharing, stories, and messaging. Built with Flutter for mobile and Django for backend.",
      tags: ["Flutter", "Django", "AWS S3", "PostgreSQL"],
      github: "#",
      demo: "#",
    },
    {
      title: "Booking System",
      description: "Hotel and restaurant booking system with calendar integration, payment processing, and automated email confirmations.",
      tags: ["Django", "Celery", "Stripe", "SendGrid"],
      github: "#",
      demo: "#",
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
    <div className="min-h-screen pt-32 pb-20">
      <div className="container mx-auto px-4">
        <motion.div
          initial={{ opacity: 0, y: -20 }}
          animate={{ opacity: 1, y: 0 }}
          className="text-center mb-16"
        >
          <h1 className="text-5xl md:text-6xl font-bold mb-4">
            <span className="gradient-text">My Projects</span>
          </h1>
          <p className="text-xl text-muted-foreground max-w-2xl mx-auto">
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
                  <Button variant="outline" size="sm" className="flex-1 border-primary/50 hover:bg-primary/10">
                    <Github className="mr-2 h-4 w-4" />
                    Code
                  </Button>
                  <Button size="sm" className="flex-1 glow-primary">
                    <ExternalLink className="mr-2 h-4 w-4" />
                    Demo
                  </Button>
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
