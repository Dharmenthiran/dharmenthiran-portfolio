import { motion } from "framer-motion";
import { Code, Database, Smartphone, Cloud, Wrench, Layers } from "lucide-react";
import { Card } from "@/components/ui/card";

const Skills = () => {
  const skillCategories = [
    {
      icon: Code,
      title: "Backend Development",
      skills: [
        { name: "Python", level: 95 },
        { name: "Flask", level: 90 },
        { name: "Django", level: 90 },
        { name: "FastAPI", level: 85 },
        { name: "REST API", level: 90 },
        { name: "JWT", level: 90 },
      ],
    },
    {
      icon: Smartphone,
      title: "Mobile & Desktop",
      skills: [
        { name: "Flutter", level: 85 },
        { name: "Dart", level: 85 },
        { name: "Kivy", level: 80 },
        { name: "PyQT", level: 75 },
      ],
    },
    {
      icon: Code,
      title: "Frontend Development",
      skills: [
        { name: "HTML", level: 95 },
        { name: "CSS", level: 90 },
        { name: "JavaScript", level: 85 },
        { name: "Bootstrap", level: 85 },
      ],
    },
    {
      icon: Cloud,
      title: "Databases",
      skills: [
        { name: "MySQL", level: 85 },
        { name: "SQLite", level: 80 },
      ],
    },
    {
      icon: Database,
      title: "Networking & Communication",
      skills: [
        { name: "WebSocket", level: 80 },
        { name: "TCP/IP", level: 75 },
        { name: "Serial Comm", level: 85 },
      ],
    },

    {
      icon: Wrench,
      title: "DevOps & Tools",
      skills: [
        { name: "Git", level: 90 },
        { name: "Docker", level: 85 },
        { name: "GitHub Actions", level: 85 },
      ],
    },
    {
      icon: Layers,
      title: "Quality Assurance",
      skills: [
        { name: "Flutter Unit Testing", level: 85 },
      ],
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
    hidden: { opacity: 0, scale: 0.8 },
    visible: { opacity: 1, scale: 1 },
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
            <span className="gradient-text">Skills & Expertise</span>
          </h1>
          <p className="text-base sm:text-lg md:text-xl text-muted-foreground max-w-2xl mx-auto px-4">
            A comprehensive overview of my technical skills and proficiency levels
          </p>
        </motion.div>

        <motion.div
          variants={containerVariants}
          initial="hidden"
          animate="visible"
          className="grid md:grid-cols-2 lg:grid-cols-3 gap-6"
        >
          {skillCategories.map((category, index) => (
            <motion.div key={index} variants={itemVariants}>
              <Card className="glass p-6 h-full hover:glow-primary transition-all duration-300">
                <div className="flex items-center gap-3 mb-6">
                  <div className="p-3 rounded-lg bg-primary/20 glow-primary">
                    <category.icon className="h-6 w-6 text-primary" />
                  </div>
                  <h3 className="text-xl font-bold">{category.title}</h3>
                </div>

                <div className="space-y-4">
                  {category.skills.map((skill, skillIndex) => (
                    <div key={skillIndex}>
                      <div className="flex justify-between mb-2">
                        <span className="text-sm font-medium">{skill.name}</span>
                        <span className="text-sm text-muted-foreground">
                          {skill.level}%
                        </span>
                      </div>
                      <div className="h-2 bg-muted rounded-full overflow-hidden">
                        <motion.div
                          initial={{ width: 0 }}
                          animate={{ width: `${skill.level}%` }}
                          transition={{ duration: 1, delay: index * 0.1 + skillIndex * 0.1 }}
                          className="h-full bg-gradient-to-r from-primary via-secondary to-accent glow-primary"
                        />
                      </div>
                    </div>
                  ))}
                </div>
              </Card>
            </motion.div>
          ))}
        </motion.div>
      </div>
    </div>
  );
};

export default Skills;
