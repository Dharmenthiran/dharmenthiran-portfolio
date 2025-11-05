import { motion } from "framer-motion";
import { Calendar, Clock, ArrowRight } from "lucide-react";
import { Card } from "@/components/ui/card";
import { Button } from "@/components/ui/button";

const Blog = () => {
  const articles = [
    {
      title: "Building Scalable APIs with FastAPI",
      excerpt: "Learn how to create high-performance REST APIs using FastAPI, async/await patterns, and best practices for production deployment.",
      date: "Mar 15, 2024",
      readTime: "8 min read",
      category: "Backend",
    },
    {
      title: "Flutter State Management Guide",
      excerpt: "A comprehensive comparison of state management solutions in Flutter - Provider, Riverpod, BLoC, and GetX with real-world examples.",
      date: "Mar 10, 2024",
      readTime: "12 min read",
      category: "Mobile",
    },
    {
      title: "Django Performance Optimization",
      excerpt: "Techniques to optimize Django applications including database queries, caching strategies, and middleware optimization.",
      date: "Mar 5, 2024",
      readTime: "10 min read",
      category: "Backend",
    },
    {
      title: "React Best Practices 2024",
      excerpt: "Modern React patterns, hooks usage, performance optimization, and architectural decisions for scalable applications.",
      date: "Feb 28, 2024",
      readTime: "7 min read",
      category: "Frontend",
    },
    {
      title: "Microservices with Docker",
      excerpt: "Building and deploying microservices architecture using Docker, Docker Compose, and container orchestration.",
      date: "Feb 20, 2024",
      readTime: "15 min read",
      category: "DevOps",
    },
    {
      title: "PostgreSQL Query Optimization",
      excerpt: "Advanced SQL techniques, index strategies, and query planning to improve database performance significantly.",
      date: "Feb 15, 2024",
      readTime: "11 min read",
      category: "Database",
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
            <span className="gradient-text">Blog & Articles</span>
          </h1>
          <p className="text-xl text-muted-foreground max-w-2xl mx-auto">
            Insights, tutorials, and thoughts on software development, best practices, and technology trends
          </p>
        </motion.div>

        <motion.div
          variants={containerVariants}
          initial="hidden"
          animate="visible"
          className="grid md:grid-cols-2 lg:grid-cols-3 gap-6 max-w-7xl mx-auto"
        >
          {articles.map((article, index) => (
            <motion.div
              key={index}
              variants={itemVariants}
              whileHover={{ y: -10 }}
              className="group"
            >
              <Card className="glass p-6 h-full flex flex-col hover:glow-primary transition-all duration-300">
                <div className="flex-1">
                  <div className="flex items-center gap-2 mb-4">
                    <span className="px-3 py-1 text-xs rounded-full bg-primary/20 text-primary border border-primary/30">
                      {article.category}
                    </span>
                  </div>
                  
                  <h3 className="text-xl font-bold mb-3 group-hover:text-primary transition-colors">
                    {article.title}
                  </h3>
                  
                  <p className="text-muted-foreground mb-4">
                    {article.excerpt}
                  </p>
                </div>

                <div className="pt-4 border-t border-border/50">
                  <div className="flex items-center justify-between text-sm text-muted-foreground mb-4">
                    <div className="flex items-center gap-2">
                      <Calendar className="h-4 w-4" />
                      <span>{article.date}</span>
                    </div>
                    <div className="flex items-center gap-2">
                      <Clock className="h-4 w-4" />
                      <span>{article.readTime}</span>
                    </div>
                  </div>
                  
                  <Button variant="ghost" className="w-full group/btn hover:bg-primary/10 hover:text-primary">
                    Read More
                    <ArrowRight className="ml-2 h-4 w-4 group-hover/btn:translate-x-1 transition-transform" />
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

export default Blog;
